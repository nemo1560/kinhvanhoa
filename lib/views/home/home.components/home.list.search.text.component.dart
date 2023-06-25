
import 'dart:developer';

import 'package:flutter/material.dart';

class TextComponent extends StatefulWidget{

  late TextEditingController controller;
  late Function(String content)? function;
  final bool? notLock;
  final String? hint;
  late int lines;
  late bool border;
  final TextInputType textInputType;
  late Function(bool focus)? functionFocus;
  late Function(String value)? functionOnSubmit;
  late FocusNode? focusNode;

  TextComponent({required this.controller,this.focusNode,this.notLock,this.hint,this.lines = 1,this.border = true,
    this.textInputType = TextInputType.text,this.function,this.functionFocus,this.functionOnSubmit});

  @override
  State<StatefulWidget> createState() {
    return TextComponentState();
  }

}


class TextComponentState extends State<TextComponent>{
  double sizeBottom = 10.0;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FocusScope(child: TextFormField(
      key: Key(widget.controller.text),
      maxLines: widget.lines,
      focusNode: widget.focusNode,
      controller: widget.controller,
      keyboardType: widget.textInputType,
      textInputAction: TextInputAction.done,
      onFieldSubmitted: widget.functionOnSubmit,
      decoration: InputDecoration(
        counterText: "",
        isDense: true,
        hintText: widget.hint,
        hintStyle: TextStyle(color: Colors.grey.shade500,fontStyle: FontStyle.italic,fontSize: 12),
        contentPadding: const EdgeInsets.all(10),
        fillColor: Colors.white,
        focusedBorder: widget.border ? OutlineInputBorder(
          borderSide:  BorderSide(
              color: Colors.greenAccent.shade400, width: 1),
          borderRadius: BorderRadius.circular(10),
        ) : null,
        border: widget.border ? OutlineInputBorder(
          borderSide:  BorderSide(
              color: Colors.greenAccent.shade400, width: 1),
          borderRadius: BorderRadius.circular(10),
        ): null,
      ),
      enabled: widget.notLock,
      onChanged: widget.function,
    ),onFocusChange: widget.functionFocus,);
  }

}