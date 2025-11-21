import 'package:easy_browse/core/utils/app_styles.dart';
import 'package:easy_browse/core/utils/common_helper.dart';
import 'package:easy_browse/core/utils/screen_size.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SubmitButton extends StatelessWidget {
   const SubmitButton({super.key, required this.onTap, required this.text, required this.buttonColor,  required this.txtColor,  this.isLoading=false, this.width, this.height,});
  final VoidCallback onTap;
  final String text;
  final Color buttonColor;
     final double? width;  
  final double? height; 


  final Color txtColor;
 final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: isLoading ? null:onTap,
      
      child: Container(
     width: width??double.infinity,
        height: height?? MediaQuery.sizeOf(context).height*0.07,
        decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: BorderRadius.circular(50)
        ),
        child: isLoading ? showLoading(context,Colors.white,16): Center(child: Text(text,style: Styles.ralewayBold16(context).copyWith(color: txtColor,fontSize: ScreenSize.getResponsiveFontSize(context, 20)),)),
      ),
    );
  }
}