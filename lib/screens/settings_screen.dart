import 'package:flutter/material.dart';
//import 'package:meals/models/meal.dart';

import '../components/main_drawer.dart';
import '../models/settings.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {

var settings = Settings();

  Widget _creatSwitch(
    String title,
    String subtitle,
    bool value,
    Function onChanged,
  ) {
    return SwitchListTile.adaptive(
      title: Text(title),
      subtitle: Text(subtitle),
      value: value,
      onChanged: onChanged,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Configurações'),
      ),
      drawer: MainDrawer(),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Configurações',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                _creatSwitch(
                  'Sem gluten',
                  'Só exibe refeição sem glúten',
                  settings.isGlutenFree,
                  (value) => setState(()=> settings.isGlutenFree = value),
                ),
                _creatSwitch(
                  'Sem lactose',
                  'Só exibe refeição sem lactose',
                  settings.isLactoseFree,
                  (value) => setState(()=> settings.isLactoseFree = value),
                ),
                _creatSwitch(
                  'Vegana',
                  'Só exibe refeição veganas',
                  settings.isVegan,
                  (value) => setState(()=> settings.isVegan = value),
                ),
                _creatSwitch(
                  'Vegetariana',
                  'Só exibe refeição sem vegetarianas',
                  settings.isVegetarian,
                  (value) => setState(()=> settings.isVegetarian = value),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
