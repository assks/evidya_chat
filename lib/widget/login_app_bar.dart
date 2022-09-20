

import 'package:evidya/utils/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HeadingAppBar extends StatefulWidget {
  String title, description;
  double sizes,padding_top,description_size;

  HeadingAppBar({key, this.title,this.sizes, this.padding_top,this.description,this.description_size}) : super(key: key);

  @override
  _HeadingAppBarState createState() => _HeadingAppBarState();
}

class _HeadingAppBarState extends State<HeadingAppBar> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: _topHeading(),
    );
  }

  Widget _topHeading() {
    return Padding(
        padding: EdgeInsets.only(
            left: getProportionateScreenWidth(30),
            right: getProportionateScreenWidth(30),
            top: getProportionateScreenWidth(this.widget.padding_top)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: Text(
                widget.title,
                textAlign: TextAlign.start,
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: getProportionateScreenWidth(this.widget.sizes)),
              ),
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Text(
                  widget.description,
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w200,
                      fontSize: getProportionateScreenWidth(this.widget.description_size)),
                ),
              ),
            ),
          ],
        ));
  }
}
