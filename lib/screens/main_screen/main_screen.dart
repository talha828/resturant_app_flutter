import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app_flutter/getx_model/course_model.dart';
import 'package:restaurant_app_flutter/getx_model/product_model.dart';
import 'package:restaurant_app_flutter/globle_variable.dart';
import 'package:restaurant_app_flutter/provider_model/bottom_button_model.dart';
import 'package:restaurant_app_flutter/provider_model/input_manager_model.dart';
import 'package:restaurant_app_flutter/screens/floor_screen/floor_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<String> topList = ["Printer", "Kitchen", "Void", "Discount", "Tags", "Home"];
  List<IconData> top = [Icons.print, Icons.kitchen, Icons.cancel_outlined, Icons.disc_full_outlined, Icons.more, Icons.more_horiz_outlined,];
  List bottomLable = ["Home", "Order", "Table", "New",];
  final product = Get.put(Product());
  List<IconData> icon = [Icons.home, Icons.message, Icons.table_chart_outlined, Icons.add,];
  List<BottomButtonModel> biottomModelList = [];
  List<TopButtonModel> topModelList = [];
  final customerCourseController = Get.put(CustomerCourseModel());

  @override
  void initState() {
    for (int i = 0; i < 4; i++) {biottomModelList.add(BottomButtonModel(icon: icon[i], label: bottomLable[i]));}
    for (int i = 0; i < top.length; i++) {topModelList.add(TopButtonModel(icon: top[i], label: topList[i]));}
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
              GetX<CustomerCourseModel>(
                init: CustomerCourseModel(),
                builder: (logic) {
                  return Container(
                    margin: EdgeInsets.only(right: width * 0.02),
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: width * 0.01, vertical: width * 0.01),
                          width: width * 0.245,
                          height: width * 0.08,
                          color: Colors.white.withOpacity(0.7),
                          child: logic.isActive.value
                              ? Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("1", style: TextStyle(color: Colors.red),),
                                        Text("Active",),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "${logic.orderType} (${logic.tableNumber})",
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
                                )
                              : Container(),
                        ),
                        Container(
                          width: width * 0.245,
                          height: width * 0.25,
                          color: Colors.white,
                          child: SingleChildScrollView(
                            child: logic.isActive.value
                                ? Column(
                                    children: [
                                      ListView.builder(
                                          physics:
                                              NeverScrollableScrollPhysics(),
                                          shrinkWrap: true,
                                          itemCount: logic.course.length,
                                          itemBuilder: (context, index) {
                                            return Column(
                                              children: [
                                                Container(
                                                  padding: EdgeInsets.symmetric(
                                                      vertical: width * 0.01,
                                                      horizontal: width * 0.01),
                                                  color: Colors.grey.shade200,
                                                  child: Row(
                                                    children: [
                                                      Text(logic
                                                          .course[index].name),
                                                    ],
                                                  ),
                                                ),
                                                Row(
                                                  children: [
                                                    Expanded(
                                                      child: ListView.separated(
                                                          separatorBuilder:
                                                              (context, index) {
                                                            return Divider();
                                                          },
                                                          physics:
                                                              NeverScrollableScrollPhysics(),
                                                          shrinkWrap: true,
                                                          itemCount: logic
                                                              .course[index]
                                                              .product
                                                              .length,
                                                          itemBuilder: (context,
                                                              indexs) {
                                                            return Row(
                                                              children: [
                                                                Container(
                                                                  color:logic.foodStatus.value==1?Colors.amberAccent:logic.foodStatus.value==2?Colors.green: Colors.red,
                                                                  child:
                                                                      SizedBox(
                                                                    width: width *
                                                                        0.005,
                                                                    height:
                                                                        width *
                                                                            0.03,
                                                                  ),
                                                                ),
                                                                SizedBox(
                                                                  width: width *
                                                                      0.01,
                                                                ),
                                                                Text(
                                                                  logic
                                                                      .course[
                                                                          index]
                                                                      .product[
                                                                          indexs]
                                                                      .quantity,
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          width *
                                                                              0.017),
                                                                ),
                                                                SizedBox(
                                                                  width: width *
                                                                      0.01,
                                                                ),
                                                                Text(
                                                                  "X",
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          width *
                                                                              0.017),
                                                                ),
                                                                SizedBox(
                                                                  width: width *
                                                                      0.01,
                                                                ),
                                                                Container(
                                                                    width:
                                                                        width *
                                                                            0.09,
                                                                    child: Row(
                                                                      children: [
                                                                        Expanded(
                                                                            child:
                                                                                Text(
                                                                          logic
                                                                              .course[index]
                                                                              .product[indexs]
                                                                              .name,
                                                                          style:
                                                                              TextStyle(fontSize: width * 0.017),
                                                                        )),
                                                                      ],
                                                                    )),
                                                                SizedBox(
                                                                  width: width *
                                                                      0.009,
                                                                ),
                                                                Text(
                                                                  "Rs. ${logic
                                                                      .course[
                                                                  index]
                                                                      .product[
                                                                  indexs]
                                                                      .prices}",
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          width *
                                                                              0.017),
                                                                ),
                                                              ],
                                                            );
                                                          }),
                                                    )
                                                  ],
                                                ),
                                              ],
                                            );
                                          }),
                                      InkWell(
                                        onTap: () {
                                          customerCourseController
                                              .selectedCourse
                                              .value = customerCourseController
                                                  .selectedCourse.value +
                                              1;
                                          customerCourseController.course.add(
                                              CourseDetails(
                                                  name:
                                                      "Course 0${customerCourseController.selectedCourse.value}",
                                                  product: []));
                                        },
                                        child: Container(
                                          padding: EdgeInsets.symmetric(
                                              vertical: width * 0.01,
                                              horizontal: width * 0.01),
                                          color: Colors.grey.shade200,
                                          child: Row(
                                            children: [
                                              Text("Add Course"),
                                            ],
                                          ),
                                        ),
                                      )
                                    ],
                                  )
                                : Container(),
                          ),
                        ),
                        Container(
                          width: width * 0.245,
                          height: width * 0.08,
                          color: Colors.white.withOpacity(0.7),
                          child: logic.isActive.value
                              ? Column(
                                  children: [
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: width * 0.01,
                                          vertical: width * 0.01),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Total",
                                            style: TextStyle(
                                                fontSize: width * 0.017),
                                          ),
                                          Text(
                                            "Rs ${customerCourseController.couresTotal}",
                                            style: TextStyle(
                                                fontSize: width * 0.017),
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
                                              "Rs ${customerCourseController.total}",
                                              style: TextStyle(
                                                  fontSize: width * 0.02,
                                                  color: Colors.white),
                                            ),
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                )
                              : Container(),
                        )
                      ],
                    ),
                  );
                },
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
                            children:
                                List.generate(topModelList.length, (index) {
                              return InkWell(
                                onTap: () {

                                  setState(() {
                                    customerCourseController.foodStatus.value=index+1;
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
                                        topModelList[index].icon,
                                        color: Colors.white,
                                        size: width * 0.025,
                                      ),
                                      Text(
                                        topModelList[index].label,
                                        style: TextStyle(
                                            fontWeight: FontWeight.w100,
                                            color: Colors.white,
                                            fontSize: width * 0.017),
                                      )
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
                        GetX<Product>(
                          init: Product(),
                          builder: (controller) {
                            return GridView.count(
                              crossAxisCount: 5,
                              shrinkWrap: true,
                              childAspectRatio: 1.5,
                              children: controller.isCategory.value == false
                                  ? List.generate(controller.category.length,
                                      (index) {
                                      return InkWell(
                                        onTap: () {
                                          controller.isCategory.value = true;
                                          controller.Categoryindex.value =
                                              index;
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
                                                BorderRadius.circular(5),
                                          ),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              FaIcon(
                                                Icons
                                                    .align_horizontal_center_rounded,
                                                color: Colors.red,
                                                size: width * 0.025,
                                              ),
                                              FittedBox(
                                                child: Text(
                                                  controller
                                                      .category[index].name,
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w100,
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
                                  : List.generate(
                                      controller
                                              .category[controller
                                                  .Categoryindex.value]
                                              .item
                                              .length +
                                          1, (index) {
                                      return InkWell(
                                        onTap: () {
                                          if (index == 0) {
                                            controller.isCategory.value = false;
                                          } else if (controller.isTill.value &&
                                              customerCourseController
                                                      .isActive.value !=
                                                  true) {
                                            customerCourseController
                                                .selectedCourse.value = 0;
                                            List<Products> list = [];
                                              list.add(Products(
                                                  name: controller
                                                      .category[controller
                                                          .Categoryindex.value]
                                                      .item[index - 1]
                                                      .name,
                                                  prices: controller
                                                      .category[controller
                                                          .Categoryindex.value]
                                                      .item[index - 1]
                                                      .prices,
                                                  quantity: "1"));
                                              customerCourseController.course
                                                  .add(CourseDetails(
                                                      name: "Course 01",
                                                      product: list));
                                               customerCourseController.couresTotal.value=double.parse(controller
                                                   .category[controller
                                                   .Categoryindex.value]
                                                   .item[index - 1]
                                                   .prices);
                                            customerCourseController.total.value=double.parse(controller
                                                .category[controller
                                                .Categoryindex.value]
                                                .item[index - 1]
                                                .prices);
                                            orderType(context);
                                          } else if (controller.isTill.value ==
                                              false) {
                                            openTill(context);
                                          } else {
                                            List<Products> list = [];
                                            if (customerCourseController
                                                    .course.length >=
                                                1) {
                                              list = customerCourseController
                                                  .course[
                                                      customerCourseController
                                                          .selectedCourse.value]
                                                  .product;
                                              list.add(Products(
                                                  name: controller
                                                      .category[controller
                                                          .Categoryindex.value]
                                                      .item[index - 1]
                                                      .name,
                                                  prices: controller
                                                      .category[controller
                                                          .Categoryindex.value]
                                                      .item[index - 1]
                                                      .prices,
                                                  quantity: "1"));
                                              double total=0,subTotal=0;
                                              for(var i in list){
                                                   subTotal= subTotal+double.parse(i.prices);
                                              }
                                              for(var j in customerCourseController.course){
                                                for(var b in j.product){
                                                  total=total+double.parse(b.prices);
                                                }
                                              }
                                              customerCourseController.couresTotal.value=subTotal;
                                              customerCourseController.total.value=total;
                                              customerCourseController.course
                                                  .removeAt(
                                                      customerCourseController
                                                          .selectedCourse
                                                          .value);
                                              customerCourseController.course
                                                  .add(CourseDetails(
                                                      name:
                                                          "Course 0${customerCourseController.selectedCourse.value}",
                                                      product: list));
                                            } else {
                                              list.add(Products(
                                                  name: controller
                                                      .category[controller
                                                          .Categoryindex.value]
                                                      .item[index - 1]
                                                      .name,
                                                  prices: controller
                                                      .category[controller
                                                          .Categoryindex.value]
                                                      .item[index - 1]
                                                      .prices,
                                                  quantity: "1"));
                                              customerCourseController.course
                                                  .add(CourseDetails(
                                                      name: "Course 01",
                                                      product: list));
                                            }
                                          }
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
                                            borderRadius: BorderRadius.circular(
                                                width * 0.01),
                                          ),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Text(
                                                index == 0
                                                    ? "back"
                                                    : controller
                                                        .category[controller
                                                            .Categoryindex
                                                            .value]
                                                        .item[index - 1]
                                                        .name,
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
                            );
                          },
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
                                itemCount: biottomModelList.length,
                                itemBuilder: (context, index) {
                                  return InkWell(
                                    onTap: () {},
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: width * 0.02),
                                      child: Row(
                                        children: [
                                          FaIcon(
                                            biottomModelList[index].icon,
                                            color: Colors.red,
                                            size: width * 0.025,
                                          ),
                                          SizedBox(
                                            width: width * 0.01,
                                          ),
                                          Text(biottomModelList[index].label),
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
                          onTap: () {
                            product.isTill.value = true;
                            Navigator.pop(context);
                          },
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
                          onTap: () {
                            customerCourseController.isActive.value = true;
                            customerCourseController.orderType.value =
                                "Dine In";
                            product.orderType.value = "Dine In";
                            Get.to(FloorScreen());
                          },
                          child: Text(
                            "Dine In",
                            style: TextStyle(color: Colors.red),
                            textAlign: TextAlign.center,
                          )),
                      Divider(),
                      InkWell(
                          onTap: () {
                            customerCourseController.isActive.value = true;
                            customerCourseController.orderType.value =
                                "Pick Up";
                            product.orderType.value = "Pick Up";
                            Get.to(FloorScreen());
                          },
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
  @override
  State<EnterTill> createState() => _EnterTillState();
}

class _EnterTillState extends State<EnterTill> {
  @override
  var product = Get.find<Product>();

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
                      onTap: () {
                        product.isTill.value = true;
                        Navigator.of(context)..pop()..pop();
                      },
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
