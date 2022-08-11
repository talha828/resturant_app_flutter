import 'package:flutter/material.dart';
import 'package:restaurant_app_flutter/globle_variable.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white.withOpacity(0.9),
        body: Container(
          padding: EdgeInsets.symmetric(vertical: width * 0.02 ,horizontal: width *0.02),
          child:
          Row(
            children: [
              Container(
                margin: EdgeInsets.only(right: width * 0.02),
                child: Column(
                  children: [
                    Container(
                      width: width * 0.2,
                      height: width * 0.08,
                      color: Colors.white.withOpacity(0.7),
                      child: Column(),
                    ),
                    Container(
                      width: width * 0.2,
                      height: width * 0.25,
                      color: Colors.white,
                      child: Column(),
                    ),
                    Container(
                      width: width * 0.2,
                      height: width * 0.08,
                      color: Colors.white.withOpacity(0.7),
                      child: Column(),
                    )
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: width * 0.07 ,
                      child: ListView.separated(
                        shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context,index){
                        return Container(
                         padding: EdgeInsets.symmetric(horizontal: width * 0.0142),
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(3),
                          ),
                          child:Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Icon(Icons.local_print_shop_outlined,color: Colors.white,size: width * 0.029,),
                              Text("Printer",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: width * 0.014),)
                            ],
                          ) ,
                        );
                      }, separatorBuilder: (context,index){
                        return SizedBox(width: width * 0.01,);
                      }, itemCount: 15),
                    ),
                    SizedBox(height: width * 0.01,),
                    Container(
                      color: Colors.white,
                      height: width * 0.044,
                      width: width * 0.73,
                      child: TextField(
                        textAlignVertical: TextAlignVertical.top,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(horizontal: width * 0.03,vertical: 0),
                            enabledBorder: InputBorder.none,
                          hintText: "Search Products",
                          hintStyle: TextStyle(
                            fontSize: width * 0.018
                          ),
                          suffixIcon: Icon(Icons.search,size: width * 0.03,)
                        ),
                      ),
                    ),
                    SizedBox(height: width * 0.01,),
                    Container(
                      height: width * 0.08 ,
                      child: ListView.separated(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context,index){
                            return Container(
                              padding: EdgeInsets.symmetric(horizontal: width * 0.0131),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child:Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Icon(Icons.local_print_shop_outlined,color: Colors.red,size:  width * 0.035,),
                                  Text("Printer",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.red,fontSize: width * 0.018),)
                                ],
                              ) ,
                            );
                          }, separatorBuilder: (context,index){
                        return SizedBox(width: width * 0.01,);
                      }, itemCount: 8),
                    ),
                    SizedBox(height: width * 0.01,),
                    Container(
                      height: width * 0.08 ,
                      child: ListView.separated(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context,index){
                            return Container(
                              padding: EdgeInsets.symmetric(horizontal: width * 0.0131),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child:Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Icon(Icons.local_print_shop_outlined,color: Colors.red,size:  width * 0.035,),
                                  Text("Printer",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.red,fontSize: width * 0.018),)
                                ],
                              ) ,
                            );
                          }, separatorBuilder: (context,index){
                        return SizedBox(width: width * 0.01,);
                      }, itemCount: 8),
                    ),
                    SizedBox(height: width * 0.02,),

                    Row(
                      children: [
                        BottomButton(),
                        BottomButton(),
                        BottomButton(),
                        BottomButton(),
                      ],
                    )
                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}

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
