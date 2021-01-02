import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pageView/controller/homeController.dart';


class Home extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    final OpenController drawer = Get.find();


    return new Container(
      height: height,
      alignment: Alignment.center,
      child: profileUi(width,height,drawer),
    );
  }

  profileUi(width, height,drawer) {
    return Container(
        width: width,
        height: height,
        color: Colors.white,
        child: NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                new SliverAppBar(
                  expandedHeight: 430,
                  floating: true,
                  pinned: true,
                  bottom: PreferredSize(
                    child: Material(
                      color: Colors.white,
                      child: tabBar(width,drawer),
                    ),
                    preferredSize: Size.fromHeight(50),
                  ),
                  flexibleSpace: FlexibleSpaceBar(
                      background: header(width,height,drawer)),
                  backgroundColor: Colors.white,
                  automaticallyImplyLeading: false,
                  elevation: 0,
                ),
              ];
            },
            controller: drawer.fromController.value,
            body: tabBarView(width, height,drawer)));
  }

  header(width,height,drawer) {
    return Container(
      height: 450,
      width: width,
      color: Colors.purple,
    );
  }

  tabBar(width,drawer) {
    return Container(
      width: width,
      color: Colors.amber,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  animateTo(0,drawer);
                },
                child: Container(
                    alignment: Alignment.center,
                    height: 50,
                    child: Obx(()=>Text('Page 1',
                        style: TextStyle(color: drawer.page.value == 0 ? Colors.white : Colors.grey))),
                    width: width * .23),
              ),
              InkWell(
                onTap: () {
                  animateTo(1,drawer);
                },
                child: Container(
                    alignment: Alignment.center,
                    height: 50,
                    child: Obx(()=>Text('Page2',
                        style: TextStyle(color: drawer.page.value == 1 ? Colors.white : Colors.grey))),
                    width: width * .23),
              ),
              InkWell(
                onTap: () {
                  animateTo(2,drawer);
                },
                child: Container(
                    alignment: Alignment.center,
                    height: 50,
                    child: Obx(()=>Text('Page 3',
                        style: TextStyle(color: drawer.page.value == 2 ? Colors.white : Colors.grey))),
                    width: width * .23),
              ),
              InkWell(
                onTap: () {
                  animateTo(3,drawer);
                },
                child: Container(
                    alignment: Alignment.center,
                    height: 50,
                    child: Obx(()=>Text('Page 4',
                        style: TextStyle(color: drawer.page.value == 3 ? Colors.white : Colors.grey))),
                    width: width * .23),
              ),
            ],
          ),
        ],
      ),
    );
  }

  tabBarView(width, height,drawer) {
    return Container(
      height: height - 140,
      padding: EdgeInsets.only(bottom: 65),
      child: PageView(
        children: <Widget>[
          Container(
            height: height,
            alignment: Alignment.center,
            child: Text('Page 1'),
          ),
          Container(
            height: height,
            alignment: Alignment.center,
            child: Text('Page 2'),
          ),
          Container(
            height: height,
            alignment: Alignment.center,
            child: Text('Page 3'),
          ),
          Container(
            height: height,
            alignment: Alignment.center,
            child: Text('Page 4'),
          ),
        ],
        controller: drawer.controller.value,
        onPageChanged: (value){
          drawer.onPageChanged(value);
        },
        pageSnapping: true,
      ),
    );
  }

  animateTo(int input,drawer) {
    drawer.onPageChanged(input);
    drawer.animateTo(input);
  }

}