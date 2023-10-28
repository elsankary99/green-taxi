import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:green_taxi/view/widgets/home_widget/driver_bottom_sheet_body.dart';

availableDriverBottomSheet(BuildContext context) {
  return showModalBottomSheet(
    context: context,
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(12.r), topRight: Radius.circular(12.r))),
    builder: (context) {
      return const DriverBottomSheet();
    },
  );
}
