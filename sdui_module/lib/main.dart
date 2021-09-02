import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      onGenerateRoute: (settings) {
        final settingsUri = Uri.parse(settings.name ?? "");
        switch (settingsUri.path) {
          case '/home':
            var user = settingsUri.queryParameters["user"] ?? "";
            return MaterialPageRoute(
              builder: (context) => MyHomePage(username: user),
              // settings omitted to hide route name
            );

          case '/':
          // don't generate route on start-up
            return null;
          default:
            return MaterialPageRoute(
              builder: (context) => MyHomePage(username: ""),
            );
        }
    },
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.username}) : super(key: key);

  final String username;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  static const platform = const MethodChannel('platformChannel');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text("Hi " + widget.username),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Here we will implement a sdui example',
            ),
          ],
        ),
      ),
      bottomNavigationBar: ElevatedButton(
        child: Text("Exit with result OK"),
        onPressed: () async {
          try {
            final String result = await platform.invokeMethod('exit', "Bye " + widget.username);
            //return result;
            debugPrint('Result: $result ');
          } on PlatformException catch (e) {
            debugPrint("Error: '${e.message}'.");
          }
        },
      ),
    );
  }
}
