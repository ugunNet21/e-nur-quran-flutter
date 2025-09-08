// lib/domain/usecases/initialize_offline_data.dart - Use case for offline data initialization
import 'package:dartz/dartz.dart';
import '../../core/error/failure.dart';
import '../../core/usecase/usecase.dart';
import '../repositories/quran_repository.dart';

class InitializeOfflineData implements UseCase<bool, NoParams> {
  final QuranRepository repository;

  InitializeOfflineData(this.repository);

  @override
  Future<Either<Failure, bool>> call(NoParams params) async {
    return await repository.initializeOfflineData();
  }
}