// lib/data/models/surah_model.dart - Surah data model with Hive adapter
import 'package:hive/hive.dart';
import 'package:equatable/equatable.dart';
import '../../domain/entities/surah.dart';

part 'surah_model.g.dart'; // Generated file

@HiveType(typeId: 0)
class SurahModel extends HiveObject with EquatableMixin {
  @HiveField(0)
  final int nomor;

  @HiveField(1)
  final String nama;

  @HiveField(2)
  final String namaLatin;

  @HiveField(3)
  final int jumlahAyat;

  @HiveField(4)
  final String tempatTurun;

  @HiveField(5)
  final String arti;

  @HiveField(6)
  final String deskripsi;

  @HiveField(7)
  final Map<String, String>? audioFull;

  SurahModel({
    required this.nomor,
    required this.nama,
    required this.namaLatin,
    required this.jumlahAyat,
    required this.tempatTurun,
    required this.arti,
    required this.deskripsi,
    this.audioFull,
  });

  // Factory constructor from JSON
  factory SurahModel.fromJson(Map<String, dynamic> json) {
    return SurahModel(
      nomor: json['nomor'] as int,
      nama: json['nama'] as String,
      namaLatin: json['namaLatin'] as String,
      jumlahAyat: json['jumlahAyat'] as int,
      tempatTurun: json['tempatTurun'] as String,
      arti: json['arti'] as String,
      deskripsi: json['deskripsi'] as String,
      audioFull: json['audioFull'] != null
          ? Map<String, String>.from(json['audioFull'])
          : null,
    );
  }

  // Convert to JSON
  Map<String, dynamic> toJson() {
    return {
      'nomor': nomor,
      'nama': nama,
      'namaLatin': namaLatin,
      'jumlahAyat': jumlahAyat,
      'tempatTurun': tempatTurun,
      'arti': arti,
      'deskripsi': deskripsi,
      'audioFull': audioFull,
    };
  }

  // Convert to domain entity
  Surah toDomain() {
    return Surah(
      nomor: nomor,
      nama: nama,
      namaLatin: namaLatin,
      jumlahAyat: jumlahAyat,
      tempatTurun: tempatTurun,
      arti: arti,
      deskripsi: deskripsi,
      audioFull: audioFull,
    );
  }

  // Create from domain entity
  factory SurahModel.fromDomain(Surah surah) {
    return SurahModel(
      nomor: surah.nomor,
      nama: surah.nama,
      namaLatin: surah.namaLatin,
      jumlahAyat: surah.jumlahAyat,
      tempatTurun: surah.tempatTurun,
      arti: surah.arti,
      deskripsi: surah.deskripsi,
      audioFull: surah.audioFull,
    );
  }

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
