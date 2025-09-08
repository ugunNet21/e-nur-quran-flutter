// lib/domain/usecases/get_all_surah.dart - Use case for getting all surahs
import 'package:dartz/dartz.dart';
import '../../core/error/failure.dart';
import '../../core/usecase/usecase.dart';
import '../entities/surah.dart';
import '../repositories/quran_repository.dart';

class GetAllSurah implements UseCase<List<Surah>, NoParams> {
  final QuranRepository repository;

  GetAllSurah(this.repository);

  @override
  Future<Either<Failure, List<Surah>>> call(NoParams params) async {
    return await repository.getAllSurah();
  }
}