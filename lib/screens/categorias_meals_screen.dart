import 'package:comida/models/categoria.dart';
import 'package:flutter/material.dart';

class CategoriaMealsScreen extends StatelessWidget {
  final Categoria? categoria;

  const CategoriaMealsScreen({Key? key, this.categoria}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final categoria = ModalRoute.of(context)!.settings.arguments as Categoria;
    return Scaffold(
      appBar: AppBar(
        title: Text(categoria.titulo),
      ),
      body: const Center(
        child: Text('Receitas por Categoria'),
      ),
    );
  }
}
