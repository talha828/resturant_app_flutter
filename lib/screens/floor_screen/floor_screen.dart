import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app_flutter/globle_variable.dart';
import 'package:restaurant_app_flutter/provider_model/input_manager_model.dart';

class FloorScreen extends StatefulWidget {


  @override
  State<FloorScreen> createState() => _FloorScreenState();
}

class _FloorScreenState extends State<FloorScreen> {


int selectFloor=0;
int selectTable;

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
                      onTap:()=>Navigator.of(context)..pop()..pop(),
                      child: Text("Back",style: TextStyle(color: Colors.red,),)),
                  Expanded(child: Container(child: Center(child: Text("Table",style: TextStyle(color: Colors.red,fontSize: width * 0.026),)))),
                  Text("Reservation Edit",style: TextStyle(color: Colors.red,),),
                ],
              ),
            ),
            // TODO Tables
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
                                    setState(() {
                                      selectTable=index;
                                    });
                                    enterNumberOfGuest(context);
                                    //Future.delayed(Duration(seconds: 1),()=>Navigator.of(context)..pop()..pop());
                                  },
                                  child: Container(
                                    margin: EdgeInsets.symmetric(
                                        vertical: width * 0.01,
                                        horizontal: width * 0.01),
                                    width: width * 0.13,
                                    padding: EdgeInsets.symmetric(
                                        horizontal: width * 0.0131),
                                    decoration: BoxDecoration(
                                      color:selectTable==index?Colors.white: Colors.red,
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                      children: [
                                        FaIcon(
                                          FontAwesomeIcons.table,
                                          color:selectTable==index? Colors.red:Colors.white,
                                          size: width * 0.025,
                                        ),
                                        FittedBox(
                                          child: Text(
                                            "Table $index",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w100,
                                                color: selectTable==index?Colors.red:Colors.white,
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
                    //TODO Floor
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
                                  return InkWell(
                                    onTap: (){
                                      setState(() {
                                        selectFloor=index;
                                      });
                                    },
                                    child: Container(
                                      color: selectFloor==index?Colors.grey:Colors.white,
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
void enterNumberOfGuest(BuildContext context) {

  showGeneralDialog(
    context: context,
    barrierLabel: "Barrier",
    barrierDismissible: true,
    barrierColor: Colors.black.withOpacity(0.5),
    transitionDuration: Duration(milliseconds: 700),
    pageBuilder: (_, __, ___) {
      return EnterNumberOfGuest();
    },
    transitionBuilder: (_, anim, __, child) {
      Tween<Offset> tween;
      if (anim.status == AnimationStatus.reverse) {
        tween = Tween(begin: Offset(-1, 0), end: Offset.zero);
      } else {
        tween = Tween(begin: Offset(1, 0), end: Offset.zero);
      }

      return SlideTransition(
        position: tween.animate(anim),
        child: FadeTransition(
          opacity: anim,
          child: child,
        ),
      );
    },
  );
}
}

class EnterNumberOfGuest extends StatefulWidget {
  const EnterNumberOfGuest({Key key}) : super(key: key);

  @override
  State<EnterNumberOfGuest> createState() => _EnterNumberOfGuestState();
}

class _EnterNumberOfGuestState extends State<EnterNumberOfGuest> {



  @override
  Widget build(BuildContext context) {
    var guest =Provider.of<InputManagerModel>(context);
    TextEditingController controller=TextEditingController(text: guest.guest);
    return Center(
      child: SingleChildScrollView(
        child: Container(
          height: width *0.45,
          width: width * 0.35 ,
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: ClipRRect(
              borderRadius: BorderRadius.circular(width * 0.02),
              child: Container(
                color: Color(0xffdddfe9),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(height: width * 0.02,),
                    Text("Enter Number of Guest",textAlign: TextAlign.center,),
                    SizedBox(height: width * 0.02,),
                    Container(
                        color: Colors.white,
                        child: TextField(
                          textAlign: TextAlign.center,
                          controller: controller,
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(horizontal: width * 0.02),
                              enabledBorder: InputBorder.none,
                              border:InputBorder.none,
                              focusedBorder: InputBorder.none
                          ),
                        )),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 0),
                      margin: EdgeInsets.symmetric(horizontal: width *0.02),
                      child: GridView.count(crossAxisCount: 3,
                        shrinkWrap: true,
                        childAspectRatio: 1.97,
                        children: List.generate(12, (index)=>InkWell(
                          onTap: (){
                            Provider.of<InputManagerModel>(context,listen: false).addGuest(index>8?index==9?"C":(index-1).toString():index.toString());
                          },
                          child: Container(
                            child: Container(
                              margin: EdgeInsets.symmetric(vertical: width * 0.008,horizontal: width *0.008),
                              color: Colors.white,
                              padding: EdgeInsets.symmetric(vertical: width * 0.002,horizontal: width *0.002),
                              child: Center(child: Text(index>8?index==9?"C":(index-1).toString():index.toString())),
                            ),
                          ),
                        )),
                      ),
                    ),
                    SizedBox(height: width *0.01,),
                    InkWell(
                      onTap: ()=>Navigator.of(context)..pop()..pop()..pop(),
                      child: Container(
                        height: width * 0.05,
                        color: Colors.white,
                        margin: EdgeInsets.symmetric(horizontal: width *0.03),
                        child: Center(child: Text("Done",textAlign: TextAlign.center,)),
                      ),
                    ),
                    //SizedBox(height: width *0.01,)
                  ],),
              ),
            ),
          ),
          margin: EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(width * 0.02)),
        ),
      ),
    );
  }
}