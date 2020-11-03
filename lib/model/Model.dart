import 'package:flutter/cupertino.dart';

class AmbulanceFormPage {
  String id;
  String ambulancename;
  int ambulancephonenumber;
  String zilaname;
  String upzilaname;
  String url;

  AmbulanceFormPage({
    @required this.id,
    @required this.zilaname,
    @required this.upzilaname,
    @required this.ambulancename,
    @required this.ambulancephonenumber,
    @required this.url,
  });
}
