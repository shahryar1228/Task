import 'package:Task/app/app_theme.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  late final Widget rightWidget;
  late final Function onRightClicked;
  late final Widget leftWidget;
  late final Function onLeftClicked;
  late final String title;

  CustomAppBar({Key? key, required this.rightWidget, required this.onRightClicked, required this.title, required this.leftWidget,
    required this.onLeftClicked})
      : preferredSize = Size.fromHeight(kToolbarHeight),
        super(key: key);

  @override
  final Size preferredSize;

  @override
  _CustomAppBarState createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        // borderRadius: BorderRadius.all(Radius.circular(8)),
        border: Border.all(color: AppColors.appbarBorder,width: 2)
      ),
      padding: const EdgeInsets.only(left: 8.0,right: 8.0),
      // color: AppColors.transparent,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 2,
                child: InkWell(onTap: () {
                  widget.onRightClicked.call();
                }, child: Container(padding: const EdgeInsets.all(8.0), child: widget.rightWidget)),
              ),
              Expanded(
                flex: 4,
                child: Container(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      overflow: TextOverflow.ellipsis,
                      widget.title,
                      textAlign: TextAlign.center,
                      style: const TextStyle(color: AppColors.textColor, fontSize: 16),
                    )),
              ),
              Expanded(
                flex: 2,
                child: InkWell(onTap: () {
                  widget.onLeftClicked.call();
                }, child: Container(padding: const EdgeInsets.all(8.0), child: widget.leftWidget)),
              )
            ],
          ),
        ],
      ),
    );
  }
}
