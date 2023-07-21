import 'package:flutter/material.dart';

class RoundButton extends StatefulWidget {
  RoundButton({required this.title, required this.onPress}) : super();
  String? title;
  VoidCallback? onPress;

  @override
  State<RoundButton> createState() => _RoundButtonState();
}

class _RoundButtonState extends State<RoundButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onPress,
      child: Container(
        height: MediaQuery.of(context).size.height * .05,
        width: MediaQuery.of(context).size.width * .8,
        decoration: BoxDecoration(color: Colors.blue),
        child: Center(
            child: Text(
          widget.title.toString(),
          style: TextStyle(
            color: Colors.white,
          ),
        )),
      ),
    );
  }
}
