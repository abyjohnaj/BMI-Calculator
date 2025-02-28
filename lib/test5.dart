

import 'dart:convert';
class Userdetails{
  String name;
  String email;
  String password;
  String darkmode;
  
  List<Historydetails> his=[];
  Userdetails(this.name,this.email,this.password,this.darkmode,this.his);
     factory Userdetails.fromJson(Map<String, dynamic> json) {
    return Userdetails(
      json['name'],
      json['email'],
      json['password'],
      json['darkmode'],
      (json['his'] as List<dynamic>)
          .map((historyJson) => Historydetails.fromJson(historyJson))
          .toList(),
    );
  }
}
class Historydetails{
  String year;
  String month;

double bmi;
  Historydetails(this.year,this.month,this.bmi);
     factory Historydetails.fromJson(Map<String, dynamic> json) {
    return Historydetails(
      json['year'],
      json['month'],
      
      json['bmi'].toDouble(),
    );
  }
}