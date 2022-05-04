import 'package:comida/screens/categorias_meals_screen.dart';
import 'package:comida/screens/categorias_screen.dart';
import 'package:comida/utils/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vamos Cozinhar?',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.pink,
        ).copyWith(
          secondary: Colors.amber,
        ),
      ),
      routes: {
        AppRoutes.home: (context) => const CategoriaScreen(),
        AppRoutes.categoriaMeals: (context) => const CategoriaMealsScreen(),
      },
    );
  }
}
