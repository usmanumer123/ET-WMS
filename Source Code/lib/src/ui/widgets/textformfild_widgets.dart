import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TextFormFildWidgets extends StatelessWidget {
  final String title;
  final IconData? icon;
  final IconButton? iconButton;
  Function()? onPressd;
  final bool? read;
  TextEditingController? txtcontroller;
  final FocusNode? focusNode;
  TextFormFildWidgets(
      {Key? key,
      required this.title,
      this.icon,
        this.iconButton,
      this.onPressd,
      this.txtcontroller,
      this.focusNode,
      this.read});

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: .7,
      child: TextFormField(
        controller: txtcontroller,
        onTap: onPressd,
        readOnly: read ?? false,
        decoration: InputDecoration(
          hintText: title,
          suffixIcon: iconButton,

          // suffixIcon: Icon(icon),
        ),
      ),
    );
  }
}
