import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:restaurant_app_flutter/common_widget/welcome_button.dart';
import 'package:restaurant_app_flutter/globle_variable.dart';
import 'package:restaurant_app_flutter/model/category_model.dart';
import 'package:restaurant_app_flutter/model/items_model.dart';
import 'package:restaurant_app_flutter/screens/floor_screen/floor_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<Category> category = [];
  List<Items> item = [];

  bool isCategory = true;
  bool isTill = false;
  List<String> name = [
    "Water",
    "Desert",
    "Ethnic.",
    "Fast food",
    "Fast casual",
    "Casual dining",
    "Premium casual",
    "Family style",
    "Fine dining",
  "Wild Salmon Burgers"
  ];
  List<String>burger=[
    "Back",
    "Beef Burgers.",
    "Elk Burgers",
    "Portobello Burgers.",
    "Turkey Burgers.",
    "Veggie Burgers.",
  ];

  @override
  void initState() {
    for (int i = 0; i < 10; i++) {
      category.add(Category(
        icon: FontAwesomeIcons.egg,
        name: name[i],
      ));
    }
    for (int i = 0; i < 5; i++) {
      item.add(Items(
        icon: FontAwesomeIcons.burger,
        name: burger[i],
      ));
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white.withOpacity(0.9),
        body: Container(
          padding: EdgeInsets.symmetric(
              vertical: width * 0.01, horizontal: width * 0.02),
          child: Row(
            children: [
              Container(
                margin: EdgeInsets.only(right: width * 0.02),
                child: Column(
                  children: [
                    Container(
                      width: width * 0.245,
                      height: width * 0.08,
                      color: Colors.white.withOpacity(0.7),
                      child: Column(),
                    ),
                    Container(
                      width: width * 0.245,
                      height: width * 0.25,
                      color: Colors.white,
                      child: Column(),
                    ),
                    Container(
                      width: width * 0.245,
                      height: width * 0.08,
                      color: Colors.white.withOpacity(0.7),
                      child: Column(),
                    )
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Column(
                      children: [
                        GridView.count(
                          crossAxisCount: 5,
                          shrinkWrap: true,
                          childAspectRatio: 1.5,
                          children:List.generate(5, (index) {
                            return InkWell(
                              onTap: () {
                                setState(() {
                                  isCategory = false;
                                });
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
                                      category[index].icon,
                                      color: Colors.white,
                                      size: width * 0.025,
                                    ),
                                    FittedBox(
                                      child: Text(
                                        category[index].name,
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
                        SizedBox(
                          height: width * 0.01,
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(width * 0.005),
                          child: Container(
                            color: Colors.white,
                            height: width * 0.05,
                            //width: width * 0.13,
                            child: TextField(
                              enabled: false,
                              scrollPadding: EdgeInsets.symmetric(vertical: 0),
                              textAlignVertical: TextAlignVertical.top,
                              decoration: InputDecoration(
                                  contentPadding: EdgeInsets.symmetric(
                                      horizontal: width * 0.03, vertical: 0),
                                  enabledBorder: InputBorder.none,
                                  hintText: "Search Products",
                                  hintStyle: TextStyle(fontSize: width * 0.018),
                                  suffixIcon: Icon(
                                    Icons.search,
                                    size: width * 0.03,
                                  )),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: width * 0.01,
                        ),
                        GridView.count(
                          crossAxisCount: 5,
                          shrinkWrap: true,
                          childAspectRatio: 1.5,
                          children: isCategory
                              ? List.generate(category.length, (index) {
                                  return InkWell(
                                    onTap: () {
                                      setState(() {
                                        isCategory = false;
                                      });
                                    },
                                    child: Container(
                                      margin: EdgeInsets.symmetric(
                                          vertical: width * 0.01,
                                          horizontal: width * 0.01),
                                      width: width * 0.13,
                                      padding: EdgeInsets.symmetric(
                                          horizontal: width * 0.0131),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          FaIcon(
                                            category[index].icon,
                                            color: Colors.red,
                                            size: width * 0.025,
                                          ),
                                          FittedBox(
                                            child: Text(
                                              category[index].name,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w100,
                                                  color: Colors.black,
                                                  fontSize: width * 0.018),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                })
                              : List.generate(item.length, (index) {
                                  return InkWell(
                                    onTap: () {
                                      setState(() {
                                        if(index == 0){
                                         isCategory = true;
                                        }else if(isTill){
                                        orderType(context);
                                        }else{
                                          setState(() {isTill=true;});
                                          openTill(context);
                                        }
                                      });
                                    },
                                    child: Container(
                                      margin: EdgeInsets.symmetric(
                                          vertical: width * 0.01,
                                          horizontal: width * 0.01),
                                      width: width * 0.13,
                                      padding: EdgeInsets.symmetric(
                                          horizontal: width * 0.0131),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(width * 0.01),
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Text(
                                            item[index].name,
                                            style: TextStyle(
                                                fontWeight: FontWeight.w100,
                                                color: Colors.black,
                                                fontSize: width * 0.018),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                }),
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
                                itemCount: 4,
                                itemBuilder: (context, index) {
                                  return Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: width * 0.02),
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.extension,
                                          color: Colors.red,
                                          size: width * 0.02,
                                        ),
                                        SizedBox(
                                          width: width * 0.01,
                                        ),
                                        Text("Fooz Zone"),
                                      ],
                                    ),
                                  );
                                }),
                          ),
                        ),
                        SizedBox(
                          height: width * 0.018,
                        ),
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
  void openTill(BuildContext context) {
    showGeneralDialog(
      context: context,
      barrierLabel: "Barrier",
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: Duration(milliseconds: 700),
      pageBuilder: (_, __, ___) {
        return Center(
          child: Container(
            height: width *0.18,
            width: width * 0.35 ,
            child: Scaffold(
              backgroundColor: Colors.transparent,
              body: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(height: width * 00.02,),
                      Text("till is not open",textAlign: TextAlign.center,),
                      Text("would you like to open till?",textAlign: TextAlign.center,),
                      Divider(),
                      InkWell(
                          onTap: ()=>Navigator.pop(context),
                          child: Text("No",style: TextStyle(color: Colors.red),textAlign: TextAlign.center,)),
                      Divider(),
                      InkWell(
                        onTap: ()=>enterTill(context),
                          child: Text("Open till",style: TextStyle(color: Colors.red),textAlign: TextAlign.center,)),

                    ],),
                ),
              ),
            ),
            margin: EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(30)),
          ),
        );
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
  void orderType(BuildContext context) {
    showGeneralDialog(
      context: context,
      barrierLabel: "Barrier",
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: Duration(milliseconds: 700),
      pageBuilder: (_, __, ___) {
        return Center(
          child: Container(
            height: width *0.18,
            width: width * 0.35 ,
            child: Scaffold(
              backgroundColor: Colors.transparent,
              body: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(height: width * 00.02,),
                      Text("Order Type",textAlign: TextAlign.center,),
                      Divider(),
                      InkWell(
                          onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>FloorScreen())),
                          child: Text("Dine In",style: TextStyle(color: Colors.red),textAlign: TextAlign.center,)),
                      Divider(),
                      InkWell(
                          onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>FloorScreen())),
                          child: Text("Pick Up",style: TextStyle(color: Colors.red),textAlign: TextAlign.center,)),

                    ],),
                ),
              ),
            ),
            margin: EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(30)),
          ),
        );
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
  void enterTill(BuildContext context) {
    TextEditingController controller=TextEditingController(text: "00.0");
    showGeneralDialog(
      context: context,
      barrierLabel: "Barrier",
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: Duration(milliseconds: 700),
      pageBuilder: (_, __, ___) {

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
                        Text("Enter Till Amount",textAlign: TextAlign.center,),
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

                              //TODO Use Provider here for update value
                                  if(controller.text=="00.0"){
                                    controller=TextEditingController(text: index.toString());
                                    setState(() {});
                                  }
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
                          onTap: ()=>Navigator.of(context)..pop()..pop(),
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
// class DialogUtils {
//   static DialogUtils _instance = new DialogUtils.internal();
//
//   DialogUtils.internal();
//
//   factory DialogUtils() => _instance;
//
//   static void showCustomDialog(BuildContext context,
//       {@required String title,
//         String okBtnText = "Ok",
//         String cancelBtnText = "Cancel",
//         @required Function okBtnFunction}) {
//     showDialog(
//         context: context,
//         builder: (_) {
//           return AlertDialog(
//             title: Text(title),
//             content: Container(),
//             actions: <Widget>[
//               FlatButton(
//                 child: Text(okBtnText),
//                 onPressed: okBtnFunction,
//               ),
//               FlatButton(
//                   child: Text(cancelBtnText),
//                   onPressed: () => Navigator.pop(context))
//             ],
//           );
//         });
//   }
// }