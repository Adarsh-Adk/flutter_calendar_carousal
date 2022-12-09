import 'package:flutter/material.dart';

import 'default_styles.dart' show defaultHeaderTextStyle;

class CustomCalendarHeader extends StatelessWidget {
  /// Passing in values for [leftButtonIcon] or [rightButtonIcon] will override [headerIconColor]
  const CustomCalendarHeader(
      {Key? key,
      required this.headerTitle,
      this.headerMargin,
      this.showHeader,
      this.headerTextStyle,
      this.showHeaderButtons,
      this.headerIconColor,
      this.iconColor,
      this.leftButtonIcon,
      this.rightButtonIcon,
      required this.onLeftButtonPressed,
      required this.onRightButtonPressed,
      this.isTitleTouchable,
      required this.onHeaderTitlePressed})
      : super(key: key);

  final String? headerTitle;
  final EdgeInsetsGeometry? headerMargin;
  final bool? showHeader;
  final TextStyle? headerTextStyle;
  final bool? showHeaderButtons;
  final Color? headerIconColor;
  final Color? iconColor;
  final Widget? leftButtonIcon;
  final Widget? rightButtonIcon;
  final VoidCallback onLeftButtonPressed;
  final VoidCallback onRightButtonPressed;
  final bool? isTitleTouchable;
  final VoidCallback? onHeaderTitlePressed;

  TextStyle? get getTextStyle => headerTextStyle ?? defaultHeaderTextStyle;

  Widget _leftButton() => IconButton(
        onPressed: onLeftButtonPressed,
        icon: leftButtonIcon ??
            Icon(Icons.chevron_left, color: iconColor ?? Colors.black12),
      );

  Widget _rightButton() => IconButton(
        onPressed: onRightButtonPressed,
        icon: rightButtonIcon ??
            Icon(Icons.chevron_right, color: iconColor ?? Colors.black12),
      );

  Widget _headerTouchable() => TextButton(
        onPressed: onHeaderTitlePressed,
        child: Text(
          headerTitle!,
          semanticsLabel: headerTitle,
          style: getTextStyle,
        ),
      );

  @override
  Widget build(BuildContext context) => showHeader!
      ? Container(
          margin: headerMargin,
          child: DefaultTextStyle(
              style: getTextStyle!,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    showHeaderButtons! ? _leftButton() : Container(),
                    isTitleTouchable!
                        ? _headerTouchable()
                        : Text(headerTitle!, style: getTextStyle),
                    showHeaderButtons! ? _rightButton() : Container(),
                  ])),
        )
      : Container();
}
