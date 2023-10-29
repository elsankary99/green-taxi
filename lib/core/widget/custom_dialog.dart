import 'package:auto_route/auto_route.dart';

import 'package:flutter/material.dart';
import 'package:green_taxi/core/constant/app_colors.dart';
import 'package:green_taxi/core/constant/app_text_style.dart';
import 'package:green_taxi/core/extension/emdia_query.dart';

Future<void> showMyDialog(BuildContext context,
    {required String header,
    required String title,
    required String btnTitle,
    required void Function()? onPressed}) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: Text(header),
        backgroundColor: Theme.of(context).canvasColor,
        content: Text(
          title,
          style: AppTextStyle.poppinsRegular14,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10, bottom: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: ElevatedButton(
                      onPressed: () {
                        context.router.pop();
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Theme.of(context).canvasColor,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                              side: const BorderSide(color: Colors.grey))),
                      child: Text(
                        "No",
                        style: AppTextStyle.poppinsRegular14
                            .copyWith(color: AppColors.green),
                      )),
                ),
                SizedBox(width: context.width * 0.02),
                Expanded(
                  child: ElevatedButton(
                      onPressed: onPressed,
                      style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.green,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          )),
                      child: Text(
                        btnTitle,
                        style: AppTextStyle.poppinsBold14
                            .copyWith(color: AppColors.white),
                      )),
                ),
              ],
            ),
          ),
        ],
      );
    },
  );
}

Future<void> getImage(BuildContext context,
    {required void Function()? galleryBtn,
    required void Function()? cameraBtn}) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: Theme.of(context).canvasColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        actions: [
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10, bottom: 8),
            child: SizedBox(
              height: context.height * 0.2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ElevatedButton(
                      onPressed: galleryBtn,
                      style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.green,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          )),
                      child: Text(
                        "Image From Gallery",
                        style: AppTextStyle.poppinsRegular14
                            .copyWith(color: AppColors.white),
                      )),
                  ElevatedButton(
                      onPressed: cameraBtn,
                      style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.green,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          )),
                      child: Text(
                        "Image From Camera",
                        style: AppTextStyle.poppinsRegular14
                            .copyWith(color: AppColors.white),
                      )),
                  ElevatedButton(
                      onPressed: () {
                        context.router.pop();
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Theme.of(context).canvasColor,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                              side: const BorderSide(color: Colors.grey))),
                      child: Text(
                        "Cancel",
                        style: AppTextStyle.poppinsRegular14
                            .copyWith(color: AppColors.green),
                      )),
                ],
              ),
            ),
          ),
        ],
      );
    },
  );
}
