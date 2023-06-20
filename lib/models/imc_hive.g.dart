// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'imc_hive.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ImcHiveAdapter extends TypeAdapter<ImcHive> {
  @override
  final int typeId = 0;

  @override
  ImcHive read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ImcHive(
      weight: fields[0] as double,
      height: fields[1] as double,
      imc: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, ImcHive obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.weight)
      ..writeByte(1)
      ..write(obj.height)
      ..writeByte(2)
      ..write(obj.imc);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImcHiveAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
