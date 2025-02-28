

import 'user.dart';
import 'function.dart';
import 'function2.dart';
import 'function3.dart';
import 'test5.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'history.dart';
import 'loginfinal.dart';


class BmiHomeScreen extends StatefulWidget {
  const BmiHomeScreen({super.key});

  @override
  State<BmiHomeScreen> createState() => _BmiHomeScreenState();
}

class _BmiHomeScreenState extends State<BmiHomeScreen> {


  double _currentslidervalue=100.0;
  bool maleselected=false;
  bool femaleselected=false;
  int weight=40;
  int age=10;
bool _isSwitched=false;
 


   void selectgender(String a)
  {
    setState(() {
    
  
    
      if(a=='male')
      {
        maleselected=!maleselected;
        femaleselected=false;

      }
      else{
        femaleselected=!femaleselected;
         maleselected=false;
         
      }
      });
  }
 
 void increaseweight()
 {
  setState(() {

    weight++;
    
  });
 }
 void decreaseweight() {
    setState(() {
      if (weight > 10) {
        weight--;
      }
    });
  }
  void increaseage()
  {
    setState(() {

      age++;
      
    });
  }
  void decreaseage()
  {
   setState(() {
    if(age>1)
      age--;
   });
  }

  void calculateBMI() {
    double heightInMeters = _currentslidervalue / 100;
    double bmi = weight / (heightInMeters * heightInMeters);
    String bmiCategory = "";

   if (maleselected) {
      if (bmi < 18.5) {
        bmiCategory = "Underweight";
      } else if (bmi < 24.9) {
        bmiCategory = "Normal weight";
      } else if (bmi < 29.9) {
        bmiCategory = "Overweight";
      } else {
        bmiCategory = "Obesity";
      }
    } else if (femaleselected) {
      if (bmi < 18.5) {
        bmiCategory = "Underweight";
      } else if (bmi < 24.9) {
        bmiCategory = "Normal weight";
      } else if (bmi < 29.9) {
        bmiCategory = "Overweight";
      } else {
        bmiCategory = "Obesity";
      }
    } else {
      bmiCategory = "Please select a gender";
    }
if(maleselected||femaleselected){
  Historydetails obj=Historydetails(DateFormat('yyyy-MM-dd HH:mm:ss').format( DateTime.now()),bmiCategory,double.parse(bmi.toStringAsFixed(2)));
Userindex.history.add(obj);


 
  
  Userindex.user[Userindex.index].his=Userindex.history;
  String jas=userdetailsListToJson(Userindex.user);
storedata(jas);

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Color.fromARGB(255, 4, 7, 45),
        title: Text(
          "BMI Result",
          style: GoogleFonts.outfit(
            fontWeight: FontWeight.bold,color: Colors.white
          ),
        ),
        content: Text(
          "Your BMI is ${bmi.toStringAsFixed(2)}\nYou are $bmiCategory.",
          style: GoogleFonts.outfit(fontWeight: FontWeight.bold,color: Colors.white),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text(
              "OK",
              style: GoogleFonts.outfit(
                fontWeight: FontWeight.bold,color: Colors.white
              ),
            ),
          ),
        ],
      ),
    );
  }
  else{
     showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Color.fromARGB(255, 4, 7, 45),
        title: Text(
          "BMI Result",
          style: GoogleFonts.outfit(
            fontWeight: FontWeight.bold,color: Colors.white
          ),
        ),content: Text("Please select a Gender",style: GoogleFonts.outfit(color: Colors.white,fontWeight: FontWeight.bold),),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text(
              "OK",
              style: GoogleFonts.outfit(
                fontWeight: FontWeight.bold,color: Colors.white
              ),
            ),
          ),
        ],
      )
     );
  }
  }
  


  @override
  Widget build(BuildContext context) {
    return 
    
     Scaffold(
     
     drawer: Drawer(
  backgroundColor:_isSwitched?Color.fromARGB(255, 0, 0, 0):Color.fromARGB(255, 255, 255, 255),
  child: Column(
    
    children: [
      
      Container(
        
        
        
        child: DrawerHeader(
        
        child: Row(
             children: [
              

              IconButton(onPressed: (){
                Navigator.of(context).pop();
                
              }, icon: Icon(Icons.menu,color: _isSwitched?Color.fromARGB(255, 255, 255, 255):Color.fromARGB(255, 0, 0, 0),)),
              SizedBox(width: 10,),
              Text("Menu",style: GoogleFonts.outfit(color: _isSwitched?Color.fromARGB(255, 255, 255, 255):Color.fromARGB(255, 0, 0, 0),fontWeight: FontWeight.bold),),
             
             ],
        
        ),
        
        ),
        
      ),
      Expanded(
        child: Column(
          children: [
            ListTile(
                    leading: Text('Dark Mode',style: GoogleFonts.outfit(fontWeight: FontWeight.bold,color: _isSwitched?Color.fromARGB(255, 255, 255, 255):Color.fromARGB(255, 0, 0, 0),),),
                    title:    Switch(
                      value: _isSwitched,
                      onChanged: (value) {
                        setState(() {
                          _isSwitched = value;
                          Userindex.darkmode=value;
                        });
                      },
                      activeTrackColor: Color.fromARGB(255, 61, 12, 255),
                      activeColor: Color.fromARGB(255, 2, 24, 90),
                    ),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                   ListTile(
            leading: 
            Icon(Icons.person,color: _isSwitched?Color.fromARGB(255, 255, 255, 255):Color.fromARGB(255, 0, 0, 0),),
            title: TextButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Homescreen()));
                }, child: Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: Text("History",style: GoogleFonts.outfit(color: _isSwitched?Color.fromARGB(255, 255, 255, 255):Color.fromARGB(255, 0, 0, 0),fontWeight: FontWeight.bold),),
            )),
          )
          ],
        ),
      ),
      ListTile(
            leading: 
            Icon(Icons.logout,color: _isSwitched?Color.fromARGB(255, 255, 255, 255):Color.fromARGB(255, 0, 0, 0),),
            title: TextButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Login()));
                storebool(false);}, child: Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: Text("Logout",style: GoogleFonts.outfit(color: _isSwitched?Color.fromARGB(255, 255, 255, 255):Color.fromARGB(255, 0, 0, 0),fontWeight: FontWeight.bold),),
            )),
          )
    ],

  ),
  
),

      
appBar: AppBar(
  leading: Builder(builder: (context) =>  IconButton(onPressed:(){
    Scaffold.of(context).openDrawer();}
  , icon: Padding(
    padding: const EdgeInsets.only(top: 12.0),
    child: Icon(Icons.menu,color: _isSwitched?Color.fromARGB(255, 255, 255, 255):Color.fromARGB(255, 0, 0, 0),),
  ),),),
  title: //Center(
    //child:
     Padding(
       padding: const EdgeInsets.only(top: 12.0),
       child: Text(
        "BMI Calculator",
        style: GoogleFonts.outfit(
          color: _isSwitched?Color.fromARGB(255, 255, 255, 255):Color.fromARGB(255, 0, 0, 0),
          fontWeight: FontWeight.bold,
        ),
           ),
     ),
  //),
actions: [Padding(
  padding: const EdgeInsets.only(top: 12.0),
  child: Text("Welcome ${Userindex.name}",style: GoogleFonts.outfit(color: _isSwitched?Color.fromARGB(255, 255, 255, 255):Color.fromARGB(255, 0, 0, 0),fontWeight: FontWeight.bold,fontSize: 16),),
), SizedBox(width: 20),],
  
  backgroundColor: _isSwitched?Color.fromARGB(255, 0, 0, 0):Color.fromARGB(255, 255, 255, 255),
),





body: SizedBox(
  
  child: ListView(
    children: [
      Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            

              child: InkWell(
                child: 
                Container(width: 180,height: 205,
                decoration: BoxDecoration(color:maleselected?Color.fromARGB(255, 142, 27, 27):Color.fromARGB(255, 4, 7, 45), borderRadius: BorderRadius.circular(20)),
                child: 
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                     Center(child: Icon(Icons.male,color: Colors.white,size:80 ,)),
                    Text("MALE",style: GoogleFonts.outfit(
          color: Colors.white,
          fontWeight: FontWeight.bold
        
        ),)
                  ],
                )
                 ),
                 onTap: () {
                   
                  
                  selectgender('male');
                 
                  
                   
                 },
              ),
            
          ),
        Spacer(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              child: Container(width: 180,height: 205,
              decoration:BoxDecoration( color:femaleselected?Color.fromARGB(255, 142, 27, 27):Color.fromARGB(255, 4, 7, 45),borderRadius: BorderRadius.circular(20)),
              child: 
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.female,color: Colors.white,size:80 ,),
                  Text("FEMALE",style: GoogleFonts.outfit(
          color: Colors.white,
          fontWeight: FontWeight.bold
        
        ),)
                ],
              )),
              onTap: () {
                
              
               
                  selectgender('female');
                 
                
              },
            ),
            
          )
        ],
      ),
       Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(width: 370,height: 205,
            decoration:BoxDecoration( color:Color.fromARGB(255, 4, 7, 45),borderRadius: BorderRadius.circular(20)),
            child: Column(children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('HEIGHT (in cm)',style: GoogleFonts.outfit(
          color: Colors.white,
          fontWeight: FontWeight.bold
        
        ),),
                ),
              ),
             Text(_currentslidervalue.toStringAsFixed(0),style: TextStyle(color: Colors.white,
             fontSize: 60),),
             SliderTheme(
  data: SliderTheme.of(context).copyWith(
    trackHeight: 0.2, // Make the slider line thinner
    thumbColor: Color.fromARGB(255, 161, 11, 11), // Change the thumb color
    activeTrackColor: Color.fromARGB(255, 255, 255, 255), // Active track color
    inactiveTrackColor: Colors.grey, // Inactive track color
  ),
  child: Slider(
    value: _currentslidervalue,
    max: 200,
    divisions: 200,
    label: _currentslidervalue.toStringAsFixed(0),
    onChanged: (double value) {
      setState(() {
        _currentslidervalue = value;
      
      });
    },
  ),
)

             

            ],),),
          ),

          Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(width: 180,height: 205,
            decoration: BoxDecoration(color:Color.fromARGB(255, 4, 7, 45), borderRadius: BorderRadius.circular(20)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("WEIGHT (in kg)",style: GoogleFonts.outfit(
          color: Colors.white,
          fontWeight: FontWeight.bold
        
        ),),
              ),
              Text('$weight',style: TextStyle(color: Colors.white,fontSize: 60),),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CircleAvatar(backgroundColor: Color.fromARGB(175, 60, 62, 64),
                        child:
                        IconButton(onPressed: decreaseweight, icon: Icon(Icons.remove,color: Colors.white,))
                        ),
                      ),
                  
                       Padding(
                         padding: const EdgeInsets.all(8.0),
                         child: CircleAvatar(backgroundColor: Color.fromARGB(175, 60, 62, 64),
                                               child:
                                               IconButton(onPressed: (){
                                                increaseweight();
                                               }, icon: Icon(Icons.add,color: Colors.white,))
                                               ),
                       ),
                  
                    ],
                  ),
                )
            
            ],
            
            
            ),
             ),
          ),
        Spacer(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(width: 180,height: 205,
            decoration:BoxDecoration( color:Color.fromARGB(255, 4, 7, 45),borderRadius: BorderRadius.circular(20)),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("AGE",style: GoogleFonts.outfit(
          color: Colors.white,
          fontWeight: FontWeight.bold
        
        ),),
                ),
                Text("$age",style: TextStyle(color: Colors.white,fontSize: 60),),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CircleAvatar(backgroundColor: Color.fromARGB(175, 60, 62, 64),
                        child:
                        IconButton(onPressed: (){
                          decreaseage();
                        }, icon: Icon(Icons.remove,color: Colors.white,))
                        ),
                      ),
                  
                       Padding(
                         padding: const EdgeInsets.all(8.0),
                         child: CircleAvatar(backgroundColor: Color.fromARGB(175, 60, 62, 64),
                                               child:
                                               IconButton(onPressed: (){
                                                increaseage();
                                               }, icon: Icon(Icons.add,color: Colors.white,))
                                               ),
                       ),
                  
                    ],
                  ),
                )
                
                
              ],
            ),
            ),
            
          )
        ],
      ),
      Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              child: Container(width: 370,height:60 ,
              decoration: BoxDecoration(color:Color.fromARGB(255, 142, 27, 27), borderRadius: BorderRadius.circular(20)),
              child: Center(child: Text("CALCULATE",style: GoogleFonts.outfit(
          color: Colors.white,
          fontWeight: FontWeight.bold
        
        ),)),
              
               ),
               onTap: () {
                
                calculateBMI();
                 
               },
            ),
          ),
          
    ],
    
  ),
),
         
         backgroundColor:_isSwitched?Color.fromARGB(255, 0, 0, 0):Color.fromARGB(255, 255, 255, 255),
         
        
    
);
}
}