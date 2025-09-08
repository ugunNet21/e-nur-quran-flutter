// lib/domain/entities/tafsir.dart - Tafsir entity for business logic
import 'package:equatable/equatable.dart';

class Tafsir extends Equatable {
  final int ayat;
  final String teks;

  const Tafsir({
    required this.ayat,
    required this.teks,
  });

  @override
  List<Object?> get props => [ayat, teks];
}