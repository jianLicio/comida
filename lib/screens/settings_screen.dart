import 'package:comida/models/settings.dart';
import 'package:comida/utils/main_drawer.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  final Function(Settings)? onSettingsChanged;

  const SettingsScreen({Key? key, this.onSettingsChanged}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  var settings = Settings();

  Widget _createSwitch(
    String titulo,
    String subtitulo,
    bool valor,
    Function(bool) onChanged,
  ) {
    return SwitchListTile(
      title: Text(titulo),
      subtitle: Text(subtitulo),
      value: valor,
      onChanged: (valor) {
        onChanged(valor);
        widget.onSettingsChanged!(settings);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Configurações'),
      ),
      drawer: const MainDrawer(),
      body: Column(children: [
        Container(
          padding: const EdgeInsets.all(20),
          child: const Text('Configurações'),
        ),
        Expanded(
          child: ListView(
            children: <Widget>[
              _createSwitch(
                'Sem Glutem',
                'Só exibe  refeições sem glutem',
                settings.semGluttem,
                (value) => setState(() => settings.semGluttem = value),
              ),
              _createSwitch(
                'Sem Lactose',
                'Só exibe  refeições sem lactose',
                settings.semLactose,
                (value) => setState(() => settings.semLactose = value),
              ),
              _createSwitch(
                'Vegana',
                'Só exibe  refeições veganas',
                settings.vegano,
                (value) => setState(() => settings.vegano = value),
              ),
              _createSwitch(
                'Vegetáriana',
                'Só exibe  refeições vegetárianas',
                settings.vegetariano,
                (value) => setState(() => settings.vegetariano = value),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
