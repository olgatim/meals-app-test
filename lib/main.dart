import 'package:flutter/material.dart';
import './categories_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = ThemeData();

    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        canvasColor: const Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'RobotoCondensed',
        colorScheme: theme.colorScheme
            .copyWith(primary: Colors.purple, secondary: Colors.amber),
        textTheme: ThemeData.light().textTheme.copyWith(
            bodyLarge: const TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
            bodyMedium: const TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
            titleLarge: const TextStyle(
                fontSize: 20,
                fontFamily: 'Raleway',
                fontWeight: FontWeight.bold)),
        // appBarTheme: theme.appBarTheme.copyWith(
        //   titleTextStyle:
        //       TextStyle(fontFamily: 'RobotoCondensed', fontSize: 24),
        // )
      ),
      home: const CategoriesScreen(),
    );
  }
}
