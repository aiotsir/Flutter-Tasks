import 'package:flutter/material.dart';
import './widgets/basicWidget.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //BuildContext is the return type of the function build.
    return MaterialApp(
      //material App is also a class
      title: "Mallu Developer App",
      home: Scaffold(
        body: Center(
          child: BasicWidget(),
        ),
      ),
    );
  }
}
