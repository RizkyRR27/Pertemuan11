import 'package:flutter/material.dart';
import 'package:js11/InheritedWidget.dart';

void main() {
    runApp(MyApp());
  }

// Penggunaan
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MyTheme(
      primaryColor: Colors.blue,
      isDarkMode: false,
      child: MaterialApp(
        home: MyHomePage(),
      ),
    );
  }
}
  class MyHomePage extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
      // Mengakses data dari MyTheme
      final theme = MyTheme.of(context);

      return Scaffold(
        backgroundColor: theme.isDarkMode ? Colors.grey[900] : Colors.white,
        appBar: AppBar(
          title: Text('Contoh InheritedWidget'),
          backgroundColor: theme.primaryColor,
        ),
        body: Center(
          child: Text(
            'Warna Primary adalah ${theme.primaryColor}',
            style: TextStyle(
              color: theme.isDarkMode ? Colors.white : Colors.black,
            ),
          ),
        ),
      );
    }
  }