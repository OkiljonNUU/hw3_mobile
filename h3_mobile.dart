import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyData with ChangeNotifier {
  String message = '';

  void setMessage(String newMessage) {
    message = newMessage;
    notifyListeners();
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => MyData()),
      ],
      child: MaterialApp(
        title: 'HW3 App',
        initialRoute: '/',
        routes: {
          '/': (context) => HomeScreen(),
          '/screen2': (context) => Screen2(),
          '/screen3': (context) => Screen3(),
          '/screen4': (context) => Screen4(),
          '/screen5': (context) => Screen5(),
        },
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final myData = Provider.of<MyData>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Welcome to HW3 App',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                final result = await Navigator.pushNamed(context, '/screen2');
                if (result != null) {
                  myData.setMessage(result);
                }
              },
              child: Text('Go to Screen 2'),
            ),
            Text('Data from Screen 5: ${myData.message}'),
          ],
        ),
      ),
    );
  }
}

// Implement Screen2, Screen3, Screen4, and Screen5 similarly

class Screen2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Screen 2'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context, 'Data from Screen 2');
          },
          child: Text('Go Back to Home Screen'),
        ),
      ),
    );
  }
}