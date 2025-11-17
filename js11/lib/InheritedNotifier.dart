import 'package:flutter/material.dart';


class CounterModel extends ChangeNotifier {
  int _count = 0;
  int get count => _count;

  void increment() {
    _count++;
    notifyListeners(); // Trigger rebuild
  }
}


class CounterInheritedNotifier extends InheritedNotifier<CounterModel> {
  const CounterInheritedNotifier({
    super.key,
    required CounterModel notifier,
    required super.child,
  }) : super(notifier: notifier);

  static CounterModel of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<CounterInheritedNotifier>()!
        .notifier!;
  }
}


// Penggunaan
class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final CounterModel _counterModel = CounterModel();

  @override
  Widget build(BuildContext context) {
    return CounterInheritedNotifier(
      notifier: _counterModel,
      child: MaterialApp(
        home: MyHomePage(),
      ),
    );
  }
}


class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final counter = CounterInheritedNotifier.of(context);

    return Scaffold(
      appBar: AppBar(title: Text('Contoh InheritedNotifier')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Auto rebuild ketika count berubah
            Text('Count: ${counter.count}'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: counter.increment,
              child: Text('Increment'),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MyApp());
}