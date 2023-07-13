import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled1/provider/count_provider.dart';
import 'package:untitled1/provider/example_one_provider.dart';
import 'package:untitled1/provider/favourite_item_provider.dart';
import 'package:untitled1/screen/counter_example_screen.dart';
import 'package:untitled1/screen/example_one_screen.dart';
import 'package:untitled1/screen/favourite_item_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // TODO:: This is for single provider
    // return
    //   ChangeNotifierProvider(
    //     create: (_) => CountProvider(),
    // child: MaterialApp(
    //   title: 'Flutter Demo',
    //   theme: ThemeData(
    //     primarySwatch: Colors.blue,
    //   ),
    //   home: const CounterExampleScreen(),
    // ),
    // );
    // TODO:: This is for single provider
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CountProvider()),
        ChangeNotifierProvider(create: (_) => ExampleOneProvider()),
        ChangeNotifierProvider(create: (_) => FavouriteItemProvider()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home:FavouriteItemScreen(),
      ),
    );
  }
}
