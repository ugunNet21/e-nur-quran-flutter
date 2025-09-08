// lib/presentation/bloc/quran_audio/quran_audio_bloc.dart - BLoC for audio playback
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

// Events
abstract class QuranAudioEvent extends Equatable {
  const QuranAudioEvent();

  @override
  List<Object> get props => [];
}

class PlaySurahEvent extends QuranAudioEvent {
  final int surahNumber;

  const PlaySurahEvent(this.surahNumber);

  @override
  List<Object> get props => [surahNumber];
}

class PlayAyatEvent extends QuranAudioEvent {
  final int surahNumber;
  final int ayatNumber;

  const PlayAyatEvent(this.surahNumber, this.ayatNumber);

  @override
  List<Object> get props => [surahNumber, ayatNumber];
}

class PauseAudioEvent extends QuranAudioEvent {}

class StopAudioEvent extends QuranAudioEvent {}

// States
abstract class QuranAudioState extends Equatable {
  const QuranAudioState();

  @override
  List<Object> get props => [];
}

class QuranAudioInitial extends QuranAudioState {}

class QuranAudioLoading extends QuranAudioState {}

class QuranAudioPlaying extends QuranAudioState {
  final int surahNumber;
  final int? ayatNumber;

  const QuranAudioPlaying({
    required this.surahNumber,
    this.ayatNumber,
  });

  @override
  List<Object> get props => [surahNumber, ayatNumber ?? 0];
}

class QuranAudioPaused extends QuranAudioState {}

class QuranAudioStopped extends QuranAudioState {}

class QuranAudioError extends QuranAudioState {
  final String message;

  const QuranAudioError({required this.message});

  @override
  List<Object> get props => [message];
}

// BLoC
class QuranAudioBloc extends Bloc<QuranAudioEvent, QuranAudioState> {
  QuranAudioBloc() : super(QuranAudioInitial()) {
    on<PlaySurahEvent>(_onPlaySurah);
    on<PlayAyatEvent>(_onPlayAyat);
    on<PauseAudioEvent>(_onPauseAudio);
    on<StopAudioEvent>(_onStopAudio);
  }

  Future<void> _onPlaySurah(
    PlaySurahEvent event,
    Emitter<QuranAudioState> emit,
  ) async {
    emit(QuranAudioLoading());

    // Simulate audio loading
    await Future.delayed(const Duration(milliseconds: 500));

    emit(QuranAudioPlaying(surahNumber: event.surahNumber));
  }

  Future<void> _onPlayAyat(
    PlayAyatEvent event,
    Emitter<QuranAudioState> emit,
  ) async {
    emit(QuranAudioLoading());

    // Simulate audio loading
    await Future.delayed(const Duration(milliseconds: 500));

    emit(QuranAudioPlaying(
      surahNumber: event.surahNumber,
      ayatNumber: event.ayatNumber,
    ));
  }

  Future<void> _onPauseAudio(
    PauseAudioEvent event,
    Emitter<QuranAudioState> emit,
  ) async {
    emit(QuranAudioPaused());
  }

  Future<void> _onStopAudio(
    StopAudioEvent event,
    Emitter<QuranAudioState> emit,
  ) async {
    emit(QuranAudioStopped());
  }
}
