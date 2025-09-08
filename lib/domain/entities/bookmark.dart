// lib/domain/entities/bookmark.dart - Bookmark entity
import 'package:equatable/equatable.dart';

class Bookmark extends Equatable {
  final int surahNumber;
  final int ayatNumber;
  final String surahName;
  final String ayatText;
  final DateTime createdAt;

  const Bookmark({
    required this.surahNumber,
    required this.ayatNumber,
    required this.surahName,
    required this.ayatText,
    required this.createdAt,
  });

  @override
  List<Object?> get props => [
    surahNumber,
    ayatNumber,
    surahName,
    ayatText,
    createdAt,
  ];
}