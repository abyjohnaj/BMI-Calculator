import 'dart:convert';

import 'test5.dart';
String userdetailsListToJson(List<Userdetails> studet) {
  List<Map<String, dynamic>> userList = studet.map((user) {
    return {
      'name': user.name,
      'email': user.email,
      'password': user.password,
      'darkmode': user.darkmode,
      'his': user.his.map((history) {
        return {
          'year': history.year,
          'month': history.month,
          
          'bmi': history.bmi,
        };
      }).toList(),
    };
  }).toList();

  return json.encode(userList);
}
