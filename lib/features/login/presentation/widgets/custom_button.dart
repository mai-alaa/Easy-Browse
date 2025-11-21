import 'package:easy_browse/core/extentions/int_extentions.dart';
import 'package:easy_browse/core/utils/common_helper.dart';
import 'package:easy_browse/core/utils/constants.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color color;
  final Color textColor;
  final IconData icon;
  final bool isLoading;
  const CustomButton({super.key, required this.text, required this.onPressed, required this.color, required this.textColor, required this.icon, this.isLoading = false});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: isLoading? null : onPressed,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(8),
        ),
        child: isLoading ? showLoading(context,Colors.white,16): Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon,color: kBackgroundColor,),
            8.toWidth,
            Text(
              text,
              style: TextStyle(
                color: textColor,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}