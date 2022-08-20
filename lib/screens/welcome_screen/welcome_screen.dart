import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:restaurant_app_flutter/globle_variable.dart';
import 'package:restaurant_app_flutter/main.dart';
import 'package:restaurant_app_flutter/screens/main_screen/main_screen.dart';

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
    _timeString= clockStatus=="Clock In"?"Not Clock In":"$date $time";
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
            WelcomeScreenButton(text:"Access Register",onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>MainScreen())),),
            SizedBox(height: 1,),
            WelcomeScreenButton(text:"Exit",onTap: (){}),
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