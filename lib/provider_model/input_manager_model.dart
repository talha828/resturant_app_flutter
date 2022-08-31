import 'package:flutter/cupertino.dart';

class InputManagerModel extends ChangeNotifier{
  String till="00.0";
  String guest="00.0";
  void addTill(String value){
    if(till=="00.0"){
      till=value;
    }else if(value=="C"){
      till="00.0";
    }
    else{
      till=till+value;
    }
    notifyListeners();
  }
  void addGuest(String value){
    if(guest=="00.0"){
      guest=value;
    }else if(value=="C"){
      guest="00.0";
    }
    else{
      guest=guest+value;
    }
    notifyListeners();
  }
}