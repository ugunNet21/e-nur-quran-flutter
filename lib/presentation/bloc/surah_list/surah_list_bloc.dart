// lib/presentation/bloc/surah_list/surah_list_bloc.dart - BLoC for surah list management
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../domain/entities/surah.dart';
import '../../../domain/usecases/get_all_surah.dart';
import '../../../domain/usecases/initialize_offline_data.dart';
import '../../../core/usecase/usecase.dart';

// Events
abstract class SurahListEvent extends Equatable {
  const SurahListEvent();

  @override
  List<Object> get props => [];
}

class GetAllSurahEvent extends SurahListEvent {}

class InitializeOfflineDataEvent extends SurahListEvent {}

// States
abstract class SurahListState extends Equatable {
  const SurahListState();

  @override
  List<Object> get props => [];
}

class SurahListInitial extends SurahListState {}

class SurahListLoading extends SurahListState {}

class SurahListLoaded extends SurahListState {
  final List<Surah> surahList;

  const SurahListLoaded({required this.surahList});

  @override
  List<Object> get props => [surahList];
}

class SurahListError extends SurahListState {
  final String message;

  const SurahListError({required this.message});

  @override
  List<Object> get props => [message];
}

// BLoC
class SurahListBloc extends Bloc<SurahListEvent, SurahListState> {
  final GetAllSurah getAllSurah;
  final InitializeOfflineData initializeOfflineData;

  SurahListBloc({
    required this.getAllSurah,
    required this.initializeOfflineData,
  }) : super(SurahListInitial()) {
    on<GetAllSurahEvent>(_onGetAllSurah);
    on<InitializeOfflineDataEvent>(_onInitializeOfflineData);
  }

  Future<void> _onGetAllSurah(
    GetAllSurahEvent event,
    Emitter<SurahListState> emit,
  ) async {
    emit(SurahListLoading());
    
    final result = await getAllSurah(NoParams());
    
    result.fold(
      (failure) => emit(SurahListError(message: failure.message)),
      (surahList) => emit(SurahListLoaded(surahList: surahList)),
    );
  }

  Future<void> _onInitializeOfflineData(
    InitializeOfflineDataEvent event,
    Emitter<SurahListState> emit,
  ) async {
    emit(SurahListLoading());
    
    final result = await initializeOfflineData(NoParams());
    
    result.fold(
      (failure) => emit(SurahListError(message: failure.message)),
      (success) {
        // After initialization, load the surah list
        add(GetAllSurahEvent());
      },
    );
  }
}