import 'package:flutter/material.dart';

class JButton extends StatefulWidget {
  final String label;
  final labelColor;
  final background;
  final borderColor;
  final VoidCallback onTab;
  final double top;

  const JButton(
      {Key key,
      @required this.label,
      @required this.onTab,
      @required this.top,
      this.labelColor,
      this.borderColor,
      this.background})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _JButton();
  }
}

class _JButton extends State<JButton> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: 60.0,
      margin: EdgeInsets.only(top: widget.top, left: 10.0, right: 10.0),
      decoration: BoxDecoration(
        border: (widget.borderColor == null) 
          ? Border.all(color: Colors.blueAccent)
          :  Border.all(color: widget.borderColor) ,
        borderRadius: BorderRadius.circular(25.0),
        color: (widget.background == null)
            ? Color.fromRGBO(82, 192, 242, 1)
            : widget.background,
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
            onTap: widget.onTab,
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25.0),
              ),
              child: Center(
                child: Text(
                  widget.label,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 16.0,
                      fontFamily: "fontTitle",
                      color: (widget.labelColor == null)
                        ? Colors.white 
                        : widget.labelColor),
                ),
              ),
            )),
      ),
    );
  }
}
