import 'dart:async';


import 'package:beginners/my_screen/homescreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class logincreeat extends StatefulWidget {
  const logincreeat({super.key});

  @override
  State<logincreeat> createState() => _logincreeatState();
}

class _logincreeatState extends State<logincreeat> {
  final emailcontroler = TextEditingController();
  final passwordcontroler = TextEditingController();
  final userdcontroler = TextEditingController();
  final phonecontroler = TextEditingController();
  bool good=false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
              'assets/shape8.png',
            ),

            Text(
              'Walcome Me !',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
            ),
            buildTextFormField(userdcontroler, "Username", Icons.person,
                TextInputType.text),
            buildTextFormField(passwordcontroler, "passoword", Icons.lock_open,
                TextInputType.text),
            buildTextFormField(emailcontroler, "Email", Icons.email,
                TextInputType.text),
            buildTextFormField(phonecontroler, "Phone", Icons.phone,
                TextInputType.text),
            SizedBox(height: 10,),
            GestureDetector(
              onTap: (){
                saveData();
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){return Homescreen();}));
              },
              child: Container(
                alignment: Alignment.center,
                height: 45,
                margin: EdgeInsets.only(left:18,right:18,bottom: 9 ),
                decoration: BoxDecoration(
                    color: Colors.orange[400],
                    borderRadius: BorderRadius.all(Radius.circular(10))
                ),
                child: Text("Create",style: TextStyle(color: Colors.black,fontSize: 19,fontWeight: FontWeight.bold)),
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Already have an account? ",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15,color: Colors.black54)),
                GestureDetector(
                    onTap: (){

                     

                    },
                    child: Text("Login",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15,decoration: TextDecoration.underline),))
              ],
            ),
        Container(
          margin: EdgeInsets.only(top: 24),
          child: Image.asset(
                  'assets/shape9.png',
                ),
        ),
          ],
        ),
      ),
    );
  }
  Future saveData()async{
    String email=emailcontroler.text;
    String password=passwordcontroler.text;
   SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
    sharedPreferences.setString("email",email);
    sharedPreferences.setString("password",password);


  }


  Widget buildTextFormField(controler, hintext, icon, number) {
    return Container(
      height: 50,
      margin: EdgeInsets.only(left: 20,right: 20, top: 8),
      child: TextFormField(
        controller: controler,
        keyboardType: number,
        style: TextStyle(
          fontSize: 16,
          color: Colors.green,
          fontWeight: FontWeight.w900,
        ),
        decoration: InputDecoration(
            hintText: hintext,
            hintStyle: TextStyle(color: Colors.grey[400]),
            prefixIcon: Icon(icon),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.orange.shade300,
                  width: 2,
                )),
            border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.orange,
                  width: 15,
                ))),
      ),
    );
  }
}
