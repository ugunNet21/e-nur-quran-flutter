// lib/domain/usecases/get_detail_surah.dart - Use case for getting surah details
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../../core/error/failure.dart';
import '../../core/usecase/usecase.dart';
import '../entities/detail_surah.dart';
import '../repositories/quran_repository.dart';

class GetDetailSurah implements UseCase<DetailSurah, Params> {
  final QuranRepository repository;

  GetDetailSurah(this.repository);

  @override
  Future<Either<Failure, DetailSurah>> call(Params params) async {
    return await repository.getSurahDetail(params.surahNumber);
  }
}

class Params extends Equatable {
  final int surahNumber;

  const Params({required this.surahNumber});

  @override
  List<Object> get props => [surahNumber];
}
