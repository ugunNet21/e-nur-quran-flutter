// lib/domain/entities/surah.dart - Surah entity for business logic
import 'package:equatable/equatable.dart';

class Surah extends Equatable {
  final int nomor;
  final String nama;
  final String namaLatin;
  final int jumlahAyat;
  final String tempatTurun;
  final String arti;
  final String deskripsi;
  final Map<String, String>? audioFull;

  const Surah({
    required this.nomor,
    required this.nama,
    required this.namaLatin,
    required this.jumlahAyat,
    required this.tempatTurun,
    required this.arti,
    required this.deskripsi,
    this.audioFull,
  });

  bool get isMakki => tempatTurun.toLowerCase() == 'mekah';
  bool get isMadani => tempatTurun.toLowerCase() == 'madinah';

  @override
  List<Object?> get props => [
    nomor,
    nama,
    namaLatin,
    jumlahAyat,
    tempatTurun,
    arti,
    deskripsi,
    audioFull,
  ];
}
