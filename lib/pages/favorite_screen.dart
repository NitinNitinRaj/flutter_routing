import 'package:flutter/material.dart';
import 'package:flutter_routing/modules/meals.dart';
import 'package:flutter_routing/widgets/meal_item.dart';

class FavoriteMeals extends StatelessWidget {
  final List<Meal> favoriteMeals;
  const FavoriteMeals({super.key, required this.favoriteMeals});

  @override
  Widget build(BuildContext context) {
    if (favoriteMeals.isEmpty) {
      return const Center(
        child: Text("No favorites added yet!"),
      );
    } else {
      return ListView.builder(
        itemCount: favoriteMeals.length,
        itemBuilder: (ctx, index) {
          return MealItem(
            id: favoriteMeals[index].id,
            title: favoriteMeals[index].title,
            imageUrl: favoriteMeals[index].imageUrl,
            duration: favoriteMeals[index].duration,
            complexity: favoriteMeals[index].complexity,
            affordability: favoriteMeals[index].affordability,
          );
        },
      );
    }
  }
}
