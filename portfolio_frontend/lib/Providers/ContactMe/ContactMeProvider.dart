import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class ContactMeProvider extends ChangeNotifier {
  bool isSent = false, isHovered = false;

  void changeHovered(val) {
    isHovered = val;
    notifyListeners();
  }

  void sendEmail(String name, String email, String feedback, String number,
      String linkedin) async {
    print(name + email + feedback);
    var res = await Dio().post("http://172.21.0.1:3000/sendEmail",
        data: {
          "name": name,
          "email": email,
          "feedback": feedback,
          "number": number,
          "linkedin_id": linkedin
        },
        options: Options(headers: {'Content-Type': 'application/json'}));
    if (res.data['msg'] == 'Done') {
      isSent = true;
    }
    isSent = false;
  }
}
