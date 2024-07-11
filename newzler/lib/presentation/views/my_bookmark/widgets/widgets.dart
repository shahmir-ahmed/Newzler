import 'package:flutter/material.dart';
import 'package:newzler/configs/utils.dart';

class CustomCheckbox extends StatefulWidget {
  CustomCheckbox(
      {Key? key,
      this.width = 28.0,
      this.height = 28.0,
      this.color,
      required this.checkColor,
      required this.iconSize,
      required this.value,
      required this.onChanged})
      : super(key: key);

  final double width;
  final double height;
  final Color? color;
  // Now you can set the checkmark size of your own
  final double iconSize;
  final Color checkColor;
  final bool value;
  VoidCallback onChanged;

  @override
  State<CustomCheckbox> createState() => _CustomCheckboxState();
}

class _CustomCheckboxState extends State<CustomCheckbox> {
  // bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // onTap: () {
      // setState(() => isChecked = !isChecked);
      // widget.onChanged?.call(isChecked);

      // },
      onTap: () => widget.onChanged(),
      child: Container(
        width: widget.width,
        height: widget.height,
        decoration: BoxDecoration(
          border: Border.all(
            color: widget.value
                ? Utils.kAppPrimaryColor
                : widget.color ?? Colors.grey.shade500,
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(14.0),
          color: widget.value ? Utils.kAppPrimaryColor : Utils.whiteColor,
        ),
        child: widget.value
            ? Icon(
                Icons.check,
                size: widget.iconSize,
                color: widget.checkColor,
              )
            : null,
      ),
    );
  }
}
