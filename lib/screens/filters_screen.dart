import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({super.key});

  static const routeName = '/filters';

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree = false;
  bool _vegeterian = false;
  bool _vegan = false;
  bool _lactoseFree = false;

  Widget _buildSwitchListTile(
      String title, String subtitle, bool currenValue, var updateValue) {
    return SwitchListTile(
      value: currenValue,
      onChanged: updateValue,
      title: Text(title),
      subtitle: Text(subtitle),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filters'),
      ),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            child: Text('Adjuxt your meal selection.',
                style: Theme.of(context).textTheme.titleLarge),
          ),
          Expanded(
              child: ListView(
            children: [
              _buildSwitchListTile(
                  'Gluten-free', 'Only include gluten-free meals', _glutenFree,
                  (newValue) {
                setState(() {
                  _glutenFree = newValue;
                });
              }),
              _buildSwitchListTile('Lactose-free',
                  'Only include lactose-free meals', _lactoseFree, (newValue) {
                setState(() {
                  _lactoseFree = newValue;
                });
              }),
              _buildSwitchListTile(
                  'Vegeterian', 'Only include vegeterian meals', _vegeterian,
                  (newValue) {
                setState(() {
                  _vegeterian = newValue;
                });
              }),
              _buildSwitchListTile('Vegan', 'Only include vegan meals', _vegan,
                  (newValue) {
                setState(() {
                  _vegan = newValue;
                });
              })
            ],
          ))
        ],
      ),
    );
  }
}
