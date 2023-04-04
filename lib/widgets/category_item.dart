import 'package:flutter/material.dart';
import 'package:flutter_routing/pages/categories_meals_screen.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final Color color;
  const CategoryItem(
      {super.key, required this.title, required this.color, required this.id});

  void _selectCategory(BuildContext context) {
    Navigator.of(context).pushNamed(CategoriesMealsScreen.routeName,
        arguments: {"id": id, "title": title});
  }

  @override
  Widget build(BuildContext context) {
    final themeContext = Theme.of(context);
    return InkWell(
      onTap: () => _selectCategory(context),
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [color.withOpacity(0.7), color],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Text(
          title,
          style: themeContext.textTheme.titleLarge,
        ),
      ),
    );
  }
}
