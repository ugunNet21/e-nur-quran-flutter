// lib/data/models/tafsir_model.dart - Tafsir data model
import 'package:equatable/equatable.dart';
import '../../domain/entities/tafsir.dart';

class TafsirModel with EquatableMixin {
  final int ayat;
  final String teks;

  const TafsirModel({
    required this.ayat,
    required this.teks,
  });

  // Factory constructor from JSON
  factory TafsirModel.fromJson(Map<String, dynamic> json) {
    return TafsirModel(
      ayat: json['ayat'] as int,
      teks: json['teks'] as String,
    );
  }

  // Convert to JSON
  Map<String, dynamic> toJson() {
    return {
      'ayat': ayat,
      'teks': teks,
    };
  }

  // Convert to domain entity
  Tafsir toDomain() {
    return Tafsir(
      ayat: ayat,
      teks: teks,
    );
  }

  // Create from domain entity
  factory TafsirModel.fromDomain(Tafsir tafsir) {
    return TafsirModel(
      ayat: tafsir.ayat,
      teks: tafsir.teks,
    );
  }

  @override
  List<Object?> get props => [ayat, teks];
}