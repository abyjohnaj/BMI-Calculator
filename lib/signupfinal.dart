
import 'user.dart';
import 'function.dart';
import 'function3.dart';
import 'test5.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:email_validator/email_validator.dart';

import 'loginfinal.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup>
   {
 TextEditingController name=TextEditingController();

  TextEditingController email=TextEditingController();

   TextEditingController password=TextEditingController();

  TextEditingController confirmpassword=TextEditingController();
      bool value=true;
      bool nameempty=false;
      bool emailempty=false;
      bool passwordempty=false;
      bool confirmpasswordempty=false;
      bool pasconsame=true;
      bool emailpresent=false;
      bool isValid=true;
      void passwordVisible() {
  setState(() {
    value = !value;
  });
}





     
      String jas="";
    

 



 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: 
      SingleChildScrollView(
        child: 
      Column(
        
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 60.0),
            child: Center(
              child: Column(
                children: [
                  Text(
                    "Let's Get Started!",
                    style: GoogleFonts.outfit(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                  ),
                  SizedBox(height: 2),
                  Text(
                    "Create an account to explore more features",
                    style: TextStyle(
                      color: Color.fromARGB(255, 235, 231, 231),
                      fontSize: 10,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 20), 
          Padding(
            padding: const EdgeInsets.all(20.0),
            
            child: TextField(
              controller: name,
              decoration: InputDecoration(
                labelText: "Name",
                errorText: nameempty?"this field can't be empty":null,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color.fromARGB(255, 26, 49, 178)),
                  borderRadius: BorderRadius.circular(30),
                ),
                labelStyle: TextStyle(color: Color.fromARGB(153, 243, 240, 240)),
                filled: true,
                fillColor: Colors.black,
                prefixIcon: Padding(
                  padding: EdgeInsets.only(left: 15.0, right: 8.0),
                  child: Icon(Icons.person, color: Colors.grey),
                ),
              ),
              style: TextStyle(color: Colors.white),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextField(
              controller: email,
              decoration: InputDecoration(
                labelText: "Email/Phone",
                errorText: emailempty?"this field can't be empty":isValid?null:"Invalid email id",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color.fromARGB(255, 26, 49, 178)),
                  borderRadius: BorderRadius.circular(30),
                ),
                labelStyle: TextStyle(color: Color.fromARGB(153, 243, 240, 240)),
                filled: true,
                fillColor: Colors.black,
                prefixIcon: Padding(
                  padding: EdgeInsets.only(left: 15.0, right: 8.0),
                  child: Icon(Icons.mail, color: Colors.grey),
                ),
              ),
              style: TextStyle(color: Colors.white),
            ),
          ),
            Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextField(
              controller: password,
              obscureText: true, 
              decoration: InputDecoration(
                labelText: "Password",
                errorText: passwordempty?"this field can't be empty":null,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color.fromARGB(255, 26, 49, 178)),
                  borderRadius: BorderRadius.circular(30),
                ),
                labelStyle: TextStyle(color: Color.fromARGB(153, 243, 240, 240)),
              
                prefixIcon: Padding(
                  padding: EdgeInsets.only(left: 15.0, right: 8.0),
                  child: Icon(Icons.lock, color: Colors.grey),
                ),
              ),
              style: TextStyle(color: Colors.white),
            ),
          ),
           Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextField(
              controller: confirmpassword,
              obscureText: value, 
              decoration: InputDecoration(suffixIcon: IconButton(
    onPressed: passwordVisible,
    icon: Icon(value ? Icons.visibility : Icons.visibility_off),),
                labelText: "Confirm Password",
                errorText: confirmpasswordempty?"this field can't be empty":pasconsame?null:"password and confirm password not same",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color.fromARGB(255, 26, 49, 178)),
                  borderRadius: BorderRadius.circular(30),
                ),
                labelStyle: TextStyle(color: Color.fromARGB(153, 243, 240, 240)),
                
                prefixIcon: Padding(
                  padding: EdgeInsets.only(left: 15.0, right: 8.0),
                  child: Icon(Icons.lock, color: Colors.grey),
                ),
              ),
              style: TextStyle(color: Colors.white),
            ),
          ),

          ElevatedButton(onPressed: (){
              if(name.text.isEmpty||password.text.isEmpty||email.text.isEmpty||confirmpassword.text.isEmpty)
              {
                  setState(() {
        nameempty=name.text.isEmpty;
        emailempty=email.text.isEmpty;
        passwordempty=password.text.isEmpty;
        confirmpasswordempty=confirmpassword.text.isEmpty;
    });
              }
              else
              {
                           setState(() {
        nameempty=name.text.isEmpty;
        emailempty=email.text.isEmpty;
        passwordempty=password.text.isEmpty;
        confirmpasswordempty=confirmpassword.text.isEmpty;
        isValid=EmailValidator.validate(email.text);
        pasconsame=true;

    });

 
if(isValid==true)
{
   

          for(int i=0;i<Userindex.user.length;i++)
{
  if(Userindex.user[i].email==email.text)

  {
emailpresent=true;

break;
  }
}
if(emailpresent==true)
{
    emailpresent=false;
     showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Color.fromARGB(255, 4, 7, 45),
content: Text("This email address is already in use. Please use a different email address or log in to your existing account.",style: GoogleFonts.outfit(color: Colors.white,fontWeight: FontWeight.bold),),
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



    else if(password.text!=confirmpassword.text)
    {
                  setState(() {
       pasconsame=false;
    });
    }
    else
    {
                   Userdetails obj=Userdetails(name.text, email.text, password.text, confirmpassword.text,[]);
Userindex.user.add(obj);
jas=userdetailsListToJson(Userindex.user);
storedata(jas);
    setState(() {
          name.clear();
     email.clear();
     password.clear();
     confirmpassword.clear();
    });
    Navigator.push(context, MaterialPageRoute(builder: (context)=>Login()));
   } }} }, child: Text("Create",style: GoogleFonts.outfit(color: Colors.white,fontWeight: FontWeight.bold),),style: ElevatedButton.styleFrom(backgroundColor: Color.fromARGB(255, 7, 27, 138) ,fixedSize: Size.fromWidth(200),),)
        
        ,Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: TextButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>Login()));}, child: Text("already have an account? Login",style: TextStyle(color: Colors.white,fontStyle: FontStyle.italic,),)),
        )

        ,
        ],
      ),
      
    )
);
}
}