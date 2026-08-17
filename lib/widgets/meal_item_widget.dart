import 'package:flutter/material.dart';
import 'package:meal_app_new/models/meal_data.dart';
import 'package:recase/recase.dart';

class MealItemWidget extends StatelessWidget {
  const MealItemWidget({
    super.key,
    required this.mealData,
    required this.onTap,
  });

  final MealData mealData;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          //  stack 1st children
          Image.network(
            mealData.imageUrl,
            height: 200,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          //  stack 2nd children
          Container(
            color: Colors.black45,
            child: Column(
              children: [
                Text(
                  mealData.title,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                SizedBox(height: 4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MealTrait(
                      icon: Icons.timer,
                      label: "${mealData.duration} min",
                    ),
                    SizedBox(width: 10),
                    MealTrait(
                      icon: Icons.account_tree_rounded,
                      label: mealData.complexity.name.titleCase,
                    ),
                    SizedBox(width: 10),
                    MealTrait(
                      icon: Icons.attach_money,
                      label: mealData.affordability.name.titleCase,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class MealTrait extends StatelessWidget {
  const MealTrait({
    super.key,
    required this.icon,
    required this.label,
  });

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon),
        SizedBox(width: 4),
        Text(label),
      ],
    );
  }
}
