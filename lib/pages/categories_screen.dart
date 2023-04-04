import 'dart:io';

import 'package:flutter/material.dart';
import '../widgets/category_item.dart';
import '../utils/dummy_data.dart';

class CategoriesScreen extends StatelessWidget {
  CategoriesScreen({super.key});

  final isDesktop = Platform.isWindows;

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(25),
      gridDelegate: isDesktop
          ? const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 500,
              childAspectRatio: 5 / 3,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
            )
          : const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 250,
              childAspectRatio: 3 / 2,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
            ),
      children: dummyCategories
          .map((cat) => CategoryItem(
                title: cat.title,
                color: cat.color,
                id: cat.id,
              ))
          .toList(),
    );
  }
}
