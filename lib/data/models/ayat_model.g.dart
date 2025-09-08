// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ayat_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AyatModelAdapter extends TypeAdapter<AyatModel> {
  @override
  final int typeId = 1;

  @override
  AyatModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AyatModel(
      nomorAyat: fields[0] as int,
      teksArab: fields[1] as String,
      teksLatin: fields[2] as String,
      teksIndonesia: fields[3] as String,
      audio: (fields[4] as Map?)?.cast<String, String>(),
      surahNumber: fields[5] as int,
    );
  }

  @override
  void write(BinaryWriter writer, AyatModel obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.nomorAyat)
      ..writeByte(1)
      ..write(obj.teksArab)
      ..writeByte(2)
      ..write(obj.teksLatin)
      ..writeByte(3)
      ..write(obj.teksIndonesia)
      ..writeByte(4)
      ..write(obj.audio)
      ..writeByte(5)
      ..write(obj.surahNumber);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AyatModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
