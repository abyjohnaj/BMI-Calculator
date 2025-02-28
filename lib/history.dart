import 'user.dart';

import 'package:flutter/material.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  
  @override
  Widget build(BuildContext context) {
  return  Scaffold(
    appBar: AppBar(
      
      title: Text("History",style: TextStyle(color:Userindex.darkmode?Color.fromARGB(255, 255, 255, 255):Color.fromARGB(255, 0, 0, 0),)),
      backgroundColor:Userindex.darkmode?Color.fromARGB(255, 0, 0, 0):Color.fromARGB(255, 255, 255, 255) ,
      
      
    ),
    backgroundColor:Userindex.darkmode?Color.fromARGB(255, 0, 0, 0):Color.fromARGB(255, 255, 255, 255) ,
      body:  ListView.builder(
  itemCount:  Userindex.history.length,
  itemBuilder: (context, index) {
  return ListTile(
    leading: Text( Userindex.history[index].bmi.toString(),style: TextStyle(color:Userindex.darkmode?Color.fromARGB(255, 255, 255, 255):Color.fromARGB(255, 0, 0, 0),)) ,
    title:Text( Userindex.history[index].month,style: TextStyle(color:Userindex.darkmode?Color.fromARGB(255, 255, 255, 255):Color.fromARGB(255, 0, 0, 0),)) ,
    subtitle: Text( Userindex.history[index].year,style: TextStyle(color:Userindex.darkmode?Color.fromARGB(255, 255, 255, 255):Color.fromARGB(255, 0, 0, 0),)),
  );
},),
    );
  }
}