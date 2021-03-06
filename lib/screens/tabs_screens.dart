import 'package:comida/screens/categorias_screen.dart';
import 'package:comida/screens/favorite_screen.dart';
import 'package:comida/utils/main_drawer.dart';
import 'package:flutter/material.dart';

import '../models/meal.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> favoriteMeals;

  const TabsScreen({Key? key, required this.favoriteMeals}) : super(key: key);

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedScreenIndex = 0;

  final List<String> _titles = [
    'Lista de Categorias',
    'Meus Favoritos',
  ];

  late List<Widget> _screens;

  @override
  void initState() {
    super.initState();
    _screens = [
      CategoriaScreen(),
      FavoriteScreen(favoriteMeals: widget.favoriteMeals)
    ];
  }

  _selectScreen(int index) {
    setState(() {
      _selectedScreenIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(_titles[_selectedScreenIndex]),
        ),
        drawer: const Drawer(
          child: MainDrawer(),
        ),
        body: _screens[_selectedScreenIndex],
        bottomNavigationBar: BottomNavigationBar(
            onTap: _selectScreen,
            backgroundColor: Theme.of(context).primaryColor,
            // unselectedItemColor: Theme.of(context).primaryColor,
            selectedItemColor: Theme.of(context).colorScheme.secondary,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.category),
                label: 'Categorias',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.star),
                label: 'Favoritas',
              ),
            ]),
      ),
    );
  }
}
