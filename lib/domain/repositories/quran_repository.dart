// lib/domain/repositories/quran_repository.dart - Repository interface
import 'package:dartz/dartz.dart';
import '../../core/error/failure.dart';
import '../entities/surah.dart';
import '../entities/detail_surah.dart';
import '../entities/tafsir.dart';

abstract class QuranRepository {
  Future<Either<Failure, List<Surah>>> getAllSurah();
  Future<Either<Failure, DetailSurah>> getSurahDetail(int surahNumber);
  Future<Either<Failure, List<Tafsir>>> getTafsirSurah(int surahNumber);
  Future<Either<Failure, bool>> initializeOfflineData();
}