import 'package:flutter/material.dart';

typedef IntCallback = Function(int num);

class News extends StatelessWidget {

  final IntCallback page;
  News({this.page});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return new Container(
      height: height,
      alignment: Alignment.center,
      child: SingleChildScrollView(
        child: Column(
          children: [
            OutlineButton(
              onPressed:()=>page(0),
              child: Text('go Home and Page 1'),
            ),
            OutlineButton(
              onPressed:()=>page(1),
              child: Text('go Home and Page 2'),
            ),
            OutlineButton(
              onPressed:()=>page(2),
              child: Text('go Home and Page 3'),
            )
          ],
        ),
      ),
    );
  }

}