import 'dart:async';

import 'package:beginners/my_screen/creataccound.dart';
import 'package:beginners/my_screen/homescreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailcontroler = TextEditingController();
  final passwordcontroler = TextEditingController();
  bool good=false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
              'assets/shape7.png',
            ),
            SizedBox(
              height: 50,
            ),
            Text(
              'Walcome Back !',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 19,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            buildTextFormField(emailcontroler, "Email", Icons.email_outlined,
                TextInputType.text),
            buildTextFormField(passwordcontroler, "passoword", Icons.lock_open,
                TextInputType.text),
            Row(
              children: [
                Checkbox(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                  side: BorderSide(color:Colors.orange,width: 2 ),
                    checkColor: Colors.white, // The color of the checkmark inside the box
                    activeColor: Colors.orange, // The background color when checked
                    hoverColor: Colors.grey,  // Color when hovered
                    focusColor: Colors.grey,
                    value: good, onChanged: (value){
                 good= value!;
                 setState(() {});
                }),
                Text("Remember me",style: TextStyle(color: Colors.orange,fontSize: 17,fontWeight: FontWeight.bold),)
              ],
            ),
            GestureDetector(
              onTap: (){
                getData();
              },
              child: Container(
                alignment: Alignment.center,
                height: 52,
                margin: EdgeInsets.only(left:18,right:18,bottom: 15 ),
                decoration: BoxDecoration(
                  color: Colors.orange[400],
                  borderRadius: BorderRadius.all(Radius.circular(10))
                ),
                child: Text("Login",style: TextStyle(color: Colors.black,fontSize: 19,fontWeight: FontWeight.bold)),
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Don't have an account? ",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15,color: Colors.black54)),
                GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>logincreeat()));

                  },
                    child: Text("Sing up",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15,decoration: TextDecoration.underline),))
              ],
            ),

            Container(
              margin: EdgeInsets.only(top: 40),
              child: Image.asset(
                'assets/shape6.png',
              ),
            ),
          ],
        ),
      ),
    );
  }
  Future getData()async{
    String email=emailcontroler.text;
    String password=passwordcontroler.text;
    SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
  String? emailvalue = sharedPreferences.getString("email");
    String? passorwvalue = sharedPreferences.getString("password");

    if(emailvalue==email&&passorwvalue==password){
      sharedPreferences.setBool("istrue", true);
      Navigator.push(context, MaterialPageRoute(builder: (context)=>Homescreen()));
    }else{
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Increct email/password")));
    }
  }

  Widget buildTextFormField(controler, hintext, icon, number) {
    return Container(
      height: 50,
      margin: EdgeInsets.only(left: 15,right: 15, top: 14),
      child: TextFormField(
        controller: controler,
        keyboardType: number,
        style: TextStyle(
          fontSize: 15,
          color: Colors.black54,
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
