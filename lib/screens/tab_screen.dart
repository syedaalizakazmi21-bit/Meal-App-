import 'package:flutter/material.dart';
import 'package:meal_app_new/data/dummy_data.dart';
import 'package:meal_app_new/models/meal_data.dart';
import 'package:meal_app_new/screens/categories_screen.dart';
import 'package:meal_app_new/screens/filter_screen.dart';
import 'package:meal_app_new/screens/meals_screen.dart';
import 'package:meal_app_new/widgets/drawer_widget.dart';

final Map<Filters, bool> _kAppliedFilters = {
  Filters.glutenFree: false,
  Filters.lactoseFree: false,
  Filters.vegetarian: false,
  Filters.vegan: false,
};

class TabScreen extends StatefulWidget {
  const TabScreen({super.key});

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  int _activeIndex = 0;
  List<MealData> _availableMeals = [];
  final List<MealData> _favoriteMeals = [];
  Map<Filters, bool> _appliedFilter = _kAppliedFilters;

  void _onSelectPage(String identifier) async {
    Navigator.of(context).pop();

    if (identifier == 'filter') {
      final result = await Navigator.of(context).push<Map<Filters, bool>>(
        MaterialPageRoute(
          builder: (context) {
            return FilterScreen(appliedFilters: _appliedFilter);
          },
        ),
      );
      if (result != null) {
        setState(() {
          _appliedFilter = result;
        });
      }
    }
  }

  void _showSnakBarMessage(String message) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  void _onToggleFavorite(MealData meal) {
    final bool isExist = _favoriteMeals.contains(meal);

    if (isExist) {
      _favoriteMeals.remove(meal);
      _showSnakBarMessage("Meal is no longer a favorite.");
    } else {
      _favoriteMeals.add(meal);
      _showSnakBarMessage("Marked as a favorite!");
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    _availableMeals = dummyMeal.where((meal) {
      if (!meal.isGlutenFree && _appliedFilter[Filters.glutenFree]!) {
        return false;
      }
      if (!meal.isLactoseFree && _appliedFilter[Filters.lactoseFree]!) {
        return false;
      }
      if (!meal.isVegetarian && _appliedFilter[Filters.vegetarian]!) {
        return false;
      }
      if (!meal.isVegan && _appliedFilter[Filters.vegan]!) {
        return false;
      }
      return true;
    }).toList();

    Widget activeScreen = CategoriesScreen(
      onToggleFavorite: _onToggleFavorite,
      availableMeals: _availableMeals,
    );

    if (_activeIndex == 1) {
      activeScreen = MealsScreen(
        meals: _favoriteMeals,
        onToggleFavorite: _onToggleFavorite,
      );
    }

    return Scaffold(
      drawer: DrawerWidget(
        onSelectPage: _onSelectPage,
      ),
      appBar: AppBar(
        title: Text(_activeIndex == 0 ? "Categories" : "Favorites"),
      ),
      body: activeScreen,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _activeIndex,
        onTap: (index) {
          setState(() {
            _activeIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.set_meal),
            label: "Categories",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: "Favorites",
          ),
        ],
      ),
    );
  }
}
