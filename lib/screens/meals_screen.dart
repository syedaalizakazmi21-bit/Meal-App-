import 'package:flutter/material.dart';
import 'package:meal_app_new/models/meal_data.dart';
import 'package:meal_app_new/screens/meal_detail_screen.dart';
import 'package:meal_app_new/widgets/meal_item_widget.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({
    super.key,
    this.title,
    required this.meals,
    required this.onToggleFavorite,
  });

  final String? title;
  final List<MealData> meals;
  final void Function(MealData meal) onToggleFavorite;

  void onMealSelect(BuildContext context, MealData mealData) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => MealDetailScreen(
          mealData: mealData,
          onToggleFavorite: onToggleFavorite,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: title != null
          ? AppBar(
              title: Text(title!),
              centerTitle: true,
            )
          : null,
      body: ListView.separated(
        itemCount: meals.length,
        itemBuilder: (context, index) => MealItemWidget(
          mealData: meals[index],
          onTap: () {
            onMealSelect(context, meals[index]);
          },
        ),
        separatorBuilder: (_, __) => SizedBox(height: 20),
      ),
    );
  }
}
