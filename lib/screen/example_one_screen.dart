import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled1/provider/example_one_provider.dart';

class ExampleOne extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ExampleOneState();
  }
}

class ExampleOneState extends State<ExampleOne> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ExampleOneProvider>(context, listen: true);
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: const Text("Example One"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Consumer<ExampleOneProvider>(builder: (context, value, children) {
            return Align(
                alignment: Alignment.center,
                child: Slider(
                  value: value.value,
                  max: 1,
                  min: 0,
                  onChanged: (value1) {
                    value.setValue(value1);
                  },
                ));
          }),
          Consumer<ExampleOneProvider>(builder: (context, value, children) {
            return Row(
              children: [
                Expanded(
                  child: Container(
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.green.withOpacity(value.value),
                    ),
                    child: Center(
                      child: Text("container 1"),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.orange.withOpacity(value.value),
                    ),
                    child: Center(
                      child: Text("container 2"),
                    ),
                  ),
                ),
              ],
            );
          }),
        ],
      ),
    );
  }
}
