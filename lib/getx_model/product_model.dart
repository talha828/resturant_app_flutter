import 'package:get/get.dart';
import 'package:restaurant_app_flutter/provider_model/categories_model.dart';

class Product extends GetxController{
  //var product=List<CategoryModel>().obs;
  RxBool isCategory=false.obs;
  RxBool isTill=false.obs;
  RxString orderType="".obs;
  RxInt index=0.obs;
  var category=List<CategoryModel>().obs;



  Map<String,dynamic>productMap={
    "results":[
      {
        "name":"Water",
        "item":[
          {"name":"water1","prices":"Rs 45"},
          {"name":"water2","prices":"Rs 4"},
          {"name":"water3","prices":"Rs 258"},
          {"name":"water4","prices":"Rs 55"},
          {"name":"water5","prices":"Rs 523"},
          {"name":"water6","prices":"Rs 41"},
        ]
      },
      {
        "name":"Desert",
        "item":[
          {"name":"Desert1","prices":"Rs 225"},
          {"name":"Desert2","prices":"Rs 21"},
          {"name":"Desert3","prices":"Rs 5"},
          {"name":"Desert4","prices":"Rs 42"},
          {"name":"Desert5","prices":"Rs 10"},
          {"name":"Desert6","prices":"Rs 46"},
        ]
      },
      {
        "name":"Ethnic",
        "item":[
          {"name":"Ethnic1","prices":"Rs 225"},
          {"name":"Ethnic2","prices":"Rs 21"},
          {"name":"Ethnic3","prices":"Rs 5"},
          {"name":"Ethnic4","prices":"Rs 42"},
          {"name":"Ethnic5","prices":"Rs 10"},
          {"name":"Ethnic6","prices":"Rs 46"},
        ]
      },
      {
        "name":"Fast Food",
        "item":[
          {"name":"Fast Food1","prices":"Rs 225"},
          {"name":"Fast Food2","prices":"Rs 21"},
          {"name":"Fast Food3","prices":"Rs 5"},
          {"name":"Fast Food4","prices":"Rs 42"},
          {"name":"Fast Food5","prices":"Rs 10"},
          {"name":"Fast Food6","prices":"Rs 46"},
        ]
      },
      {
        "name":"Fast casual",
        "item":[
          {"name":"Fast casual1","prices":"Rs 225"},
          {"name":"Fast casual2","prices":"Rs 21"},
          {"name":"Fast casual3","prices":"Rs 5"},
          {"name":"Fast casual4","prices":"Rs 42"},
          {"name":"Fast casual5","prices":"Rs 10"},
          {"name":"Fast casual6","prices":"Rs 46"},
        ]
      },
      {
        "name":"Casual Dining",
        "item":[
          {"name":"Casual Dining1","prices":"Rs 225"},
          {"name":"Casual Dining2","prices":"Rs 21"},
          {"name":"Casual Dining3","prices":"Rs 5"},
          {"name":"Casual Dining4","prices":"Rs 42"},
          {"name":"Casual Dining5","prices":"Rs 10"},
          {"name":"Casual Dining6","prices":"Rs 46"},
        ]
      },
      {
        "name":"Premium casual",
        "item":[
          {"name":"Premium casual1","prices":"Rs 225"},
          {"name":"Premium casual2","prices":"Rs 21"},
          {"name":"Premium casual3","prices":"Rs 5"},
          {"name":"Premium casual4","prices":"Rs 42"},
          {"name":"Premium casual5","prices":"Rs 10"},
          {"name":"Premium casual6","prices":"Rs 46"},
        ]
      },
      {
        "name":"Family Style",
        "item":[
          {"name":"Family Style1","prices":"Rs 225"},
          {"name":"Family Style2","prices":"Rs 21"},
          {"name":"Family Style3","prices":"Rs 5"},
          {"name":"Family Style4","prices":"Rs 42"},
          {"name":"Family Style5","prices":"Rs 10"},
          {"name":"Family Style6","prices":"Rs 46"},
        ]
      },
      {
        "name":"Fine Dining",
        "item":[
          {"name":"Fine Dining1","prices":"Rs 225"},
          {"name":"Fine Dining2","prices":"Rs 21"},
          {"name":"Fine Dining3","prices":"Rs 5"},
          {"name":"Fine Dining4","prices":"Rs 42"},
          {"name":"Fine Dining5","prices":"Rs 10"},
          {"name":"Fine Dining6","prices":"Rs 46"},
        ]
      },
      {
        "name":"Wild Salman Burger",
        "item":[
          {"name":"Wild Salman Burger1","prices":"Rs 225"},
          {"name":"Wild Salman Burger2","prices":"Rs 21"},
          {"name":"Wild Salman Burger3","prices":"Rs 5"},
          {"name":"Wild Salman Burger4","prices":"Rs 42"},
          {"name":"Wild Salman Burger5","prices":"Rs 10"},
          {"name":"Wild Salman Burger6","prices":"Rs 46"},
        ]
      },
    ]
  };


  @override
  void onInit() {
    super.onInit();
    for (var i in productMap['results']){
      category.add(CategoryModel.fromJson(i));
    }
    print(category.length);
  }
}