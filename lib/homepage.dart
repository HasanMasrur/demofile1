import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:textapp/model/Listview.dart';
import 'package:textapp/model/modelprovider.dart';

class HomePage extends StatefulWidget {
  ModelProvider data;
  HomePage(this.data);

  @override
  State<StatefulWidget> createState() {
    return _HomePage();
  }
}

class _HomePage extends State<HomePage> {
  @override
  void initState() {
    widget.data.fatchambulancelist();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('facedata'),
        ),
        body: Center(
          child: RaisedButton(onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return ListViewes();
            }));
          }),
        ));
  }
}
