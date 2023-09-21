import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app_with_app_wide_state/models/meal.dart';

// !!! IMPORTANT !!!
// when using stateNotifier, we are not allow to edit an existing value in memory
// instead, we have to create a new one (re-assign)

// state.add(); -> not allowd
// state = []; -> allowd

// class for editing the state
class FavoriteMealsNotifier extends StateNotifier<List<Meal>> {
  FavoriteMealsNotifier() : super([]);

  bool toggleMealsFavoriteStatus(Meal meal) {
    final mealIsFavorite = state.contains(meal);

    if (mealIsFavorite) {
      state = state.where((m) => m.id != meal.id).toList();
      return false;
    } else {
      state = [...state, meal];
      return true;
    }
  }
}

// class for retrieving the state
final favoriteMealsProvider =
    StateNotifierProvider<FavoriteMealsNotifier, List<Meal>>((ref) {
  return FavoriteMealsNotifier();
});
