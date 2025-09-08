// lib/domain/entities/ayat.dart - Ayat entity for business logic
import 'package:equatable/equatable.dart';

class Ayat extends Equatable {
  final int nomorAyat;
  final String teksArab;
  final String teksLatin;
  final String teksIndonesia;
  final Map<String, String>? audio;

  const Ayat({
    required this.nomorAyat,
    required this.teksArab,
    required this.teksLatin,
    required this.teksIndonesia,
    this.audio,
  });

  @override
  List<Object?> get props => [
    nomorAyat,
    teksArab,
    teksLatin,
    teksIndonesia,
    audio,
  ];
}