import 'package:book/core/uitility.dart';
import 'package:book/views/home/home_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import '../../../components/theme_component.dart';

class HomeInfo extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Obx(() => Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: Container(
                constraints: BoxConstraints(maxHeight: 300),
                child: Column(
                  children: [
                    Text('Bảng điều khiển',style: controller.defaultStyle(
                      fontSize: 25, color: Colors.greenAccent.shade700,bold: 1)),
                    Container(
                      margin: EdgeInsets.fromLTRB(10, 5, 10, 30),
                      constraints: BoxConstraints(maxHeight: 200),
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Utility.isLightTheme.value ? Colors.white60 : Colors.white38,
                        border: Border.all(
                            color: Colors.greenAccent.shade700,
                            width: 1,
                            style: BorderStyle.solid),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: Utility.isLightTheme.value ? 2 : 0,
                            blurRadius: 5,
                            offset: Offset(2, 2), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(height: 20,),
                          Row(
                            children: [
                              Expanded(
                                flex: 4,
                                child: Text(
                                  'Nền sáng - tối:',
                                  style: controller.defaultStyle(
                                      fontSize: 16, color: Utility.isLightTheme.value ? Colors.black : Colors.white),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: ThemeComponent.buttonSwitch(
                                    selectValue: Utility.isLightTheme.value,
                                    functionSelect: (bool) {
                                      controller.setLightTheme();
                                    }),
                              )
                            ],
                          ),
                          SizedBox(height: 20,),
                          Row(children: [
                            Expanded(flex: 3,child: Text('Tác giả:',style: controller.defaultStyle(
                                fontSize: 16, color: Utility.isLightTheme.value ? Colors.black : Colors.white),),),
                            Expanded(flex: 1,child: Text('Nemo1560',style: controller.defaultStyle(
                                fontSize: 16, color: Utility.isLightTheme.value ? Colors.black : Colors.white),),),
                          ],),
                          SizedBox(height: 20,),

                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
