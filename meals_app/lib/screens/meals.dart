import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/screens/meal_details.dart';
import 'package:meals_app/widgets/meal_Item.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen(
      {super.key,
      this.title,
      required this.meals,
      required this.onToggleFavorite});

  final String? title;
  final List<Meal> meals;
  final void Function(Meal meal) onToggleFavorite;

  void selectMeal(BuildContext context, Meal meal) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (ctx) => MealDetailsScreen(
              meal: meal,
              onToggleFavorite: onToggleFavorite,
            )));
  }

  @override
  Widget build(BuildContext context) {
    Widget content = Center(
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        Text('Nothing here!',
            style: Theme.of(context)
                .textTheme
                .headlineLarge!
                .copyWith(color: Theme.of(context).colorScheme.onBackground)),
        const SizedBox(
          height: 16,
        ),
        Text(
          'Try selecting a diferent cathegory!',
          style: Theme.of(context)
              .textTheme
              .bodyLarge!
              .copyWith(color: Theme.of(context).colorScheme.onBackground),
        ),
      ]),
    );

    if (meals.isNotEmpty) {
      content = ListView.builder(
          itemCount: meals.length,
          itemBuilder: (ctx, index) => MealItem(
                meal: meals[index],
                onSelectMeal: () => selectMeal(context, meals[index]),
              ));
    }

    if (title == null) {
      return content;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(title!),
      ),
      // only items that are visible will be displaid, to optimize perfomance for
      // scenarios where we might have vary long lists
      body: content,
    );
  }
}
