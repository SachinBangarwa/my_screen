import 'package:beginners/my_screen/homescreen.dart';
import 'package:beginners/my_screen/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Splesment extends StatefulWidget {
  const Splesment({super.key});

  @override
  State<Splesment> createState() => _SplesmentState();
}

class _SplesmentState extends State<Splesment> {
  @override
  void initState()async {
    SharedPreferences sh=await SharedPreferences.getInstance();
    bool? value=sh.getBool("istrue");
    if(value==true){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){return Homescreen();}));
    }else{
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){return LoginScreen();}));

    }
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TextButton(onPressed: (){
        FutureBuilder(future: awert(),builder: (context, snapshot) => CircularProgressIndicator(),);
      },child: Text("Runing time"),)
    );
  }
  Future awert()async{
    await Future.delayed(Duration(microseconds: 10));

  }
}
