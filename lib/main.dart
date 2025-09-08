// lib/main.dart - Application entry point and dependency injection setup
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';

import 'core/di/injection_container.dart' as di;
import 'core/theme/app_theme.dart';
import 'core/utils/constants.dart';
import 'data/models/surah_model.dart';
import 'data/models/ayat_model.dart';
import 'presentation/bloc/surah_list/surah_list_bloc.dart';
import 'presentation/bloc/surah_detail/surah_detail_bloc.dart';
import 'presentation/bloc/prayer_time/prayer_time_bloc.dart';
import 'presentation/bloc/quran_audio/quran_audio_bloc.dart';
import 'presentation/pages/splash_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Initialize Hive database
  await Hive.initFlutter();
  
  // Register Hive adapters
  Hive.registerAdapter(SurahModelAdapter());
  Hive.registerAdapter(AyatModelAdapter());
  
  // Open Hive boxes
  await Hive.openBox<SurahModel>(Constants.surahBoxName);
  await Hive.openBox<AyatModel>(Constants.ayatBoxName);
  await Hive.openBox(Constants.settingsBoxName);
  await Hive.openBox(Constants.bookmarkBoxName);
  
  // Initialize dependency injection
  await di.init();
  
  // Set system UI overlay style
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ),
  );
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<SurahListBloc>(
          create: (_) => di.sl<SurahListBloc>(),
        ),
        BlocProvider<SurahDetailBloc>(
          create: (_) => di.sl<SurahDetailBloc>(),
        ),
        BlocProvider<PrayerTimeBloc>(
          create: (_) => di.sl<PrayerTimeBloc>(),
        ),
        BlocProvider<QuranAudioBloc>(
          create: (_) => di.sl<QuranAudioBloc>(),
        ),
      ],
      child: MaterialApp(
        title: 'E-Nur Quran',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        themeMode: ThemeMode.system,
        home: const SplashPage(),
      ),
    );
  }
}