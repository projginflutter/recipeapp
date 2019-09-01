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


  Future getRecipes() async {
    setBusy(true);
    QuerySnapshot snapshot = await _service.getDataCollection();
    setBusy(false);
    return snapshot;
  }

  Stream<QuerySnapshot> getRecipeStream() {
    Stream<QuerySnapshot> snapshots =  _service.streamDataCollection();
    return snapshots;
  }

//  void addRecipe () {
//    Recipe recipe = Recipe(
//        id: 6,
//        name: 'Masala Dosa',
//        imageAssetPath:  'assets/images/plates/plate6.png',
//        category: Category.lunch,
//        shortDescription: 'Masala Dosa',
//        vitaminAPercentage: 0,
//        vitaminCPercentage: 0,
//        servingSize: '3 serving of Dosal',
//        caloriesPerServing: 1500,
//        ingredients: [
//          Ingredient(
//            'Dosa',
//            200,
//            'oz',
//          ),
//          Ingredient(
//            'Vegetables',
//            2,
//            'oz',
//          ),
//        ],
//        steps: [
//          Instruction(
//              1,
//              "Mix Masala, Dosa and Chutney"
//          )
//        ]
//    );
//    print (recipe.toJson());
//    _service.addDocument(recipe.toJson());
//  }
}
