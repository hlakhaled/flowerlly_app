// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'plant_details_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PlantDetailsEntityAdapter extends TypeAdapter<PlantDetailsEntity> {
  @override
  final int typeId = 1;

  @override
  PlantDetailsEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PlantDetailsEntity(
      typeEntity: fields[10] as String,
      idEntity: fields[11] as int,
      originEntity: (fields[7] as List).cast<dynamic>(),
      image: fields[9] as String,
      descriptionEntity: fields[0] as String,
      careLevelEntity: fields[2] as String,
      growthRateEntity: fields[3] as String,
      pruningMonthEntity: (fields[4] as List).cast<dynamic>(),
      propagationEntity: (fields[5] as List).cast<dynamic>(),
      attractsEntity: (fields[6] as List).cast<dynamic>(),
      floweringSeasonEntity: fields[8] as String,
      titleEntity: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, PlantDetailsEntity obj) {
    writer
      ..writeByte(12)
      ..writeByte(0)
      ..write(obj.descriptionEntity)
      ..writeByte(1)
      ..write(obj.titleEntity)
      ..writeByte(2)
      ..write(obj.careLevelEntity)
      ..writeByte(3)
      ..write(obj.growthRateEntity)
      ..writeByte(4)
      ..write(obj.pruningMonthEntity)
      ..writeByte(5)
      ..write(obj.propagationEntity)
      ..writeByte(6)
      ..write(obj.attractsEntity)
      ..writeByte(7)
      ..write(obj.originEntity)
      ..writeByte(8)
      ..write(obj.floweringSeasonEntity)
      ..writeByte(9)
      ..write(obj.image)
      ..writeByte(10)
      ..write(obj.typeEntity)
      ..writeByte(11)
      ..write(obj.idEntity);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PlantDetailsEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
