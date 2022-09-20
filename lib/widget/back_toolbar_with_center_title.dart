
import 'package:evidya/utils/SizeConfigs.dart';
import 'package:flutter/material.dart';

class BackPressAppBarWithTitle extends StatefulWidget
    implements PreferredSizeWidget {
  @override
  final Size preferredSize;

  bool isBackButtonShow,isschudleclassButtonShow, isContactsAppBar = false;

  String centerTitle;
  Color titleColor, backButtonColor;
  Function onSendClick;

  BackPressAppBarWithTitle(
      {Key key,
      @required this.isBackButtonShow,
      @required this.centerTitle,
      @required this.titleColor,
      @required this.backButtonColor,
      @required this.isContactsAppBar,
        @required this.isschudleclassButtonShow,
      this.onSendClick, })
      : preferredSize = Size.fromHeight(AppBar().preferredSize.height);

  @override
  _BackPressAppBarWithTitleState createState() =>
      _BackPressAppBarWithTitleState();
}

class _BackPressAppBarWithTitleState extends State<BackPressAppBarWithTitle> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return AppBar(
      centerTitle: true,
      title: Text(
        widget.centerTitle,
        style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: 2.8 * SizeConfig.blockSizeVertical),
      ),
      // You can add title here
      leading: widget.isBackButtonShow
          ? IconButton(
              icon: Padding(
                child: Icon(
                 Icons.keyboard_backspace,
                  color: Colors.white,
                ),
                padding: EdgeInsets.all(8),
              ),
              onPressed: () =>
                  Navigator.of(context).pop(),
            )
          : null,
      actions: widget.isschudleclassButtonShow ? <Widget>[
        IconButton(
          icon: Icon(
            Icons.add,
            color: Colors.white,
          ),
          onPressed: () {
            // Navigator.push(
            //     context,
            //     MaterialPageRoute(
            //       builder: (context) => SchudleClass_screen(),
            //     ));
          },
        )
      ]: null,
      backgroundColor: Colors.transparent,
      elevation: 0.0,

    );
  }
}
