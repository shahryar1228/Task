import 'package:Task/app/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

Widget pageTabMenuItem(BuildContext context,String icon,String text,bool isSelected){
  var width = MediaQuery.of(context).size.width;
  var height = MediaQuery.of(context).size.height;
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisAlignment: MainAxisAlignment.center,
    mainAxisSize: MainAxisSize.min,
    children: [
      SvgPicture.asset(icon,color: isSelected ? AppColors.moshaver : AppColors.textGray),
      Text(maxLines: 1,textAlign: TextAlign.center,text ?? "", style: TextStyle(color: isSelected ? AppColors.moshaver : AppColors.textGray),),
    ],
  );
}
