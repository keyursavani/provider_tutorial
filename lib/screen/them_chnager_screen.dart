import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/them_changer_provider.dart';

class ThemChangerScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
   return ThemChangerProviderScreenState();
  }
}
class ThemChangerProviderScreenState extends State<ThemChangerScreen>{
  @override
  Widget build(BuildContext context) {
    final themChanger = Provider.of<ThemChangerProvider>(context);
    // TODO: implement build
   return Scaffold(
     appBar: AppBar(
       title: Text("Them Changer Example"),
     ),
     body: Column(
       children: [
         RadioListTile<ThemeMode>(
           title: Text("Light Mode"),
             value: ThemeMode.light,
             groupValue: themChanger.themeMode,
             onChanged: themChanger.setTheme
         ),
         RadioListTile<ThemeMode>(
             title: Text("Dark Mode"),
             value: ThemeMode.dark,
             groupValue: themChanger.themeMode,
             onChanged: themChanger.setTheme
         ),
         RadioListTile<ThemeMode>(
             title: Text("System Mode"),
             value: ThemeMode.system,
             groupValue: themChanger.themeMode,
             onChanged: themChanger.setTheme
         ),
         Icon(Icons.favorite),
       ],
     ),
   );
  }
}