import 'package:flutter/material.dart';
import 'package:meal_app_new/models/meal_category.dart';

class MealCategoryWidget extends StatelessWidget {
  const MealCategoryWidget({
    super.key,
    required this.mealCategory,
    required this.onSelectCategory,
  });

  final MealCategory mealCategory;
  final void Function(MealCategory category) onSelectCategory;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(20),
      onTap: () {
        onSelectCategory(mealCategory);
      },
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              mealCategory.color.withValues(alpha: 0.5),
              mealCategory.color.withValues(alpha: 0.9),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        padding: EdgeInsets.all(10),
        child: Text(
          mealCategory.title,
          style: TextStyle(
            //TODO: category text style improvement
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}
