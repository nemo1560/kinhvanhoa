import 'package:book/core/base_controller.dart';
import 'package:book/core/uitility.dart';
import 'package:book/views/home/home.interface/home.interface.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'home.list.search.text.component.dart';

class SearchComponent<T extends BaseController> extends StatelessWidget{

  final HomeCallBack callBack;
  final T controller;
  final double height;
  late TextEditingController textEditingController;

  SearchComponent({required this.controller,required this.callBack, required this.height});

  @override
  Widget build(BuildContext context) {
    textEditingController = TextEditingController();
    return AnimatedContainer(
      width: Utility.size.width,
      height: height,
      curve: Curves.easeIn,
      margin: EdgeInsets.all(5),
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade400,
              blurRadius: 5.0,
              spreadRadius: 2.0,
              offset: Offset(1.0, 2.0),
            )
          ],
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: Colors.white
      ), duration: Duration(milliseconds: 200),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(child: TextComponent(controller: textEditingController, focusNode: controller.focusNode,notLock: true,border: true,function: (value){
            callBack.searchCallBack(value);
          },)),
          SizedBox(
            width: 40,
            child: InkWell(
              child: Icon(Icons.delete_forever_rounded,color: Colors.green,size: 30,),
              onTap: (){
                textEditingController.clear();
              },
            ),
          )
        ],
      ),
    );
  }
}