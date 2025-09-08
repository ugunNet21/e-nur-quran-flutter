// lib/domain/entities/prayer_time.dart - Prayer time entity
import 'package:equatable/equatable.dart';

class PrayerTime extends Equatable {
  final DateTime fajr;
  final DateTime sunrise;
  final DateTime dhuhr;
  final DateTime asr;
  final DateTime maghrib;
  final DateTime isha;
  final String location;
  final DateTime date;

  const PrayerTime({
    required this.fajr,
    required this.sunrise,
    required this.dhuhr,
    required this.asr,
    required this.maghrib,
    required this.isha,
    required this.location,
    required this.date,
  });

  List<DateTime> get allPrayerTimes => [
    fajr,
    sunrise,
    dhuhr,
    asr,
    maghrib,
    isha,
  ];

  @override
  List<Object?> get props => [
    fajr,
    sunrise,
    dhuhr,
    asr,
    maghrib,
    isha,
    location,
    date,
  ];
}