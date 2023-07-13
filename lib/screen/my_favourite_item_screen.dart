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
    var provider = Provider.of<FavouriteItemProvider>(context);
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Favourite Item"),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: provider.selectedItem.length,
                itemBuilder: (context,index){
                  return Consumer<FavouriteItemProvider>(
                      builder: (context , value ,child) {
                        return ListTile(
                          onTap: (){
                            if(value.selectedItem.contains(index)){
                              value.removeItem(index);
                            }
                            else{
                              value.addItem(index);
                            }
                            print(value.selectedItem);
                          },
                          title: Text("Item$index"),
                          trailing: Icon(value.selectedItem.contains(index) ? Icons.favorite : Icons.favorite_border_outlined),
                        );
                      });
                }),
          ),
        ],
      ),
    );
  }
}