import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SwitchButton extends StatefulWidget {
  final bool value;
  final Color color;
  final Color colorClick;
  final bool isBorder;
  final ValueChanged<bool> onChanged;
  final String textA;
  final String textB;

  const SwitchButton({Key? key, required this.value,
    this.color = Colors.white, this.isBorder = false, this.colorClick = Colors.blue,
    required this.onChanged, this.textA = '', this.textB = ''}) : super(key: key);

  @override
  SwitchButtonState createState() => SwitchButtonState();
}

class SwitchButtonState extends State<SwitchButton>
    with SingleTickerProviderStateMixin {
  late Animation _circleAnimation;
  late AnimationController _animationController;


  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 60));
    _circleAnimation = AlignmentTween(
            begin: widget.value ? Alignment.centerRight : Alignment.centerLeft,
            end: widget.value ? Alignment.centerLeft : Alignment.centerRight)
        .animate(CurvedAnimation(
            parent: _animationController, curve: Curves.linear));
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return GestureDetector(
          onTap: () {
            if (_animationController.isCompleted) {
              _animationController.reverse();
            } else {
              _animationController.forward();
            }
            widget.value == false
                ? widget.onChanged(true)
                : widget.onChanged(false);
          },
          child: Stack(
            children: [
            Container(
            width: 45.0,
            height: 28.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24.0),
              border: Border.all(color: widget.color, width: widget.isBorder ? 1 : 0),
              color: _circleAnimation.value == Alignment.centerLeft
                  ? Colors.black // true
                  : Colors.white //false,
            ),child: Row(children: [
              Expanded(child: Center(child: Text(widget.textA,style: TextStyle(color: Colors.white),),)),
              Expanded(child: Center(child: Text(widget.textB,style: TextStyle(color: Colors.white),),)),
            ],),),
              Container(
                width: 45.0,
                height: 28.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24.0),
                  color: Colors.transparent,
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 2.0, bottom: 2.0, right: 2.0, left: 2.0),
                  child: Container(
                    alignment: widget.value
                        ? ((Directionality.of(context) == TextDirection.rtl)
                        ? Alignment.centerRight
                        : Alignment.centerLeft)
                        : ((Directionality.of(context) == TextDirection.rtl)
                        ? Alignment.centerLeft
                        : Alignment.centerRight),
                    child: Container(
                      width: 20.0,
                      height: 20.0,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: widget.colorClick),
                    ),
                  ),
                ),
              ),
            ],
          )
        );
      },
    );
  }
}





