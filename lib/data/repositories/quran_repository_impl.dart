// lib/data/repositories/quran_repository_impl.dart - Repository implementation
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';

import '../../core/error/exception.dart';
import '../../core/error/failure.dart';
import '../../domain/entities/surah.dart';
import '../../domain/entities/detail_surah.dart';
import '../../domain/entities/tafsir.dart';
import '../../domain/repositories/quran_repository.dart';
import '../datasources/local_data_source.dart';
import '../datasources/remote_data_source.dart';

class QuranRepositoryImpl implements QuranRepository {
  final RemoteDataSource remoteDataSource;
  final LocalDataSource localDataSource;
  final Connectivity connectivity;

  QuranRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.connectivity,
  });

  @override
  Future<Either<Failure, List<Surah>>> getAllSurah() async {
    try {
      // Try to get from local first
      try {
        final localSurahList = await localDataSource.getCachedSurahList();
        if (localSurahList.isNotEmpty) {
          return Right(localSurahList.map((model) => model.toDomain()).toList());
        }
      } catch (e) {
        // If local data is not available, try remote
      }

      // Check internet connection
      final connectivityResult = await connectivity.checkConnectivity();
      if (connectivityResult == ConnectivityResult.none) {
        return const Left(NetworkFailure('No internet connection'));
      }

      // Fetch from remote
      final remoteSurahList = await remoteDataSource.getAllSurah();
      
      // Cache the data
      await localDataSource.cacheSurahList(remoteSurahList);
      
      return Right(remoteSurahList.map((model) => model.toDomain()).toList());
    } on NetworkException catch (e) {
      return Left(NetworkFailure(e.message));
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } on CacheException catch (e) {
      return Left(CacheFailure(e.message));
    } catch (e) {
      return Left(UnknownFailure('Unexpected error: $e'));
    }
  }

  @override
  Future<Either<Failure, DetailSurah>> getSurahDetail(int surahNumber) async {
    try {
      // Try to get from local first
      final isCached = await localDataSource.isSurahCached(surahNumber);
      if (isCached) {
        final localAyatList = await localDataSource.getCachedSurahDetail(surahNumber);
        final localSurahList = await localDataSource.getCachedSurahList();
        final surah = localSurahList.firstWhere((s) => s.nomor == surahNumber);
        
        return Right(DetailSurah(
          surah: surah.toDomain(),
          ayat: localAyatList.map((model) => model.toDomain()).toList(),
        ));
      }

      // Check internet connection
      final connectivityResult = await connectivity.checkConnectivity();
      if (connectivityResult == ConnectivityResult.none) {
        return const Left(NetworkFailure('No internet connection and data not cached'));
      }

      // Fetch from remote
      final remoteAyatList = await remoteDataSource.getSurahDetail(surahNumber);
      final remoteSurahList = await remoteDataSource.getAllSurah();
      final surah = remoteSurahList.firstWhere((s) => s.nomor == surahNumber);
      
      // Cache the data
      await localDataSource.cacheSurahDetail(surahNumber, remoteAyatList);
      
      return Right(DetailSurah(
        surah: surah.toDomain(),
        ayat: remoteAyatList.map((model) => model.toDomain()).toList(),
      ));
    } on NetworkException catch (e) {
      return Left(NetworkFailure(e.message));
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } on CacheException catch (e) {
      return Left(CacheFailure(e.message));
    } catch (e) {
      return Left(UnknownFailure('Unexpected error: $e'));
    }
  }

  @override
  Future<Either<Failure, List<Tafsir>>> getTafsirSurah(int surahNumber) async {
    try {
      // Check internet connection
      final connectivityResult = await connectivity.checkConnectivity();
      if (connectivityResult == ConnectivityResult.none) {
        return const Left(NetworkFailure('No internet connection'));
      }

      final tafsirList = await remoteDataSource.getTafsirSurah(surahNumber);
      return Right(tafsirList.map((model) => model.toDomain()).toList());
    } on NetworkException catch (e) {
      return Left(NetworkFailure(e.message));
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      return Left(UnknownFailure('Unexpected error: $e'));
    }
  }

  @override
  Future<Either<Failure, bool>> initializeOfflineData() async {
    try {
      final isInitialized = await localDataSource.isDataInitialized();
      if (isInitialized) {
        return const Right(true);
      }

      // Check internet connection
      final connectivityResult = await connectivity.checkConnectivity();
      if (connectivityResult == ConnectivityResult.none) {
        return const Left(NetworkFailure('No internet connection for initial setup'));
      }

      // Download and cache all surahs
      final surahList = await remoteDataSource.getAllSurah();
      await localDataSource.cacheSurahList(surahList);

      // Download and cache first few surahs (Al-Fatihah, Al-Baqarah, etc.)
      final prioritySurahs = [1, 2, 18, 36, 67]; // Common surahs
      for (final surahNumber in prioritySurahs) {
        try {
          final ayatList = await remoteDataSource.getSurahDetail(surahNumber);
          await localDataSource.cacheSurahDetail(surahNumber, ayatList);
        } catch (e) {
          // Continue with other surahs if one fails
        }
      }

      await localDataSource.markDataAsInitialized();
      return const Right(true);
    } on NetworkException catch (e) {
      return Left(NetworkFailure(e.message));
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } on CacheException catch (e) {
      return Left(CacheFailure(e.message));
    } catch (e) {
      return Left(UnknownFailure('Unexpected error: $e'));
    }
  }
}