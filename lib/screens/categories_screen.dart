import 'package:flutter/material.dart';
import 'package:meal_app_new/data/dummy_data.dart';
import 'package:meal_app_new/models/meal_category.dart';
import 'package:meal_app_new/models/meal_data.dart';
import 'package:meal_app_new/screens/meals_screen.dart';
import 'package:meal_app_new/widgets/meal_category_widget.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({
    super.key,
    required this.onToggleFavorite,
    required this.availableMeals,
  });

  final void Function(MealData meal) onToggleFavorite;
  final List<MealData> availableMeals;

  void _onSelectCategory(BuildContext context, MealCategory category) {
    final List<MealData> meals = availableMeals
        .where((meal) => meal.categories.contains(category.id))
        .toList();

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => MealsScreen(
          title: category.title,
          meals: meals,
          onToggleFavorite: onToggleFavorite,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      // scrollDirection: Axis.horizontal,
      padding: EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 20,
      ),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 20,
        crossAxisSpacing: 20,
        childAspectRatio: 1.3,
      ),
      itemCount: mealCategories.length,
      itemBuilder: (context, index) => MealCategoryWidget(
        mealCategory: mealCategories[index],
        onSelectCategory: (category) {
          _onSelectCategory(context, category);
        },
      ),
    );
  }
}
