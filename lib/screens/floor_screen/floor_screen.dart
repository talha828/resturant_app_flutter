import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:restaurant_app_flutter/globle_variable.dart';
import 'package:restaurant_app_flutter/model/category_model.dart';

class FloorScreen extends StatefulWidget {
  const FloorScreen({Key key}) : super(key: key);

  @override
  State<FloorScreen> createState() => _FloorScreenState();
}

class _FloorScreenState extends State<FloorScreen> {



  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        body: Column(
          //crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: width * 0.01,horizontal: width * 0.014 ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                      onTap:(){                                    Navigator.of(context)..pop()..pop();

                      },
                      child: Text("Back",style: TextStyle(color: Colors.red,),)),
                  Expanded(child: Container(child: Center(child: Text("Table",style: TextStyle(color: Colors.red,fontSize: width * 0.026),)))),
                  Text("Reservation Edit",style: TextStyle(color: Colors.red,),),
                ],
              ),
            ),
            Container(
              child: Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Column(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: width * 0.02,vertical: width * 0.02),
                          child: GridView.count(
                              crossAxisCount: 5,
                              shrinkWrap: true,
                              childAspectRatio: 1.5,
                              children:List.generate(8, (index) {
                                return InkWell(
                                  onTap: () {
                                    Navigator.of(context)..pop()..pop();
                                  },
                                  child: Container(
                                    margin: EdgeInsets.symmetric(
                                        vertical: width * 0.01,
                                        horizontal: width * 0.01),
                                    width: width * 0.13,
                                    padding: EdgeInsets.symmetric(
                                        horizontal: width * 0.0131),
                                    decoration: BoxDecoration(
                                      color: Colors.red,
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                      children: [
                                        FaIcon(
                                          FontAwesomeIcons.table,
                                          color: Colors.white,
                                          size: width * 0.025,
                                        ),
                                        FittedBox(
                                          child: Text(
                                            "Table $index",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w100,
                                                color: Colors.white,
                                                fontSize: width * 0.018),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              })
                          ),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        SizedBox(
                          height: width * 0.01,
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(width * 0.005),
                          child: Container(
                            padding:
                            EdgeInsets.symmetric(vertical: width * 0.01),
                            width: width * 0.13,
                            alignment: Alignment.center,
                            color: Colors.white,
                            height: width * 0.06,
                            child: ListView.separated(
                                separatorBuilder: (context, index) {
                                  return SizedBox(
                                    width: width * 0.02,
                                  );
                                },
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemCount: 6,
                                itemBuilder: (context, index) {
                                  return Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: width * 0.02),
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.roofing,
                                          color: Colors.red,
                                          size: width * 0.02,
                                        ),
                                        SizedBox(
                                          width: width * 0.01,
                                        ),
                                        Text("Floor $index"),
                                      ],
                                    ),
                                  );
                                }),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
