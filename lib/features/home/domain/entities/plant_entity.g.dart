// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'plant_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PlantEntityAdapter extends TypeAdapter<PlantEntity> {
  @override
  final int typeId = 0;

  @override
  PlantEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PlantEntity(
      image: fields[0] as String,
      title: fields[1] as String,
      pId: fields[2] as int,
      isFavourit: fields[3] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, PlantEntity obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.image)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.pId)
      ..writeByte(3)
      ..write(obj.isFavourit);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PlantEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
