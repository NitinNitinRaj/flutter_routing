import 'package:flutter/material.dart';
import 'categories_screen.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("DeliMeals"),
      ),
      body: SafeArea(
        child: CategoriesScreen(),
      ),
    );
  }
}
