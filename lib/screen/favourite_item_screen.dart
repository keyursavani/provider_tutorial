import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled1/provider/favourite_item_provider.dart';
import 'package:untitled1/screen/my_favourite_item_screen.dart';

class FavouriteItemScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return FavouriteItemScreenState();
  }
}
class FavouriteItemScreenState extends State<FavouriteItemScreen>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Favourite Item"),
        actions: [
          InkWell(
            onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context){
                  return MyFavouriteItemScreen();
                })
              );
            },
            child: Icon(Icons.favorite),
          ),
          SizedBox(width: 20,),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: 100,
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