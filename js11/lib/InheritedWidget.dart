import 'package:flutter/material.dart';
import 'package:js11/mainInwidget.dart';


class MyTheme extends InheritedWidget {
  final Color primaryColor;
  final bool isDarkMode;

  const MyTheme({
    super.key,
    required this.primaryColor,
    required this.isDarkMode,
    required super.child,
  });

  // Method penting untuk akses data
  static MyTheme of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<MyTheme>()!;
  }

  // Optimasi: only rebuild jika data berubah
  @override
  bool updateShouldNotify(MyTheme oldWidget) {
    return primaryColor != oldWidget.primaryColor ||
        isDarkMode != oldWidget.isDarkMode;
  }
}



  
  // void main() {
  //   runApp(MyApp());
  // }

  // class MyHomePage extends StatelessWidget {
  //   @override
  //   Widget build(BuildContext context) {
  //     // Mengakses data dari MyTheme
  //     final theme = MyTheme.of(context);

  //     return Scaffold(
  //       backgroundColor: theme.isDarkMode ? Colors.grey[900] : Colors.white,
  //       appBar: AppBar(
  //         title: Text('Contoh InheritedWidget'),
  //         backgroundColor: theme.primaryColor,
  //       ),
  //       body: Center(
  //         child: Text(
  //           'Warna Primary adalah ${theme.primaryColor}',
  //           style: TextStyle(
  //             color: theme.isDarkMode ? const Color.fromARGB(255, 252, 252, 252) : Colors.black,
  //           ),
  //         ),
  //       ),
  //     );
  //   }
  // }