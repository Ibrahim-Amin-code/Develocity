// ignore_for_file: unnecessary_this, use_key_in_widget_constructors

import 'package:flutter/material.dart';

class UserFABBottomAppBarItem {
  UserFABBottomAppBarItem({required this.iconData, required this.text});
  String iconData;
  String text;
}

class UserFABBottomAppBar extends StatefulWidget {
  UserFABBottomAppBar({
    required this.items,
    required this.centerItemText,
    this.height = 60.0,
    this.iconSize = 20.0,
    required this.backgroundColor,
    required this.color,
    required this.selectedColor,
    // required this.notchedShape,
    required this.onTabSelected,
  }) {
    assert(this.items.length == 2 || this.items.length == 4);
  }
  final List<UserFABBottomAppBarItem> items;
  final String centerItemText;
  final double height;
  final double iconSize;
  final Color backgroundColor;
  final Color color;
  final Color selectedColor;
  // final NotchedShape notchedShape;
  final ValueChanged<int> onTabSelected;

  @override
  State<StatefulWidget> createState() => UserFABBottomAppBarState();
}

class UserFABBottomAppBarState extends State<UserFABBottomAppBar> {
  int _selectedIndex = 0;
  // String lang = '';
  // getLang() async {
  //   SharedPreferences preferences = await SharedPreferences.getInstance();
  //   setState(() {
  //     lang = preferences.getString('language').toString();
  //   });
  // }

  _updateIndex(int index) {
    widget.onTabSelected(index);
    setState(() {
      _selectedIndex = index;
    });
  }

  // @override
  // void initState() {
  //   getLang();
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    List<Widget> items = List.generate(widget.items.length, (int index) {
      return _buildTabItem(
        item: widget.items[index],
        index: index,
        onPressed: _updateIndex,
      );
    });

    return BottomAppBar(
      // shape: NotchedShape.,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: items,
      ),
      color: widget.backgroundColor,
    );
  }

  Widget _buildTabItem({
    required UserFABBottomAppBarItem item,
    required int index,
    required ValueChanged<int> onPressed,
  }) {
    Color color = _selectedIndex == index ? widget.selectedColor : widget.color;
    return Expanded(
      child: SizedBox(
        height: widget.height,
        child: Material(
          type: MaterialType.transparency,
          child: InkWell(
            onTap: () => onPressed(index),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset(item.iconData,
                    fit: BoxFit.scaleDown,
                    color: color,
                    width: widget.iconSize),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  item.text,
                  style: TextStyle(
                    color: color,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'SF Pro Display',
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
