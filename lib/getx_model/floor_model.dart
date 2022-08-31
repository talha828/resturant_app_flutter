import 'package:get/get.dart';

class FloorModel extends GetxController{
  var floor=List<Floor>().obs;
  Map<String,dynamic> hotel={
    "result":[
      {
      "name":"My Floor",
       "table":[
         {
           "name":"Table 1",
           "status":"0",
         },
         {
           "name":"Table 2",
           "status":"0",
         },
         {
           "name":"Table 3",
           "status":"0",
         },
         {
           "name":"Table 4",
           "status":"0",
         },
       ]
    },
      {
      "name":"Your Floor",
       "table":[
         {
           "name":"Table 1",
           "status":"0",
         },
         {
           "name":"Table 2",
           "status":"0",
         },
         {
           "name":"Table 3",
           "status":"0",
         },
         {
           "name":"Table 4",
           "status":"0",
         },
       ]
    },
      {
        "name":"Our Floor",
        "table":[
          {
            "name":"Table 1",
            "status":"0",
          },
          {
            "name":"Table 2",
            "status":"0",
          },
          {
            "name":"Table 3",
            "status":"0",
          },
          {
            "name":"Table 4",
            "status":"0",
          },
        ]
      },
      {
        "name":"Floor Floor",
        "table":[
          {
            "name":"Table 1",
            "status":"0",
          },
          {
            "name":"Table 2",
            "status":"0",
          },
          {
            "name":"Table 3",
            "status":"0",
          },
          {
            "name":"Table 4",
            "status":"0",
          },
        ]
      },
      {
        "name":"My Floor",
        "table":[
          {
            "name":"Table 1",
            "status":"0",
          },
          {
            "name":"Table 2",
            "status":"0",
          },
          {
            "name":"Table 3",
            "status":"0",
          },
          {
            "name":"Table 4",
            "status":"0",
          },
        ]
      },
      {
        "name":"My Floor",
        "table":[
          {
            "name":"Table 1",
            "status":"0",
          },
          {
            "name":"Table 2",
            "status":"0",
          },
          {
            "name":"Table 3",
            "status":"0",
          },
          {
            "name":"Table 4",
            "status":"0",
          },
        ]
      },
    ],
  };
  //TODO:// inshallah
}

class Floor{
  String name;
  List<Table>table=[];
  Floor.fromJson(Map<String,dynamic>json){
    name=json['name'];
    for (var i in json['table']){
      table.add(Table.fromJson(i));
    }
  }
}

class Table{
  String name;
  int status;
  Table.fromJson(Map<String,dynamic>json){
    name=json['name'];
    status=json['status'];
  }
}