// lib/domain/usecases/get_tafsir_surah.dart - Use case for getting surah tafsir
import 'package:dartz/dartz.dart';
import '../../core/error/failure.dart';
import '../../core/usecase/usecase.dart';
import '../entities/tafsir.dart';
import '../repositories/quran_repository.dart';

class GetTafsirSurah implements UseCase<List<Tafsir>, TafsirParams> {
  final QuranRepository repository;

  GetTafsirSurah(this.repository);

  @override
  Future<Either<Failure, List<Tafsir>>> call(TafsirParams params) async {
    return await repository.getTafsirSurah(params.surahNumber);
  }
}

class TafsirParams {
  final int surahNumber;

  TafsirParams(this.surahNumber);
}
