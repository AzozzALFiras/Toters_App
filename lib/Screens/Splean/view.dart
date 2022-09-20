import 'package:Toters/Screens/UnderBar/view.dart';
import 'package:flutter/material.dart';
import 'package:Toters/Screens/ConfigApp/ConfigApp.dart';
import 'package:Toters/Screens/HomePage/view.dart';

class Loading extends StatefulWidget {

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  Future Delay() async{
    await new Future.delayed(const Duration(seconds: 5));
    Navigator.push(context, MaterialPageRoute(builder: (context)=> MainNav()));
  }

  @override
  void initState(){
    super.initState();
    Delay();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorApp,
      body: Center(
        child: Text(
          Textwelcome,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
            fontFamily: "Cario",
          )

          ,
        ),
      ),
    );
  }
}