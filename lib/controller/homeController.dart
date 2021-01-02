import 'package:get/get.dart';
import 'package:flutter/material.dart';

class OpenController extends GetxController{

  var page = 0.obs;
  var controller = PageController().obs;
  var fromController = ScrollController(initialScrollOffset: 0.0).obs;

  onPageChanged(input) {
    page.value = input;
  }

  animateTo(int page) {
    if (controller.value.hasClients)
      controller.value.animateToPage(page,
          duration: Duration(milliseconds: 300), curve: Curves.easeIn);
  }

  resetController(int page) {
    controller.value = PageController(initialPage: page);
  }

}