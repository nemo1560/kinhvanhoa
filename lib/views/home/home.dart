import 'package:book/views/home/home_controller.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:getwidget/components/button/gf_icon_button.dart';
import 'package:getwidget/getwidget.dart';

import '../../core/string_name.dart';
import '../../core/uitility.dart';

class Home extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: GFAppBar(
        backgroundColor: GFColors.SUCCESS,
        leading: GFIconButton(
          icon: Icon(
            Icons.arrow_back_ios_new_outlined,
            color: Colors.white,
          ),
          onPressed: controller.backPressed,
          type: GFButtonType.transparent,
        ),
        searchBar: false,
        title: Text(StringName.appTitle,style: controller.customStyle(fontSize: 20, color: Colors.white),),
        centerTitle: true,
        actions: <Widget>[
          GFIconButton(
            icon: Icon(
              Icons.info,
              color: Colors.white,
            ),
            onPressed: () {
              controller.alert(content: 'Nemo1560');
            },
            type: GFButtonType.transparent,
          ),
        ],
      ),
      body: body(context),
      bottomNavigationBar: ConvexAppBar(
        style: TabStyle.react,
        height: 60,
        initialActiveIndex: 0,
        curveSize: 400,
        items: controller.lstPage,
        controller: controller.tabController,
        backgroundColor: GFColors.SUCCESS,
        onTap: (index) {
          controller.tabSelect(index);
        },
      ),
    );
  }

  Widget body(BuildContext context) {
    return Container(
      width: Utility.size.width,
      height: Utility.size.height,
      child: TabBarView(
        physics: const NeverScrollableScrollPhysics(),
        controller: controller.tabController,
        children: controller.pages,
      ),
    );
  }
}
