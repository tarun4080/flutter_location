import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'get_location.dart';
import 'listen_location.dart';
import 'permission_status.dart';
import 'service_enabled.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Location',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: const MyHomePage(title: 'Flutter Location Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key key, this.title}) : super(key: key);
  final String title;


  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final Location location = Location();




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        padding: const EdgeInsets.all(32),
        child: Column(
          children: const <Widget>[
            PermissionStatusWidget(),
            Divider(height: 32),
            ServiceEnabledWidget(),
            Divider(height: 32),
            GetLocationWidget(),
            Divider(height: 32),
            ListenLocationWidget()
          ],
        ),
      ),
    );
  }
}