import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_app_flutter/globle_variable.dart';

class BottomButton extends StatelessWidget {
  const BottomButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color:Colors.white,
      padding: EdgeInsets.symmetric(vertical:width * 0.028,horizontal: width * 0.054),
      child: Row(
        children: [
          Icon(Icons.home_work_sharp,color: Colors.grey,size: width * 0.025,),
          SizedBox(
            width:  width * 0.01,
          ),
          Text("Home",style: TextStyle(
              fontSize: width * 0.015
          ),),
        ],
      ),
    );
  }
}