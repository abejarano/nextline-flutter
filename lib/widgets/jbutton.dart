import 'package:flutter/material.dart';
import 'package:nextline/utils/app_colors.dart';
import 'package:nextline/utils/app_fonts.dart';

class JButton extends StatefulWidget {
  final Color background;
  final VoidCallback onTab;
  final Color borderColor;
  final double buttonHeight;
  final double minWidth;
  // Label
  final String label;
  final Color labelColor;
  final double fontSize;
  final Function labelWidget;
  // Icon
  final IconData icon;
  final Color iconColor;
  final bool isIconRight;
  const JButton({
    Key key,
    @required this.label,
    @required this.onTab,
    this.labelColor,
    this.fontSize,
    this.borderColor,
    this.buttonHeight = 60,
    this.labelWidget,
    this.icon,
    this.isIconRight = true,
    this.background = AppColors.blue_dark,
    this.iconColor = Colors.white, this.minWidth = 380,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _JButton();
  }
}

class _JButton extends State<JButton> {
  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
        minWidth: widget.minWidth,
        height: widget.buttonHeight,
        disabledColor: AppColors.gray_text_color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
          side: BorderSide(color: (widget.borderColor == null) ? widget.background : widget.borderColor),
        ),
        child: Padding(
          padding: EdgeInsets.all(20),
          child: RaisedButton(
              onPressed: widget.onTab,
              color: widget.background,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(this.widget.icon, color: this.widget.background),
                  _buttonLabel(),
                  Icon(
                    this.widget.icon,
                    color: this.widget.iconColor,
                  )
                ],
              )),
        ));
  }

  Widget _buttonLabel() {
    return Text(
      widget.label,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: (widget.fontSize == null) ? 14 : widget.fontSize, color: (widget.labelColor == null) ? Colors.white : widget.labelColor, fontFamily: AppFonts.fontTitle
      ),
    );
  }
}
