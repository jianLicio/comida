import 'package:comida/componentes/meal_item.dart';
import 'package:comida/models/categoria.dart';
import 'package:comida/models/meal.dart';
import 'package:flutter/material.dart';

class CategoriaMealsScreen extends StatelessWidget {
  final Categoria? categoria;

  final List<Meal>? meals;

  const CategoriaMealsScreen({Key? key, this.categoria, this.meals})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final categoria = ModalRoute.of(context)!.settings.arguments as Categoria;

    final categoriaMeals = meals!
        .where((element) => element.categoria!.contains(categoria.id))
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(categoria.titulo),
      ),
      body: ListView.builder(
          itemCount: categoriaMeals.length,
          itemBuilder: (context, index) {
            return MealItem(meal: categoriaMeals[index]);
          }),
    );
  }
}
