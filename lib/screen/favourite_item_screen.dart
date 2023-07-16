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
    var fav = context.watch<FavouriteItemProvider>().favList;
    print(fav);
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Selected Item ${fav.length}"),
      ),
      body:  Padding(
        padding: const EdgeInsets.only(top: 20,bottom: 20,left: 15,right:15),
        child: ListView.builder(
            itemCount: 40,
            itemBuilder: (context , index) {
              return ListTile(
                title: Text("Item ${index}"),
                trailing: InkWell(
                    onTap: (){
                      if(!fav.contains(index)){
                        context.read<FavouriteItemProvider>().addToList(index);
                        print(fav);
                      }
                      else{
                        context.read<FavouriteItemProvider>().removeToList(index);
                        print(fav);
                      }
                    },
                    child: Icon(Icons.favorite , color: fav.contains(index) ? Colors.red : Colors.blueGrey ,)),
              );
            }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(
              context,
              MaterialPageRoute(builder: (context){
                return  MyFavouriteItemScreen();
              })
          );
        },
      ),
    );
  }
}