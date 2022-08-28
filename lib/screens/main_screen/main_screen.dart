import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app_flutter/common_widget/welcome_button.dart';
import 'package:restaurant_app_flutter/globle_variable.dart';
import 'package:restaurant_app_flutter/model/bottom_button_model.dart';
import 'package:restaurant_app_flutter/model/category_model.dart';
import 'package:restaurant_app_flutter/model/input_manager_model.dart';
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
  List<String> burger = [
    "Back",
    "Beef Burgers.",
    "Elk Burgers",
    "Portobello Burgers.",
    "Turkey Burgers.",
    "Veggie Burgers.",
  ];
  List<String> topList = [
    "Printer",
    "Kitchen",
    "Void",
    "Discount",
    "Tags",
    "Home"
  ];
  List<Icon> top = [
    Icon(
      Icons.print,
      color: Colors.white,
      size: width * 0.025,
    ),
    Icon(
      Icons.kitchen,
      color: Colors.white,
      size: width * 0.025,
    ),
    Icon(
      Icons.cancel_outlined,
      color: Colors.white,
      size: width * 0.025,
    ),
    Icon(
      Icons.disc_full_outlined,
      color: Colors.white,
      size: width * 0.025,
    ),
    Icon(
      Icons.more,
      color: Colors.white,
      size: width * 0.025,
    ),
    Icon(
      Icons.more_horiz_outlined,
      color: Colors.white,
      size: width * 0.025,
    ),
  ];
  List bottomLable = [
    "Home",
    "Order",
    "Table",
    "New",
  ];
  List<Icon> icon = [
    Icon(
      Icons.home,
      color: Colors.red,
      size: width * 0.02,
    ),
    Icon(
      Icons.message,
      color: Colors.red,
      size: width * 0.02,
    ),
    Icon(
      Icons.table_chart_outlined,
      color: Colors.red,
      size: width * 0.02,
    ),
    Icon(
      Icons.add,
      color: Colors.red,
      size: width * 0.02,
    ),
  ];
  List<BottomButtonModel> dd = [];
  List<BottomButtonModel> ddd = [];
  @override
  void initState() {
    for (int i = 0; i < 10; i++) {
      category.add(Category(
        icon: FontAwesomeIcons.egg,
        name: name[i],
      ));
    }
    for (int i = 0; i < 4; i++) {
      dd.add(BottomButtonModel(icon: icon[i], label: bottomLable[i]));
    }
    for (int i = 0; i < top.length; i++) {
      ddd.add(BottomButtonModel(icon: top[i], label: topList[i]));
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
                      padding: EdgeInsets.symmetric(
                          horizontal: width * 0.01, vertical: width * 0.01),
                      width: width * 0.245,
                      height: width * 0.08,
                      color: Colors.white.withOpacity(0.7),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "1",
                                style: TextStyle(color: Colors.red),
                              ),
                              Text(
                                "Active",
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Dien In (F1 T7)",
                                style: TextStyle(
                                    color: Colors.red,
                                    fontSize: width * 0.015,
                                    fontWeight: FontWeight.w600),
                              ),
                              Text(
                                "Add Customer",
                                style: TextStyle(
                                    fontSize: width * 0.015,
                                    color: Colors.red,
                                    fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: width * 0.245,
                      height: width * 0.25,
                      color: Colors.white,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Container(
                                color: Colors.red,
                                child: SizedBox(
                                  width: width * 0.005,
                                  height: width * 0.03,
                                ),
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    width: width * 0.01,
                                  ),
                                  Text(
                                    "1",
                                    style: TextStyle(fontSize: width * 0.017),
                                  ),
                                  SizedBox(
                                    width: width * 0.01,
                                  ),
                                  Text(
                                    "X",
                                    style: TextStyle(fontSize: width * 0.017),
                                  ),
                                  SizedBox(
                                    width: width * 0.01,
                                  ),
                                  Container(
                                      width: width * 0.09,
                                      child: Row(
                                        children: [
                                          Expanded(
                                              child: Text(
                                            "Beef Burger",
                                            style: TextStyle(
                                                fontSize: width * 0.017),
                                          )),
                                        ],
                                      )),
                                  SizedBox(
                                    width: width * 0.009,
                                  ),
                                  Text(
                                    "SAR 45.00",
                                    style: TextStyle(fontSize: width * 0.017),
                                  ),
                                ],
                              )
                            ],
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                                vertical: width * 0.01,
                                horizontal: width * 0.01),
                            color: Colors.grey.shade200,
                            child: Row(
                              children: [
                                Text("Add Coures"),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      width: width * 0.245,
                      height: width * 0.08,
                      color: Colors.white.withOpacity(0.7),
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: width * 0.01,
                                vertical: width * 0.01),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Total",
                                  style: TextStyle(fontSize: width * 0.017),
                                ),
                                Text(
                                  "SRA 5.78",
                                  style: TextStyle(fontSize: width * 0.017),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Container(
                              color: Colors.red,
                              padding: EdgeInsets.symmetric(
                                  horizontal: width * 0.01,
                                  vertical: width * 0.001),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Total",
                                    style: TextStyle(
                                        fontSize: width * 0.02,
                                        color: Colors.white),
                                  ),
                                  Text(
                                    "SRA 5.78",
                                    style: TextStyle(
                                        fontSize: width * 0.02,
                                        color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
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
                        //TODO top list of after order (kitchen,print,etc)
                        GridView.count(
                            crossAxisCount: 6,
                            shrinkWrap: true,
                            childAspectRatio: 1.5,
                            children: List.generate(ddd.length, (index) {
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
                                      ddd[index].icon,
                                      FittedBox(
                                        child: Text(
                                          ddd[index].label,
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
                            })),
                        SizedBox(
                          height: width * 0.01,
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(width * 0.005),
                          child: Container(
                            color: Colors.white,
                            height: width * 0.05,
                            //width: width * 0.13,
                            //TODO search bar disable do nothing
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
                        //TODO list of category
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
                              //TODO : second list of item depend on category
                              : List.generate(item.length, (index) {
                                  return InkWell(
                                    onTap: () {
                                      setState(() {
                                        if (index == 0) {
                                          isCategory = true;
                                        } else if (isTill) {
                                          setState(() {
                                            isTill = false;
                                          });
                                          orderType(context);
                                        } else {
                                          setState(() {
                                            isTill = true;
                                          });
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
                    //:TODO  list of bottom button
                    //: TODO add button functionality
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
                                itemCount: dd.length,
                                itemBuilder: (context, index) {
                                  return InkWell(
                                    onTap: () {},
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: width * 0.02),
                                      child: Row(
                                        children: [
                                          dd[index].icon,
                                          SizedBox(
                                            width: width * 0.01,
                                          ),
                                          Text(dd[index].label),
                                        ],
                                      ),
                                    ),
                                  );
                                }),
                          ),
                        ),
                        // SizedBox(
                        //   height: width * 0.018,
                        // ),
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

  //TODO alert about till? (true,false)
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
            height: width * 0.18,
            width: width * 0.35,
            child: Scaffold(
              backgroundColor: Colors.transparent,
              body: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(
                        height: width * 00.02,
                      ),
                      Text(
                        "till is not open",
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        "would you like to open till?",
                        textAlign: TextAlign.center,
                      ),
                      Divider(),
                      InkWell(
                          onTap: () => Navigator.pop(context),
                          child: Text(
                            "No",
                            style: TextStyle(color: Colors.red),
                            textAlign: TextAlign.center,
                          )),
                      Divider(),
                      InkWell(
                          onTap: () => enterTill(context),
                          child: Text(
                            "Open till",
                            style: TextStyle(color: Colors.red),
                            textAlign: TextAlign.center,
                          )),
                    ],
                  ),
                ),
              ),
            ),
            margin: EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(30)),
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

  //TODO order types (DineIn, recive)
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
            height: width * 0.18,
            width: width * 0.35,
            child: Scaffold(
              backgroundColor: Colors.transparent,
              body: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(
                        height: width * 00.02,
                      ),
                      Text(
                        "Order Type",
                        textAlign: TextAlign.center,
                      ),
                      Divider(),
                      InkWell(
                          onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => FloorScreen())),
                          child: Text(
                            "Dine In",
                            style: TextStyle(color: Colors.red),
                            textAlign: TextAlign.center,
                          )),
                      Divider(),
                      InkWell(
                          onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => FloorScreen())),
                          child: Text(
                            "Pick Up",
                            style: TextStyle(color: Colors.red),
                            textAlign: TextAlign.center,
                          )),
                    ],
                  ),
                ),
              ),
            ),
            margin: EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(30)),
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

  //TODO till Enter Till prices
  void enterTill(BuildContext context) {
    showGeneralDialog(
      context: context,
      barrierLabel: "Barrier",
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: Duration(milliseconds: 700),
      pageBuilder: (_, __, ___) {
        return EnterTill();
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

class EnterTill extends StatefulWidget {
  const EnterTill({Key key}) : super(key: key);

  @override
  State<EnterTill> createState() => _EnterTillState();
}

class _EnterTillState extends State<EnterTill> {
  @override
  Widget build(BuildContext context) {
    var till = Provider.of<InputManagerModel>(context);
    TextEditingController controller = TextEditingController(text: till.till);
    return Center(
      child: SingleChildScrollView(
        child: Container(
          height: width * 0.45,
          width: width * 0.35,
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
                    SizedBox(
                      height: width * 0.02,
                    ),
                    Text(
                      "Enter Till Amount",
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: width * 0.02,
                    ),
                    Container(
                        color: Colors.white,
                        child: TextField(
                          textAlign: TextAlign.center,
                          controller: controller,
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: width * 0.02),
                              enabledBorder: InputBorder.none,
                              border: InputBorder.none,
                              focusedBorder: InputBorder.none),
                        )),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 0),
                      margin: EdgeInsets.symmetric(horizontal: width * 0.02),
                      child: GridView.count(
                        crossAxisCount: 3,
                        shrinkWrap: true,
                        childAspectRatio: 1.97,
                        children: List.generate(
                            12,
                            (index) => InkWell(
                                  onTap: () {
                                    Provider.of<InputManagerModel>(context,
                                            listen: false)
                                        .addTill(index > 8
                                            ? index == 9
                                                ? "C"
                                                : (index - 1).toString()
                                            : index.toString());
                                  },
                                  child: Container(
                                    child: Container(
                                      margin: EdgeInsets.symmetric(
                                          vertical: width * 0.008,
                                          horizontal: width * 0.008),
                                      color: Colors.white,
                                      padding: EdgeInsets.symmetric(
                                          vertical: width * 0.002,
                                          horizontal: width * 0.002),
                                      child: Center(
                                          child: Text(index > 8
                                              ? index == 9
                                                  ? "C"
                                                  : (index - 1).toString()
                                              : index.toString())),
                                    ),
                                  ),
                                )),
                      ),
                    ),
                    SizedBox(
                      height: width * 0.01,
                    ),
                    InkWell(
                      onTap: () => Navigator.of(context)..pop()..pop(),
                      child: Container(
                        height: width * 0.05,
                        color: Colors.white,
                        margin: EdgeInsets.symmetric(horizontal: width * 0.03),
                        child: Center(
                            child: Text(
                          "Done",
                          textAlign: TextAlign.center,
                        )),
                      ),
                    ),
                    //SizedBox(height: width *0.01,)
                  ],
                ),
              ),
            ),
          ),
          margin: EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(width * 0.02)),
        ),
      ),
    );
  }
}
