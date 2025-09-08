// lib/domain/entities/last_read.dart - Last read position entity
import 'package:equatable/equatable.dart';

class LastRead extends Equatable {
  final int surahNumber;
  final int ayatNumber;
  final String surahName;
  final DateTime lastReadAt;

  const LastRead({
    required this.surahNumber,
    required this.ayatNumber,
    required this.surahName,
    required this.lastReadAt,
  });

  @override
  List<Object?> get props => [
    surahNumber,
    ayatNumber,
    surahName,
    lastReadAt,
  ];
}