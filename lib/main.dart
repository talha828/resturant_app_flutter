import 'dart:async';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:restaurant_app_flutter/globle_variable.dart';

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
    return MaterialApp(
      // theme: ThemeData(
      //   // textTheme: GoogleFonts.latoTextTheme(
      //   //   Theme.of(context).textTheme,
      //   // ),
      // ),
      home:SplashScreen()
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
    Timer(Duration(seconds: 2), ()=>Navigator.push(context, MaterialPageRoute(builder: (builder)=>WelcomeScreen())));
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

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  String _timeString= "Not Clock In";
  String clockStatus="Clock In";
  setClock(){
    clockStatus=clockStatus=="Clock In"?"Clock Out":"Clock In";
    var date =DateFormat('yyyy/MM/dd').format(DateTime.now());
    var time=formatedTime(TimeOfDay.now());
    _timeString= clockStatus=="Clock In"?"$date $time":"Not Clock In";
    setState(() {});
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white.withOpacity(0.9),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            FlutterLogo(size: 30,),
            Text("Welcome to Food Zone",style: TextStyle(fontSize: width * 0.021,fontWeight: FontWeight.w200),textAlign: TextAlign.center,),
            Text(_timeString,style: TextStyle(fontSize: width * 0.021,fontWeight: FontWeight.w200),textAlign: TextAlign.center,),
            WelcomeScreenButton(text:clockStatus,onTap: ()=>setClock()),
            WelcomeScreenButton(text:"Access Register",onTap: (){},),
            SizedBox(height: 1,),
            WelcomeScreenButton(text:"Exit",onTap: (){},),
          ],
        ),
      ),
    );
  }
  String formatedTime(TimeOfDay selectedTime) {
    DateTime tempDate = DateFormat.Hms().parse(selectedTime.hour.toString() +
        ":" +
        selectedTime.minute.toString() +
        ":" +
        '0' +
        ":" +
        '0');
    var dateFormat = DateFormat("h:mm a");
    return (dateFormat.format(tempDate));
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

