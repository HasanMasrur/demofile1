import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:textapp/homepage.dart';
import 'package:textapp/model/modelprovider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  ModelProvider data = ModelProvider();
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ModelProvider(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: HomePage(data),
      ),
    );
  }
}
