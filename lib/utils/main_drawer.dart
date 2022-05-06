import 'package:comida/utils/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key}) : super(key: key);

  Widget _createItem(IconData icon, String label, Function() onTap) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        label,
        style: const TextStyle(
          fontSize: 24,
        ),
      ),
      onTap: onTap,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(children: [
        Container(
          height: 120,
          width: double.infinity,
          padding: const EdgeInsets.all(40),
          color: Theme.of(context).colorScheme.secondary,
          child: Text(
            'Vamos Cozinhar',
            style: GoogleFonts.pacifico(fontSize: 30, color: Colors.pink),
          ),
        ),
        _createItem(
          Icons.restaurant,
          'Refeições',
          () => Navigator.of(context).pushReplacementNamed(AppRoutes.home),
        ),
        _createItem(
          Icons.settings,
          'Configurações',
          () => Navigator.of(context).pushReplacementNamed(AppRoutes.settings),
        ),
      ]),
    );
  }
}
