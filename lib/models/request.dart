import 'package:flutter/cupertino.dart';

class Request with ChangeNotifier {
  final String id;
  final String uid;
  final String name;
  final int age;
  final String bloodGroup;
  final String date;
  final String area;

  Request(
      {this.id, this.name, this.date, this.area, this.bloodGroup, this.age, this.uid});
}
