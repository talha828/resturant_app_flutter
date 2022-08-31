import 'package:flutter/cupertino.dart';


class CategoryModel{
  String name;
  List<SubItemModel>item=[];
  CategoryModel.fromJson(Map<String,dynamic>json){
    name=json['name'];
    if(json['item']!=null){
      for(var i in json['item']){
        print(i);
        item.add(SubItemModel.fromJson(i));
      }
    }
  }
}


class SubItemModel  {
  String name;
  String prices;
  SubItemModel.fromJson(Map<String,dynamic>json){
    name=json['name'];
    prices=json['prices'];
  }
}