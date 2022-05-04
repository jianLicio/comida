import 'package:comida/models/categoria.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/app_routes.dart';

class CategoriaItem extends StatelessWidget {
  const CategoriaItem({Key? key, this.categoria}) : super(key: key);

  final Categoria? categoria;

  void _selecionarCategoria(BuildContext context) {
    Navigator.of(context).pushNamed(
      AppRoutes.categoriaMeals,
      arguments: categoria,
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _selecionarCategoria(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Text(
          categoria!.titulo,
          style: GoogleFonts.kurale(fontSize: 18),
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          gradient: LinearGradient(
            colors: [
              categoria!.cor.withOpacity(0.5),
              categoria!.cor,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
      ),
    );
  }
}
