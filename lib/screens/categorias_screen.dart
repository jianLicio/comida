import 'package:comida/componentes/categoria_item.dart';
import 'package:comida/data/dummy_data.dart';
import 'package:flutter/material.dart';

class CategoriaScreen extends StatelessWidget {
  const CategoriaScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(10),
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
      children: dummyCategories.map((cat) {
        return CategoriaItem(categoria: cat);
      }).toList(),
    );
  }
}
