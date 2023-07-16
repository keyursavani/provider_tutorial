import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class FavouriteItemProvider with ChangeNotifier{
  List _favList = [];

List get favList => _favList;

  void addToList(int index){
    _favList.add(index);
    notifyListeners();
  }

  void removeToList(int index){
    _favList.remove(index);
    notifyListeners();
  }
}