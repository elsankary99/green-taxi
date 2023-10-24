import 'package:flutter/material.dart';

import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class Toast {
  static successToast(BuildContext context, {required String message}) {
    showTopSnackBar(
      Overlay.of(context),
      snackBarPosition: SnackBarPosition.bottom,
      CustomSnackBar.success(message: message),
    );
  }

  static errorToast(BuildContext context, {required String message}) {
    showTopSnackBar(
      Overlay.of(context),
      snackBarPosition: SnackBarPosition.bottom,
      CustomSnackBar.success(message: message),
    );
  }

  static topErrorToast(BuildContext context, {required String message}) {
    showTopSnackBar(
      Overlay.of(context),
      CustomSnackBar.error(message: message),
    );
  }
}
