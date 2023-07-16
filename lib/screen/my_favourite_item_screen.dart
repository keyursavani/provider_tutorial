import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/favourite_item_provider.dart';

class MyFavouriteItemScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MyFavouriteItemScreenState();
  }
}

class MyFavouriteItemScreenState extends State<MyFavouriteItemScreen>{
  @override
  Widget build(BuildContext context) {
    var fav = context.watch<FavouriteItemProvider>().favList;
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Favourite Item"),
      ),
      body: ListView.builder(
          itemCount: fav.length,
          itemBuilder: (context , index){
            return ListTile(
              title: Text("Item ${fav[index]}"),
              trailing: TextButton(
                onPressed: (){
                  context.read<FavouriteItemProvider>().removeToList(fav[index]);
                },
                child: const Text("Remove" ,style: TextStyle(color: Colors.red),),),
            );
          }),
    );
  }
}