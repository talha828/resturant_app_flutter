import 'dart:async';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app_flutter/globle_variable.dart';
import 'package:restaurant_app_flutter/model/input_manager_model.dart';
import 'package:restaurant_app_flutter/screens/login_screen/login_screen.dart';
import 'package:restaurant_app_flutter/screens/main_screen/main_screen.dart';
import 'package:restaurant_app_flutter/screens/welcome_screen/welcome_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeRight,
    DeviceOrientation.landscapeLeft
  ]).then((_) => runApp(MyApp()));

}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
       providers: [
         ChangeNotifierProvider<InputManagerModel>(create:(_)=> InputManagerModel())
       ],
      child: MaterialApp(
        theme: ThemeData(
            scaffoldBackgroundColor: Colors.white.withOpacity(0.9),
          textTheme: GoogleFonts.latoTextTheme(
            Theme.of(context).textTheme,
          ),
        ),
        home:SplashScreen()
      ),
    );
  }
}

class SplashScreen extends StatefulWidget {

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(Duration(seconds: 2), ()=>Navigator.push(context, MaterialPageRoute(builder: (builder)=>LoginScreen())));
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    width=MediaQuery.of(context).size.width;
    height=MediaQuery.of(context).size.height;
    return Scaffold(
      body: Center(
        child: FlutterLogo(size: 30,),
      ),
    );
  }
}



class WelcomeScreenButton extends StatelessWidget {
  var onTap;
  var text;
  WelcomeScreenButton({this.text,this.onTap});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey.withOpacity(0.5))
        ),
        padding: EdgeInsets.symmetric(vertical: width * 0.02),
        margin: EdgeInsets.symmetric(horizontal: width * 0.4),
        child: Text(text,style: TextStyle(fontSize: width * 0.02,fontWeight: FontWeight.w300),textAlign: TextAlign.center,),
      ),
    );
  }
}

