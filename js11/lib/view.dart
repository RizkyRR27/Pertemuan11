import 'package:flutter/material.dart';
import 'package:js11/main.dart';

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  AppSettings settings = AppSettings();

  void toggleTheme() {
    setState(() {
      settings.isDarkMode = !settings.isDarkMode;
    });
  }

  void updateName(String newName) {
    setState(() {
      settings.userName = newName;
    });
  }

  void increaseFont() {
    setState(() {
      settings.fontSize += 2;
    });
  }

  void decreaseFont() {
    setState(() {
      settings.fontSize -= 2;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: settings.isDarkMode ? ThemeData.dark() : ThemeData.light(),
      home: Scaffold(
        backgroundColor: settings.backgroundColor,
        appBar: AppBar(
          title: Text("Aplikasi settings sederhana"),
          backgroundColor: settings.isDarkMode
              ? Colors.blueGrey[800]
              : Colors.blue,
        ),
        body: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                settings.greeting,
                style: TextStyle(
                  fontSize: settings.fontSize.toDouble(),
                  color: settings.textColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 30),

              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: settings.isDarkMode
                      ? Colors.blueGrey[800]
                      : Colors.blue[50],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Mode : ${settings.isDarkMode ? "Gelap 🌙" : "Terang ☀️"}',
                      style: TextStyle(color: settings.textColor, fontSize: 16),
                    ),
                    Switch(
                      value: settings.isDarkMode,
                      onChanged: (value) => toggleTheme(),
                      activeColor: Colors.blue,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              //input nama
              TextField(
                onChanged: updateName,
                decoration: InputDecoration(
                  labelText: 'ubah nama',
                  labelStyle: TextStyle(color: settings.textColor),
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: settings.isDarkMode 
                      ? Colors.blueGrey[800]
                      : Colors.grey[100],
                ),
                style : TextStyle(color: settings.textColor),
              ),
               SizedBox(height: 20),

              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: settings.isDarkMode
                      ? Colors.blueGrey[800]
                      : Colors.blue[50],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    Text(
                      'Ukuran Font: ${settings.fontSize}',
                      style: TextStyle(color: settings.textColor, fontSize: 16),
                    ),
                    SizedBox(height: 10),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}