import 'package:flutter/cupertino.dart';

class anonymous{
  final String? uid;
  final String email;
  final String name;
  final String dob;
  final String gender;

  anonymous({
    this.uid,
    required this.email,
    required this.name,
    required this.dob,
    required this.gender
  });
  Map<String, dynamic> tojason() {
    return{
      "uid": uid,
      "email": email,
      "name": name,
      "dob": dob,
      "gender": gender,
      "createAt": DateTime.now().toIso8601String()
    };


  }
  factory anonymous.fromJason(Map<String, dynamic> jason) {
    return anonymous(
      uid: jason["uid"],
      email: jason["email"],
      name: jason["name"],
      dob: jason["dob"],
      gender: jason["gender"]
    );
  }
}
