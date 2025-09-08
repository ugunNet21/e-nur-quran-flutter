// lib/core/di/injection_container.dart - Dependency injection setup
import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:hive_flutter/hive_flutter.dart';

// Data layer
import '../../data/datasources/remote_data_source.dart';
import '../../data/datasources/local_data_source.dart';
import '../../data/repositories/quran_repository_impl.dart';
import '../../data/models/surah_model.dart';
import '../../data/models/ayat_model.dart';

// Domain layer
import '../../domain/repositories/quran_repository.dart';
import '../../domain/usecases/get_all_surah.dart';
import '../../domain/usecases/get_detail_surah.dart';
import '../../domain/usecases/get_tafsir_surah.dart';
import '../../domain/usecases/initialize_offline_data.dart';

// Presentation layer
import '../../presentation/bloc/surah_list/surah_list_bloc.dart';
import '../../presentation/bloc/surah_detail/surah_detail_bloc.dart';
import '../../presentation/bloc/prayer_time/prayer_time_bloc.dart';
import '../../presentation/bloc/quran_audio/quran_audio_bloc.dart';

import '../utils/constants.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // BLoCs
  sl.registerFactory(() => SurahListBloc(
        getAllSurah: sl(),
        initializeOfflineData: sl(),
      ));

  sl.registerFactory(() => SurahDetailBloc(
        getDetailSurah: sl(),
      ));

  sl.registerFactory(() => PrayerTimeBloc());

  sl.registerFactory(() => QuranAudioBloc());

  // Use cases
  sl.registerLazySingleton(() => GetAllSurah(sl()));
  sl.registerLazySingleton(() => GetDetailSurah(sl()));
  sl.registerLazySingleton(() => GetTafsirSurah(sl()));
  sl.registerLazySingleton(() => InitializeOfflineData(sl()));

  // Repository
  sl.registerLazySingleton<QuranRepository>(
    () => QuranRepositoryImpl(
      remoteDataSource: sl(),
      localDataSource: sl(),
      connectivity: sl(),
    ),
  );

  // Data sources
  sl.registerLazySingleton<RemoteDataSource>(
    () => RemoteDataSourceImpl(dio: sl()),
  );

  sl.registerLazySingleton<LocalDataSource>(
    () => LocalDataSourceImpl(
      surahBox: sl<Box<SurahModel>>(instanceName: Constants.surahBoxName),
      ayatBox: sl<Box<AyatModel>>(instanceName: Constants.ayatBoxName),
      settingsBox: sl<Box<dynamic>>(instanceName: Constants.settingsBoxName),
      bookmarkBox: sl<Box<dynamic>>(instanceName: Constants.bookmarkBoxName),
    ),
  );

  // External dependencies
  sl.registerLazySingleton(() => Dio()
    ..options = BaseOptions(
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    ));

  sl.registerLazySingleton(() => Connectivity());

  // Hive boxes, pakai instanceName agar tidak bentrok
  sl.registerLazySingleton<Box<SurahModel>>(
    () => Hive.box<SurahModel>(Constants.surahBoxName),
    instanceName: Constants.surahBoxName,
  );

  sl.registerLazySingleton<Box<AyatModel>>(
    () => Hive.box<AyatModel>(Constants.ayatBoxName),
    instanceName: Constants.ayatBoxName,
  );

  sl.registerLazySingleton<Box<dynamic>>(
    () => Hive.box<dynamic>(Constants.settingsBoxName),
    instanceName: Constants.settingsBoxName,
  );

  sl.registerLazySingleton<Box<dynamic>>(
    () => Hive.box<dynamic>(Constants.bookmarkBoxName),
    instanceName: Constants.bookmarkBoxName,
  );
}
