import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:textapp/model/modelprovider.dart';

class ListViewes extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ListViewes();
  }
}

class _ListViewes extends State<ListViewes> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ModelProvider>(builder: (context, data, child) {
      print(data.ambulanceFormPage.length);
      print('////');
      return Scaffold(
        appBar: AppBar(
          title: Text('datashow'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 50, left: 50),
                child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: data.allambulance.length,
                    itemBuilder: (BuildContext context, int index) {
                      print('datas');
                      final datas = data.allambulance[index];
                      print(datas);
                      return ListTile(
                          leading: Icon(Icons.list),
                          trailing: Text(
                            "GFG",
                            style: TextStyle(color: Colors.green, fontSize: 15),
                          ),
                          title: Text("List item datas.upzilaname"));
                    }),
              ),
            ],
          ),
        ),
      );
    });
  }
}
