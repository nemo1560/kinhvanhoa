import 'package:book/core/string_name.dart';
import 'package:book/core/uitility.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:scroll_loop_auto_scroll/scroll_loop_auto_scroll.dart';

import 'info_controller.dart';

class Info extends GetView<InfoController> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Scaffold(
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
            title: Text(
              StringName.infoChapter,
              style: controller.customStyle(fontSize: 20, color: Colors.white),
            ),
            centerTitle: true,
            actions: <Widget>[
              GFIconButton(
                icon: Icon(
                  null,
                  color: Colors.white,
                ),
                onPressed: () {},
                type: GFButtonType.transparent,
              ),
            ],
          ),
          body: body(context),
        ),
        onWillPop: controller.backPressed);
  }

  Widget body(BuildContext context) {
    return Container(
        width: Utility.size.width,
        height: Utility.size.height,
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Expanded(
                flex: 3,
                child: Card(
                  color: Colors.green,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  elevation: 7,
                  child: ExtendedImage.network(
                    controller.url,
                    fit: BoxFit.fill,
                    cache: true,
                    imageCacheName: controller.imageCache,
                    border: Border.all(color: Colors.transparent, width: 1.0),
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    enableMemoryCache: true,
                    clearMemoryCacheWhenDispose: true,
                    filterQuality: FilterQuality.high,
                    //cancelToken: cancellationToken,
                  ),
                )),
            SizedBox(
              height: 10,
            ),
            Expanded(
              flex: 2,
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      margin: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          color: Colors.yellow.shade100,
                          boxShadow: <BoxShadow>[
                            BoxShadow(
                                color: Colors.grey.shade400,
                                blurRadius: 5.0,
                                offset: Offset(1.0, 1.5))
                          ],
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          )),
                      child: ScrollLoopAutoScroll(
                        duration: Duration(seconds: 100),
                        enableScrollInput: true,
                        child: Padding(padding: EdgeInsets.all(5),
                        child: Text(
                          StringName.infoBook,
                          softWrap: true,
                          style: controller.defaultStyle(color: Colors.grey),
                        )),
                        scrollDirection: Axis.vertical,
                        reverseScroll: false,
                      ),
                    ),
                  ),
                  InkWell(
                    child: Padding(
                        padding: EdgeInsets.all(10),
                        child: Align(
                          alignment: Alignment.bottomRight,
                          child: Card(
                            color: Colors.green,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                            ),
                            elevation: 5,
                            child: Container(
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                ),
                                child: Icon(
                                  Icons.play_circle_fill_outlined,
                                  color: Colors.white,
                                )),
                          ),
                        )),
                    onTap: () {
                      controller.readBook();
                    },
                  )
                ],
              ),
            )
          ],
        ));
  }
}
