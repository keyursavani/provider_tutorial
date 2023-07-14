import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ValueNotifyListenerScreen extends StatelessWidget{

  ValueNotifier<int> _count = ValueNotifier<int>(0);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("ValueNotifyListener Example"),
      ),
      body: Center(
        child: ValueListenableBuilder(
          valueListenable: _count,
          builder: (context , value , chile){
            return Text(_count.value.toString() , style: TextStyle(fontSize: 50),);
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          _count.value++;
          print(_count.value.toString());
        },
        child: Icon(Icons.add),
      ),
    );
  }
}