import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';
import './favorites_screen.dart';
import './categories_screen.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  final List<Map<String, dynamic>> _pages = [
    {'page': CategoriesScreen(), 'title': 'Categories'},
    {'page': FavoritesScreen(), 'title': 'Favorites'}
  ];

  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedPageIndex]['title']),
      ),
      drawer: MainDrawer(),
      body: _pages[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        items: [
          BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: const Icon(Icons.category),
              label: 'Categories'),
          BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: const Icon(Icons.star),
              label: 'Favorites')
        ],
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).colorScheme.secondary,
        currentIndex: _selectedPageIndex,
        type: BottomNavigationBarType.shifting,
      ),
    );
  }
}
