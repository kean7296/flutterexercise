import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travel_app/misc/colors.dart';
import 'package:travel_app/widgets/app_text.dart';

class ResponsiveButton extends StatelessWidget {
  bool isResponsive;
  double? width;
  String? text;
  ResponsiveButton(
      {Key? key, this.text, this.width = 120, this.isResponsive = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        width: isResponsive ? double.maxFinite : width,
        height: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColors.mainColor,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            isResponsive
                ? AppText(
                    text: "Book Trip Now",
                    color: Colors.white,
                  )
                : Container(),
            Image.asset('assets/img/button-one.png'),
          ],
        ),
      ),
    );
  }
}
