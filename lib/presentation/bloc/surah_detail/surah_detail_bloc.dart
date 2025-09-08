// lib/presentation/bloc/surah_detail/surah_detail_bloc.dart - BLoC for surah detail management
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../domain/entities/detail_surah.dart';
import '../../../domain/usecases/get_detail_surah.dart';

// Events
abstract class SurahDetailEvent extends Equatable {
  const SurahDetailEvent();

  @override
  List<Object> get props => [];
}

class GetSurahDetailEvent extends SurahDetailEvent {
  final int surahNumber;

  const GetSurahDetailEvent(this.surahNumber);

  @override
  List<Object> get props => [surahNumber];
}

// States
abstract class SurahDetailState extends Equatable {
  const SurahDetailState();

  @override
  List<Object> get props => [];
}

class SurahDetailInitial extends SurahDetailState {}

class SurahDetailLoading extends SurahDetailState {}

class SurahDetailLoaded extends SurahDetailState {
  final DetailSurah detailSurah;

  const SurahDetailLoaded({required this.detailSurah});

  @override
  List<Object> get props => [detailSurah];
}

class SurahDetailError extends SurahDetailState {
  final String message;

  const SurahDetailError({required this.message});

  @override
  List<Object> get props => [message];
}

// BLoC
class SurahDetailBloc extends Bloc<SurahDetailEvent, SurahDetailState> {
  final GetDetailSurah getDetailSurah;

  SurahDetailBloc({
    required this.getDetailSurah,
  }) : super(SurahDetailInitial()) {
    on<GetSurahDetailEvent>(_onGetSurahDetail);
  }

  Future<void> _onGetSurahDetail(
    GetSurahDetailEvent event,
    Emitter<SurahDetailState> emit,
  ) async {
    emit(SurahDetailLoading());
    
    final result = await getDetailSurah(Params(surahNumber: event.surahNumber));
    
    result.fold(
      (failure) => emit(SurahDetailError(message: failure.message)),
      (detailSurah) => emit(SurahDetailLoaded(detailSurah: detailSurah)),
    );
  }
}
