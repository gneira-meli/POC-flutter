import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sdui_module/data/storage_data.dart';
import 'package:sdui_module/models/component.dart';
import 'package:sdui_module/render_widgets.dart';

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
  final List<Component> components = StorageData.getData();

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  static const platform = const MethodChannel('platformChannel');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          children: widget.components
              .map((component) => component.render())
              .toList(),
        ),
      ),
      bottomNavigationBar: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Colors.grey
        ),
        child: Text("Hi " + widget.username + ". Click to exit with callback"),
        onPressed: () async {
          try {
            await platform.invokeMethod('exit', "Bye " + widget.username);
          } on PlatformException catch (e) {
            debugPrint("Error: '${e.message}'.");
          }
        },
      ),
    );
  }
}
