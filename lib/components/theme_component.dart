import 'package:book/components/SwitchButton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ThemeComponent{
  static Widget buttonSwitch({required bool selectValue,required Function(bool) functionSelect}){
    return Container(
      constraints: BoxConstraints(maxWidth: 50, minHeight: 10),
      child: SwitchButton(value: selectValue, onChanged:functionSelect,isBorder: true,colorClick: Colors.greenAccent.shade700,),
    );
  }
}