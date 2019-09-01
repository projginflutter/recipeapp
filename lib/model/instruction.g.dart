// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'instruction.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Instruction _$InstructionFromJson(Map<String, dynamic> json) {
  return Instruction(json['stepNumber'] as int, json['instruction'] as String);
}

Map<String, dynamic> _$InstructionToJson(Instruction instance) =>
    <String, dynamic>{
      'stepNumber': instance.stepNumber,
      'instruction': instance.instruction
    };
