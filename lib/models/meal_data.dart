enum Complexity { simple, challenging, hard }

enum Affordability { affordable, pricey, luxurious }

class MealData {
  final String id;
  final List<String> categories;
  final String title;
  final String imageUrl;
  final Complexity complexity;
  final Affordability affordability;
  final int duration;
  final List<String> ingredients;
  final List<String> steps;
  final bool isGlutenFree;
  final bool isLactoseFree;
  final bool isVegetarian;
  final bool isVegan;

  const MealData({
    required this.id,
    required this.categories,
    required this.title,
    required this.imageUrl,
    required this.complexity,
    required this.affordability,
    required this.duration,
    required this.ingredients,
    required this.steps,
    required this.isGlutenFree,
    required this.isLactoseFree,
    required this.isVegetarian,
    required this.isVegan,
  });
}
