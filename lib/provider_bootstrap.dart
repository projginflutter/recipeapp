import 'package:provider/provider.dart';
import 'package:recipeapp/providers/recipes.dart';
import 'package:recipeapp/services/recipe_service.dart';



List<ChangeNotifierProvider> providers = [
  ChangeNotifierProvider(builder: (_) {
    RecipeService _service = new RecipeService('recipes');
    return Recipes(service: _service);
  })
];



