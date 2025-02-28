



import 'function4.dart';
import 'user.dart';

import 'function2.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'homescreenfinal.dart';
import 'signupfinal.dart';

class Login extends StatefulWidget {
  const Login({Key? key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
         

  TextEditingController email=TextEditingController();

   TextEditingController password=TextEditingController();
  bool _passwordVisible = false;
bool passcor=false;
bool? isChecked=true;
  void _togglePasswordVisibility() {
    setState(() {
      _passwordVisible = !_passwordVisible;
    });
  }

@override


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        fit: StackFit.expand, // Make the stack children fill the entire screen
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Colors.black, Colors.blue],
              ),
            ),
          ),
          SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 40.0, horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 60.0),
                    child: Center(
                      child: Column(
                        children: [
                          Text(
                            "Welcome Back!",
                            style: GoogleFonts.outfit(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
                            ),
                          ),
                          SizedBox(height: 2),
                          Text(
                            "Login to continue",
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
                  Container(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(color: Color.fromARGB(255, 26, 49, 178)),
                            color: Colors.black,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.3),
                                spreadRadius: 2,
                                blurRadius: 5,
                                offset: Offset(0, 3),
                              ),
                            ],
                          ),
                          child: TextField(
                            controller: email,
                            decoration: InputDecoration(
                              hintText: "Email/Phone",
                              hintStyle: TextStyle(color: Color.fromARGB(153, 243, 240, 240)),
                              border: InputBorder.none,
                              prefixIcon: Icon(Icons.mail, color: Colors.grey),
                            ),
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        SizedBox(height: 20),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(color: Color.fromARGB(255, 26, 49, 178)),
                            color: Colors.black,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.3),
                                spreadRadius: 2,
                                blurRadius: 5,
                                offset: Offset(0, 3),
                              ),
                            ],
                          ),
                          child: TextField(
                            controller: password,
                            obscureText: !_passwordVisible,
                            decoration: InputDecoration(
                              hintText: "Password",
                              hintStyle: TextStyle(color: Color.fromARGB(153, 243, 240, 240)),
                              border: InputBorder.none,
                              prefixIcon: Icon(Icons.lock, color: Colors.grey),
                              suffixIcon: IconButton(
                                onPressed: _togglePasswordVisibility,
                                icon: Icon(_passwordVisible ? Icons.visibility : Icons.visibility_off),
                              ),
                            ),
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        SizedBox(height: 20),
                          Row(
      children: [
        Text("Remember me",style: TextStyle(color: const Color.fromARGB(255, 255, 255, 255)),),
        Checkbox(
             
              value: isChecked,
              onChanged: (bool? value) {
                setState(() {
                  isChecked = value;
                });
              },
            ),
      ],
    ),
                        ElevatedButton(
                          onPressed: () {
                                     passcor=false;

                                                               
   

for(int i=0;i<Userindex.user.length;i++)
{
  if(Userindex.user[i].email==email.text&&Userindex.user[i].password==password.text)

  {
passcor=true;
Userindex.name=Userindex.user[i].name;
Userindex.history=Userindex.user[i].his;
Userindex.index=i;
break;
  }
}
if(passcor==true)
{
  if(isChecked==true)
        {
storebool(true);
storeindex(Userindex.index.toString());
        }
        
 Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(builder: (context) => BmiHomeScreen()),
                            );
  }
  else{
     showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Color.fromARGB(255, 4, 7, 45),
content: Text("Invalid username or password",style: GoogleFonts.outfit(color: Colors.white,fontWeight: FontWeight.bold),),
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
  

                          },
                          child: Text(
                            "Login",
                            style: GoogleFonts.outfit(color: Colors.white, fontWeight: FontWeight.bold),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromARGB(255, 7, 27, 138),
                            fixedSize: Size.fromWidth(200),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                            shadowColor: Colors.blue, // Adjust shadow color
                            elevation: 5, // Adjust elevation
                          ),
                        ),
                        SizedBox(height: 20),
                        TextButton(
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>Signup()));
                          },
                          child: Text(
                            "Create an account",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
//                         ElevatedButton(
//   onPressed: () {
//     Navigator.push(context, MaterialPageRoute(builder: (_) => ForgotPasswordScreen()));
//   },
//   child: Text('Forgot Password?'),
// )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}