// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:recipeapp/model/ingredient.dart';
import 'package:recipeapp/model/instruction.dart';

part 'recipe.g.dart';

enum Category {
  breakfast,
  lunch,
  dinner,
  snacks,
}

const Map<Category, String> foodCategoryNames = {
  Category.breakfast : "Breakfast",
  Category.lunch : "Lunch",
  Category.dinner : "Dinner",
  Category.snacks : "Snacks",
};

@JsonSerializable(explicitToJson:true)
class Recipe {

  Recipe({
    @required this.id,
    @required this.name,
    @required this.imageAssetPath,
    @required this.ingredients,
    @required this.steps,
    @required this.servingSize,
    @required this.caloriesPerServing,
    @required this.category,
    this.shortDescription = "No Short Description Available",
    this.vitaminAPercentage = 0,
    this.vitaminCPercentage = 0 ,
  });

  final int id;

  final String name;

  final String imageAssetPath;

  final List<Ingredient> ingredients;

  final List<Instruction> steps;

  final String shortDescription;

  /// Percentage of the FDA's recommended daily value of vitamin A for someone
  /// with a 2,000 calorie diet.
  final int vitaminAPercentage;

  /// Percentage of the FDA's recommended daily value of vitamin C for someone
  /// with a 2,000 calorie diet.
  final int vitaminCPercentage;

  /// A text description of a single serving (e.g. '1 apple' or '1/2 cup').
  final String servingSize;

  /// Calories per serving (as described in [servingSize]).
  final int caloriesPerServing;

  Category category;

  String get categoryName => foodCategoryNames[category];

  factory Recipe.fromJson(Map<String, dynamic> json) => _$RecipeFromJson(json);
  Map<String, dynamic> toJson() => _$RecipeToJson(this);
}