// lib/domain/entities/detail_surah.dart - Detail Surah entity combining surah info and ayats
import 'package:equatable/equatable.dart';
import 'surah.dart';
import 'ayat.dart';

class DetailSurah extends Equatable {
  final Surah surah;
  final List<Ayat> ayat;

  const DetailSurah({
    required this.surah,
    required this.ayat,
  });

  @override
  List<Object?> get props => [surah, ayat];
}