import 'package:json_annotation/json_annotation.dart';
part 'ingredient.g.dart';

@JsonSerializable()
class Ingredient {
  Ingredient (this.name, this.amount, this.unit);
  String name;
  int amount;
  String unit;
  factory Ingredient.fromJson(Map<String, dynamic> json) => _$IngredientFromJson(json);
  Map<String, dynamic> toJson() => _$IngredientToJson(this);
}