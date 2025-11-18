import 'package:flutter/material.dart';

// DATA THEME
class AppTheme {
  bool isDarkMode = false;

  ThemeData get themeData {
    return isDarkMode ? ThemeData.dark() : ThemeData.light();
  }

  Color get backgroundColor {
    return isDarkMode ? Colors.grey[900]! : Colors.white;
  }

  Color get textColor {
    return isDarkMode ? Colors.white : Colors.black;
  }
}

// INHERITED WIDGET UNTUK THEME
class ThemeInheritedWidget extends InheritedWidget {
  final AppTheme appTheme;
  final VoidCallback toggleTheme;

  ThemeInheritedWidget({
    required this.appTheme,
    required this.toggleTheme,
    required Widget child,
  }) : super(child: child);

  static ThemeInheritedWidget? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ThemeInheritedWidget>();
  }

  @override
  bool updateShouldNotify(ThemeInheritedWidget oldWidget) {
    return appTheme.isDarkMode != oldWidget.appTheme.isDarkMode;
  }
}

// APLIKASI UTAMA
class ThemeApp extends StatefulWidget {
  @override
  _ThemeAppState createState() => _ThemeAppState();
}

class _ThemeAppState extends State<ThemeApp> {
  AppTheme appTheme = AppTheme();

  void toggleTheme() {
    setState(() {
      appTheme.isDarkMode = !appTheme.isDarkMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ThemeInheritedWidget(
      appTheme: appTheme,
      toggleTheme: toggleTheme,
      child: MaterialApp(
        theme: appTheme.themeData,
        home: FirstScreen(),
        routes: {
          '/second': (context) => SecondScreen(),
        },
      ),
    );
  }
}

// SCREEN PERTAMA
class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeInherited = ThemeInheritedWidget.of(context);

    // Pastikan themeInherited tidak null
    if (themeInherited == null) {
      return Scaffold(body: Center(child: Text("Error: Theme not found")));
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Screen 1'),
        actions: [
          IconButton(
            icon: Icon(themeInherited.appTheme.isDarkMode
                ? Icons.light_mode
                : Icons.dark_mode),
            onPressed: themeInherited.toggleTheme,
          ),
        ],
      ),
      body: Container(
        color: themeInherited.appTheme.backgroundColor,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Screen Pertama',
                style: TextStyle(
                  fontSize: 24,
                  color: themeInherited.appTheme.textColor,
                ),
              ),
              SizedBox(height: 20),
              Text(
                themeInherited.appTheme.isDarkMode
                    ? "Mode Gelap"
                    : "Mode Terang",
                style: TextStyle(
                  color: themeInherited.appTheme.textColor,
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/second');
                },
                child: Text('Pergi ke Screen 2'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// (dari Halaman 25)
// SCREEN KEDUA
class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeInherited = ThemeInheritedWidget.of(context);

    // Pastikan themeInherited tidak null
    if (themeInherited == null) {
      return Scaffold(body: Center(child: Text("Error: Theme not found")));
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Screen 2'),
        actions: [
          IconButton(
            icon: Icon(themeInherited.appTheme.isDarkMode
                ? Icons.light_mode
                : Icons.dark_mode),
            onPressed: themeInherited.toggleTheme,
          ),
        ],
      ),
      body: Container(
        color: themeInherited.appTheme.backgroundColor,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Screen Kedua',
                style: TextStyle(
                  fontSize: 24,
                  color: themeInherited.appTheme.textColor,
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Theme sama di semua screen!',
                style: TextStyle(
                  color: themeInherited.appTheme.textColor,
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Kembali'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


void main() {
  runApp(ThemeApp());
}
