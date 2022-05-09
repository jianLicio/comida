import 'package:comida/data/dummy_data.dart';
import 'package:comida/models/settings.dart';
import 'package:comida/screens/categorias_meals_screen.dart';
import 'package:comida/screens/meal_detalhe_screen.dart';
import 'package:comida/screens/settings_screen.dart';
import 'package:comida/screens/tabs_screens.dart';
import 'package:comida/utils/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'models/meal.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Meal> _comidasDisponiveis = dummyMeals;
  Settings settings = Settings();

  List<Meal> _favoriteMeals = [];

  void _filterMeals(Settings settings) {
    setState(() {
      this.settings = settings;
      _comidasDisponiveis = dummyMeals.where((element) {
        final filterGluten = settings.semGlutem && !element.semGluten!;
        final filterLactose = settings.semLactose && !element.semLactose!;
        final filterVegana = settings.vegano && !element.vegana!;
        final filterVegetariana = settings.vegetariano && !element.vegetariana!;

        return (!filterVegetariana &&
            !filterVegana &&
            !filterLactose &&
            !filterGluten);
      }).toList();
    });
  }

  void _toglleFavorite(Meal meal) {
    setState(() {
      _favoriteMeals.contains(meal)
          ? _favoriteMeals.remove(meal)
          : _favoriteMeals.add(meal);
    });
  }

  bool _isFavorite(Meal meal) {
    return _favoriteMeals.contains(meal);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Vamos Cozinhar?',
      theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch(
            primarySwatch: Colors.pink,
          ).copyWith(
            secondary: Colors.amber,
          ),
          textTheme: GoogleFonts.acmeTextTheme(Theme.of(context).textTheme)),
      routes: {
        AppRoutes.home: (context) => TabsScreen(favoriteMeals: _favoriteMeals),
        AppRoutes.categoriaMeals: (context) =>
            CategoriaMealsScreen(meals: _comidasDisponiveis),
        AppRoutes.mealDetalhe: (context) => MealDetalheScreen(
            onToglleFavorite: _toglleFavorite, isFavorite: _isFavorite),
        AppRoutes.settings: (context) =>
            SettingsScreen(settings: settings, onSettingsChanged: _filterMeals),
      },
    );
  }
}
