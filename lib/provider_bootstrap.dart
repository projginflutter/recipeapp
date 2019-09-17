import 'package:provider/provider.dart';
import 'package:recipeapp/providers/recipes.dart';
import 'package:recipeapp/services/db_service.dart';



List<ChangeNotifierProvider> providers = [
  ChangeNotifierProvider(builder: (_) {
    DbService _service = new DbService('recipes');
    return Recipes(service: _service);
  })
];



