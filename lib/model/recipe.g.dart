// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Recipe _$RecipeFromJson(Map<String, dynamic> json) {
  return Recipe(
      id: json['id'] as int,
      name: json['name'] as String,
      imageAssetPath: json['imageAssetPath'] as String,
      ingredients: (json['ingredients'] as List)
          ?.map((e) =>
              e == null ? null : Ingredient.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      steps: (json['steps'] as List)
          ?.map((e) => e == null
              ? null
              : Instruction.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      servingSize: json['servingSize'] as String,
      caloriesPerServing: json['caloriesPerServing'] as int,
      category: _$enumDecodeNullable(_$CategoryEnumMap, json['category']),
      shortDescription: json['shortDescription'] as String,
      vitaminAPercentage: json['vitaminAPercentage'] as int,
      vitaminCPercentage: json['vitaminCPercentage'] as int);
}

Map<String, dynamic> _$RecipeToJson(Recipe instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'imageAssetPath': instance.imageAssetPath,
      'ingredients': instance.ingredients?.map((e) => e?.toJson())?.toList(),
      'steps': instance.steps?.map((e) => e?.toJson())?.toList(),
      'shortDescription': instance.shortDescription,
      'vitaminAPercentage': instance.vitaminAPercentage,
      'vitaminCPercentage': instance.vitaminCPercentage,
      'servingSize': instance.servingSize,
      'caloriesPerServing': instance.caloriesPerServing,
      'category': _$CategoryEnumMap[instance.category]
    };

T _$enumDecode<T>(Map<T, dynamic> enumValues, dynamic source) {
  if (source == null) {
    throw ArgumentError('A value must be provided. Supported values: '
        '${enumValues.values.join(', ')}');
  }
  return enumValues.entries
      .singleWhere((e) => e.value == source,
          orElse: () => throw ArgumentError(
              '`$source` is not one of the supported values: '
              '${enumValues.values.join(', ')}'))
      .key;
}

T _$enumDecodeNullable<T>(Map<T, dynamic> enumValues, dynamic source) {
  if (source == null) {
    return null;
  }
  return _$enumDecode<T>(enumValues, source);
}

const _$CategoryEnumMap = <Category, dynamic>{
  Category.breakfast: 'breakfast',
  Category.lunch: 'lunch',
  Category.dinner: 'dinner',
  Category.snacks: 'snacks'
};
