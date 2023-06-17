import 'package:Task/app/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../../app/app_dimens.dart';


class LoadingWidget extends StatelessWidget {
  final String? text;
  const LoadingWidget({Key? key,this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      // mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SpinKitSpinningLines(
          color: AppColors.moshaver,
          size: 64,
          itemCount: 5,
          lineWidth: 3,
          duration: Duration(
              seconds: 7
          ),
        ),
        SizedBox(
          height: 24,
        ),
        Text(text !=null ? text! : "در حال بارگذاری ...")
      ],
    );
  }
}
