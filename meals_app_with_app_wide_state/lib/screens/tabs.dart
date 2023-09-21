import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app_with_app_wide_state/providers/favorites_provider.dart';
import 'package:meals_app_with_app_wide_state/providers/filters_provider.dart';
import 'package:meals_app_with_app_wide_state/screens/categories.dart';
import 'package:meals_app_with_app_wide_state/screens/filters.dart';
import 'package:meals_app_with_app_wide_state/screens/meals.dart';
import 'package:meals_app_with_app_wide_state/widgets/main_drawer.dart';

const kInitialFilters = {
  Filter.gluetenFree: false,
  Filter.lactoseFree: false,
  Filter.vegetarian: false,
  Filter.vegan: false
};

class TabsScreen extends ConsumerStatefulWidget {
  const TabsScreen({super.key});

  @override
  ConsumerState<TabsScreen> createState() => _TabsScreen();
}

class _TabsScreen extends ConsumerState<TabsScreen> {
  int selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() => selectedPageIndex = index);
  }

  void _setScreen(String identifier) {
    Navigator.of(context).pop();
    if (identifier == 'filters') {
      Navigator.of(context).push<Map<Filter, bool>>(
          MaterialPageRoute(builder: (ctx) => const FiltersScreen()));
    }
  }

  @override
  Widget build(BuildContext context) {
    final avaliableMeals = ref.watch(filteredMealsProvider);

    Widget activePage = CategoriesScreen(
      avaliableMeals: avaliableMeals,
    );

    var activePageTitle = 'Categoriers';

    if (selectedPageIndex == 1) {
      final favoriteMeals = ref.watch(favoriteMealsProvider);
      activePage = MealsScreen(
        meals: favoriteMeals,
      );
      activePageTitle = 'Your favorites';
    }

    return Scaffold(
      appBar: AppBar(title: Text(activePageTitle)),
      drawer: MainDrawer(onSelectScreen: _setScreen),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex:
            selectedPageIndex, // controls wich tab will be highlighted
        onTap: _selectPage,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.set_meal), label: 'Categories'),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Favorites'),
        ],
      ),
    );
  }
}
