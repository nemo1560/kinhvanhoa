import 'package:book/core/base_controller.dart';
import 'package:book/core/uitility.dart';
import 'package:book/views/home/home.interface/home.interface.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchComponent<T extends BaseController> extends StatelessWidget{

  final HomeCallBack callBack;
  final T controller;
  final double height;

  SearchComponent({required this.controller,required this.callBack, required this.height});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      width: Utility.size.width,
      height: height,
      curve: Curves.easeIn,
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade400,
              blurRadius: 10.0,
              spreadRadius: 2.0,
              offset: Offset(1.0, 2.0),
            )
          ],
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: Colors.white
      ), duration: Duration(milliseconds: 200),
    );
  }
}