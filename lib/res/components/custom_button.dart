import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../colors.dart';

class CustomButton extends StatelessWidget {
  String title;
  VoidCallback onPress;
  bool? loading = false;

  CustomButton({
    required this.title,
    required this.onPress,
    this.loading,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 50, right: 50),
      child: InkWell(
        onTap: onPress,
        child: Container(
          height: 50,
          width: double.infinity,
          decoration: BoxDecoration(
            color: AppColor.PrimaryColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: loading!
                ? CircularProgressIndicator(
                    color: AppColor.whiteColor,
                  )
                : Text(
                    title,
                    style: TextStyle(color: AppColor.whiteColor),
                  ),
          ),
        ),
      ),
    );
  }
}
