import 'package:flutter/material.dart';

class BasicWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(40),
      //padding: EdgeInsets.only(left:100, right: 100, top: 100, bottom: 200),
      decoration: BoxDecoration(
          color: Colors.tealAccent,
          border: Border.all(
            color: Colors.black,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.blueGrey,
              spreadRadius: 10,
              blurRadius: 10,
              offset: Offset(10, 0),
            ),
          ]),
      child: Center(
        child: Text("text to be displayed"),
      ),
    );
  }
}
