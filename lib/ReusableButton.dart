import 'package:flutter/material.dart';

class ReusableButton extends StatelessWidget {
  ReusableButton({this.label, this.color, this.onPressed, this.heightRatio});
  final String label;
  final Color color;
  final Function onPressed;
  final double heightRatio;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: (heightRatio==null)?MediaQuery.of(context).size.height*0.12:MediaQuery.of(context).size.height*heightRatio,
      margin: EdgeInsets.all(0.75),
        child: FlatButton(
          padding: EdgeInsets.all(20),
          color: color,
          onPressed: onPressed,
          child: Text('$label', style: TextStyle(fontSize: 40, color: Colors.white, fontWeight: FontWeight.w400),),
        )
    );
  }
}
