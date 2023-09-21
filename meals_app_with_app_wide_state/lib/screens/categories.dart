import 'package:flutter/material.dart';
import 'package:meals_app_with_app_wide_state/data/dummy_data.dart';
import 'package:meals_app_with_app_wide_state/models/category.dart';
import 'package:meals_app_with_app_wide_state/models/meal.dart';
import 'package:meals_app_with_app_wide_state/screens/meals.dart';
import 'package:meals_app_with_app_wide_state/widgets/category_grid_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key, required this.avaliableMeals});

  final List<Meal> avaliableMeals;

  void _selectCategory(BuildContext context, Category category) {
    final filteredMeals = avaliableMeals
        .where((meal) => meal.categories.contains(category.id))
        .toList();
    // Navigator.push(context, route);
    Navigator.of(context).push(MaterialPageRoute(
        builder: (ctx) => MealsScreen(
              title: 'title',
              meals: filteredMeals,
            )));
  }

  @override
  Widget build(BuildContext context) {
    return GridView(
        padding: const EdgeInsets.all(24),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20),
        children: [
          // ...availableCategories
          //     .map((category) => CategoryGridItem(category: category))
          for (final category in availableCategories)
            CategoryGridItem(
              category: category,
              onSelectCategory: () => _selectCategory(context, category),
            )
        ]);
  }
}
