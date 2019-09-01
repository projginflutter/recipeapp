import 'package:flutter/material.dart';
import 'package:recipeapp/services/recipe_service.dart';
import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:recipeapp/model/recipe.dart';
import 'package:recipeapp/model/ingredient.dart';
import 'package:recipeapp/model/instruction.dart';

class Recipes extends ChangeNotifier {

  bool _busy = false;
  RecipeService _service;
  bool get busy => _busy;

  void setBusy(bool value) {
    _busy = value;
    notifyListeners();
  }

  Recipes({
    @required RecipeService service,
  }) : _service = service;


  Future getPosts(int userId) async {
    setBusy(true);
    QuerySnapshot snapshot = await _service.getDataCollection();
    setBusy(false);
    return snapshot;
  }

//  void addRecipe () {
//    Recipe recipe = Recipe(
//        id: 2,
//        name: 'Sambar Rice',
//        imageAssetPath:  'assets/images/plates/plate2.png',
//        category: Category.lunch,
//        shortDescription: 'Sambar rice.',
//        vitaminAPercentage: 0,
//        vitaminCPercentage: 0,
//        servingSize: 'One serving of sambar Rice',
//        caloriesPerServing: 500,
//        ingredients: [
//          Ingredient(
//            'Rice',
//            100,
//            'oz',
//          ),
//          Ingredient(
//            'Sambar',
//            2,
//            'oz',
//          ),
//        ],
//        steps: [
//          Instruction(
//              1,
//              "Mix Rice and Sambhar"
//          )
//        ]
//    );
//    print (recipe.toJson());
//    _service.addDocument(recipe.toJson());
//  }
}
