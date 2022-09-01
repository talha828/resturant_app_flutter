import 'package:get/get.dart';

class FloorModel extends GetxController{
  RxInt selectedFloor=0.obs;
  RxInt selectedTable=50.obs;
  var floor=List<Floor>().obs;
  Map<String,dynamic> hotel={
    "results":[
      {
      "name":"My Floor",
       "table":[
         {
           "name":"Table 1",
           "status":"0",
         },
         {
           "name":"Table 2",
           "status":"1",
         },
         {
           "name":"Table 2",
           "status":"1",
         },
         {
           "name":"Table 1",
           "status":"1",
         },
         {
           "name":"Table 3",
           "status":"0",
         },
         {
           "name":"Table 2",
           "status":"1",
         },
         {
           "name":"Table 3",
           "status":"0",
         },
         {
           "name":"Table 4",
           "status":"2",
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
  @override
  void onInit() {
    super.onInit();
    for(var i in hotel["results"]){
      floor.add(Floor.fromJson(i));
    }
  }
}

class Floor{
  String name;
  List<Table>table=[];
  Floor.fromJson(Map<String,dynamic>json){
    name=json['name'];
   if(json["table"]!=null){
     for (var i in json['table']){
       table.add(Table.fromJson(i));
     }
   }
  }
}

class Table{
  String name;
  String status;
  Table.fromJson(Map<String,dynamic>json){
    name=json['name'];
    status=json['status'].toString();
  }
}