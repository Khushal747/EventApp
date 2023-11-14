import 'package:flutter/material.dart';
import 'package:khushal_s_application4/core/app_export.dart';
import 'package:khushal_s_application4/core/utils/size_ext.dart';

// ignore: must_be_immutable
class AppbarImage extends StatelessWidget {
  AppbarImage({
    Key? key,
    this.imagePath,
    this.margin,
    this.onTap,
  }) : super(
          key: key,
        );

  String? imagePath;

  EdgeInsetsGeometry? margin;

  Function? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap!.call();
      },
      child: Padding(
        padding: margin ?? EdgeInsets.zero,
        child: CustomImageView(
          imagePath: imagePath,
          height: 22.Sh,
          width: 22.Sw,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
