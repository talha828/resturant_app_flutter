import 'package:get/get.dart';

class CustomerCourseModel extends GetxController {
  RxInt foodStatus=0.obs;
  RxBool isActive = false.obs;
  RxList<CourseDetails> course = <CourseDetails>[].obs;
  RxInt selectedCourse = (null as int).obs;
  RxString orderType = (null as String).obs;
  RxString tableNumber = (null as String).obs;
  RxDouble couresTotal=(null as double).obs;
  RxDouble total=(null as double).obs;
}

class CourseDetails {
  String name;
  List<Products> product = [];
  CourseDetails({this.name, this.product});
}

class Products {
  String quantity;
  String name;
  String prices;
  Products({this.name, this.prices, this.quantity});
}
