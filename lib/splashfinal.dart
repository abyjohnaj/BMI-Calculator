
import 'dart:convert';

import 'function4.dart';
import 'user.dart';
import 'function.dart';
import 'function2.dart';
import 'test5.dart';
import 'package:flutter/material.dart';


import 'homescreenfinal.dart';
import 'loginfinal.dart';


class SplashScreenHw extends StatefulWidget {
  const SplashScreenHw({super.key});

  @override
  State<SplashScreenHw> createState() => _SplashScreenHwState();
}

class _SplashScreenHwState extends State<SplashScreenHw> {
  List<Userdetails> user=[];

String s="";
String ind="";
 String jas="";
 int index=0;
  @override
   @override
   
  void initState() {
    // TODO: implement initState
    super.initState();
    spl();
  }

  void spl()async
  {
    await Future.delayed(Duration(seconds: 4));
    bool r= await retrievebool();
    s=await retrievedata();
    ind=await retrieveindex();
    
           if(s!="")
  {
  List<dynamic> decodedList = json.decode(s);

  // Convert to a list of Userdetails objects
  user = decodedList.map((json) => Userdetails.fromJson(json)).toList();
  }
  else{
    user=[];
  }
  Userindex.user=user;
    if(r)
    {
      index=int.parse(ind);
      Userindex.name=Userindex.user[index].name;
Userindex.history=Userindex.user[index].his;
Userindex.index=index;
    Navigator.push(
    context,
    MaterialPageRoute(builder: (context) =>  BmiHomeScreen()),
  );
 
  }
      else
    {
    Navigator.push(
    context,
    MaterialPageRoute(builder: (context) =>  Login()),
  );
 
  }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 5, 8, 39),
    body: 
    Center(
      child:Container(
        width: 110,
        height: 110,
        child: Image.network("https://play-lh.googleusercontent.com/wiLKNn9tyY-SiNWg_Pib1stLmZU9lYuadq-Y4ASfi7OtJzLDmDknUFcqejQjw4Sqjg")) 
    ),
    );
  }
  
  
  
  
}