// lib/presentation/bloc/prayer_time/prayer_time_bloc.dart - BLoC for prayer times
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

// Events
abstract class PrayerTimeEvent extends Equatable {
  const PrayerTimeEvent();

  @override
  List<Object> get props => [];
}

class GetPrayerTimesEvent extends PrayerTimeEvent {}

// States
abstract class PrayerTimeState extends Equatable {
  const PrayerTimeState();

  @override
  List<Object> get props => [];
}

class PrayerTimeInitial extends PrayerTimeState {}

class PrayerTimeLoading extends PrayerTimeState {}

class PrayerTimeLoaded extends PrayerTimeState {
  final Map<String, String> prayerTimes;

  const PrayerTimeLoaded({required this.prayerTimes});

  @override
  List<Object> get props => [prayerTimes];
}

class PrayerTimeError extends PrayerTimeState {
  final String message;

  const PrayerTimeError({required this.message});

  @override
  List<Object> get props => [message];
}

// BLoC
class PrayerTimeBloc extends Bloc<PrayerTimeEvent, PrayerTimeState> {
  PrayerTimeBloc() : super(PrayerTimeInitial()) {
    on<GetPrayerTimesEvent>(_onGetPrayerTimes);
  }

  Future<void> _onGetPrayerTimes(
    GetPrayerTimesEvent event,
    Emitter<PrayerTimeState> emit,
  ) async {
    emit(PrayerTimeLoading());
    
    // For demo purposes, return static prayer times
    await Future.delayed(const Duration(seconds: 1));
    
    emit(PrayerTimeLoaded(prayerTimes: {
      'Subuh': '04:30',
      'Dzuhur': '12:15',
      'Ashar': '15:30',
      'Maghrib': '18:05',
      'Isya': '19:20',
    }));
  }
}