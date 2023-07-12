import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled1/provider/count_provider.dart';

class CounterExampleScreen extends StatefulWidget{
  const CounterExampleScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return CounterExampleScreenState();
  }
}
class CounterExampleScreenState extends State<CounterExampleScreen>{
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    var countProvider = Provider.of<CountProvider>(context,listen: false);
    Timer.periodic(Duration(seconds: 60), (timer) {
      countProvider.setCount();
    });
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    var countProvider = Provider.of<CountProvider>(context,listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Counter Example"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Align(
            alignment: Alignment.center,
            child: Consumer<CountProvider>(
              builder:(context,value,child) {
                return Text(value.count.toString(),style: const TextStyle(
                    fontSize: 30,
                    color: Colors.black
                ),);
            },)
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          countProvider.setCount();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}