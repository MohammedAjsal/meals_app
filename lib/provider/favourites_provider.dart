import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/models/meal.dart';

class FavouriteMealsNotifier extends StateNotifier<List<Meal>> {
  FavouriteMealsNotifier() : super([]);

  bool toggleFavouriteStaus(Meal meal) {
    final isExisting = state.contains(meal);
    if (isExisting) {
      state = state.where((m) => m.id != meal.id).toList();
      return false;
    } else {
      state = [...state, meal];
      return true;
    }
  }
}

final favouriteMealProvider =
    StateNotifierProvider<FavouriteMealsNotifier, List<Meal>>(
  (ref) => FavouriteMealsNotifier(),
);
