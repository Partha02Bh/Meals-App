import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mealsapp3/models/meal.dart';

class FavouriteMealsNotifier extends StateNotifier<List<Meal>> {
  FavouriteMealsNotifier() : super([]);

  bool toggleMealFavoriteStatus(Meal meal) {
    final mealIsFavourite = state.contains(meal);
    if(mealIsFavourite) {
      state = state.where((m) => m.id != meal.id).toList(); // here state.where returns a new list..
      return false;
    }                                                       // if the condition is true means it is not in the favourite page so it will add it
    else{
      state = [...state, meal];  // ...state means the existing element and ,meals means adding the new meal
      return true;
    }
  }
}


final favouriteMealsProvider = StateNotifierProvider<FavouriteMealsNotifier, List<Meal>>((ref) {
  return FavouriteMealsNotifier();
}); 