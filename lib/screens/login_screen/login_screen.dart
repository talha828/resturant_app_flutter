
import 'package:flutter/material.dart';
import 'package:restaurant_app_flutter/globle_variable.dart';
import 'package:restaurant_app_flutter/main.dart';
import 'package:restaurant_app_flutter/screens/welcome_screen/welcome_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController phoneNumber =TextEditingController();
  TextEditingController code =TextEditingController();

  @override
  void dispose() {
    phoneNumber.clear();
    code.clear();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    width=MediaQuery.of(context).size.width;
    height=MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.9),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            FlutterLogo(size: 30,),
            Text("Welcome to Food Zone",style: TextStyle(fontSize: width * 0.021,fontWeight: FontWeight.w200),textAlign: TextAlign.center,),
            Text("Login To get access of your account",style: TextStyle(fontSize: width * 0.021,fontWeight: FontWeight.w200),textAlign: TextAlign.center,),
            LoginTextField(controller: phoneNumber,label: "Phone Number",hintText: "+923012070920",),
            LoginTextField(controller: code,label: "Password",hintText: "555",),
            WelcomeScreenButton(text:"Login",onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>WelcomeScreen()))),
          ],
        ),
      ),
    );
  }
}

class LoginTextField extends StatelessWidget {
  LoginTextField({this.hintText,this.controller,this.label});
  TextEditingController controller;
  String label;
  String hintText;

  @override
  Widget build(BuildContext context) {
    return Container(
     color: Colors.white,
      margin: EdgeInsets.symmetric(horizontal: width * 0.3),
      child: TextField(
        controller:controller ,
        decoration: InputDecoration(
         // border: InputBorder.none,
          labelText: label,
          //enabledBorder: InputBorder.none,
          hintText:hintText,
            contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            focusedBorder: OutlineInputBorder(
              borderSide:
              BorderSide(color: Colors.grey.withOpacity(0.8), width: 0.0),
            ),
            enabledBorder: const OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.grey, width: 0.0),
            ),
            errorBorder: const OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.red, width: 0.0),
            ),
          //contentPadding: EdgeInsets.symmetric(horizontal: width * 0.02,vertical: 0.04)
        ),
      ),
    );
  }
}
