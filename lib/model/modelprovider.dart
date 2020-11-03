import 'dart:convert';

import 'package:flutter/cupertino.dart';
import './Model.dart';
import 'package:http/http.dart' as http;

class ModelProvider with ChangeNotifier {
  AmbulanceFormPage _ambulanceFormPages;
  List<AmbulanceFormPage> _ambulanceFormPage = [];
  String list;

  List<AmbulanceFormPage> get ambulanceFormPage {
    return _ambulanceFormPage;
  }

  value() {
    print('i am hasan');
    print(_ambulanceFormPage.length);
  }

  datas() {
    print('i am data');
    print(list);
    print(_ambulanceFormPage.length);
  }

  List<AmbulanceFormPage> get allambulance {
    return List.from(_ambulanceFormPage);
  }

  Future<Null> fatchambulancelist() async {
    return await http
        .get('https://blood-group-15bfd.firebaseio.com/AmbulanceList.json')
        .then<Null>((http.Response response) {
      print(response.body);
      List<AmbulanceFormPage> _ambulanceList = [];
      Map<String, dynamic> fatchdata = json.decode(response.body);
      if (fatchdata == null) {
        notifyListeners();
        return;
      }

      fatchdata.forEach((String ambulanceid, dynamic ambulancelist) {
        final AmbulanceFormPage _ambulance = AmbulanceFormPage(
          id: ambulanceid,
          ambulancename: ambulancelist['ambulancename'],
          ambulancephonenumber: ambulancelist['ambulancephonenumber'],
          zilaname: ambulancelist['zilaname'],
          upzilaname: ambulancelist['upzilaname'],
          url: ambulancelist['url'],
        );
        String text = _ambulance.ambulancename;
        list = text;
        _ambulanceList.add(_ambulance);
        notifyListeners();
      });
      notifyListeners();

      _ambulanceFormPage = _ambulanceList;
      datas();
      //   _isloading = false;
      notifyListeners();
      //  _selectedAmbulanceindex = null;
    }).catchError((error) {
      //   _isloading = false;
      notifyListeners();
      return;
    });
    //int get update => _frompage.length;
    //int get update => _frompage.length ;
  }

  // Future fatchdata() async {
  //   return await http
  //       .get('https://blood-group-15bfd.firebaseio.com/AmbulanceList.json')
  //       .then<Null>((http.Response response) {
  //     final List<AmbulanceFormPage> _ambulanceList = [];

  //     final Map<String, dynamic> fatchdata = json.decode(response.body);
  //     print(fatchdata);
  //     fatchdata.forEach((String ambulanceid, dynamic ambulancelist) {
  //       final AmbulanceFormPage _ambulance = AmbulanceFormPage(
  //         id: ambulanceid,
  //         ambulancename: ambulancelist['ambulancename'],
  //         ambulancephonenumber: ambulancelist['ambulancephonenumber'],
  //         zilaname: ambulancelist['zilaname'],
  //         upzilaname: ambulancelist['upzilaname'],
  //         url: ambulancelist['url'],
  //       );
  //       _ambulanceList.add(_ambulance);
  //     });

  //     _modeluserdata = _ambulanceList;
  //     print(".........");
  //     //   print(_modeluserdata.length);
  //     datas();
  //     notifyListeners();
  //   });
  // }
}
