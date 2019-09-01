import 'package:json_annotation/json_annotation.dart';
part 'instruction.g.dart';

@JsonSerializable()
class Instruction {
  Instruction (this.stepNumber,this.instruction);
  int stepNumber;
  String instruction;
  factory Instruction.fromJson(Map<String, dynamic> json) => _$InstructionFromJson(json);
  Map<String, dynamic> toJson() => _$InstructionToJson(this);
}