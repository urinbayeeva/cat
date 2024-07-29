// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cat_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CatImageAdapter extends TypeAdapter<CatImage> {
  @override
  final int typeId = 0;

  @override
  CatImage read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CatImage(
      url: fields[0] as String,
    );
  }

  @override
  void write(BinaryWriter writer, CatImage obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.url);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CatImageAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
