// ignore_for_file: depend_on_referenced_packages

import 'package:advanced_flutter_projexct/extensions/context_extension.dart';
import 'package:advanced_flutter_projexct/extensions/text_style_extension.dart';
import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../common/assets.dart';
import '../common/dimensions.dart';
import '../theme/light_theme_colors.dart';

class DialogManager {
  Future showFlushBar(
    BuildContext context,
    String message, {
    String errorCode = '',
    Duration? animationDuration,
    EdgeInsets? padding,
    SnackbarType type = SnackbarType.info,
  }) {
    return Flushbar(
      flushbarPosition: FlushbarPosition.TOP,
      messageText: _buildSnackbarContent(type, context, message, errorCode),
      margin: EdgeInsets.symmetric(
        horizontal: bodyPadding,
        vertical: paddingLarge2,
      ),
      borderRadius: BorderRadius.circular(snackBarCornerRadius),
      backgroundColor: type.color,
      duration: const Duration(seconds: 2),
      animationDuration: animationDuration ?? Duration.zero,
      padding: padding ?? EdgeInsets.all(paddingRegular1),
    ).show(context);
  }

  Future<SnackBarClosedReason> showSnackBar(
    BuildContext context,
    String message, {
    String errorCode = '',
    SnackbarType type = SnackbarType.info,
    EdgeInsets? margin,
  }) {
    final scaffoldMessenger = ScaffoldMessenger.of(context)..clearSnackBars();

    return scaffoldMessenger
        .showSnackBar(
          SnackBar(
            content: _buildSnackbarContent(
              type,
              context,
              message,
              errorCode,
            ),
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            margin: margin ??
                EdgeInsets.symmetric(horizontal: dp24, vertical: dp35),
            padding: margin ??
                EdgeInsets.symmetric(
                  horizontal: bodyPadding,
                  vertical: paddingMedium2,
                ),
            backgroundColor: type.color,
            duration: const Duration(seconds: 2),
          ),
        )
        .closed;
  }

  Row _buildSnackbarContent(
    SnackbarType type,
    BuildContext context,
    String message,
    String errorCode,
  ) {
    return Row(
      children: [
        SvgPicture.asset(
          type.iconPath,
          width: iconSizeL,
          color: type.iconColor(context),
        ),
        SizedBox(width: paddingSmall1),
        Expanded(
          child: Text(
            message,
            style: context.textTheme.bodyMedium!.regular.copyWith(
              color: white,
              fontSize: sp13,
            ),
          ),
        ),
      ],
    );
  }
}

enum SnackbarType {
  info,
  success,
  error;
}

extension SnackbarTypeExtensions on SnackbarType {
  String get iconPath {
    switch (this) {
      case SnackbarType.info:
        return Assets.error;
      case SnackbarType.success:
        return Assets.error;
      case SnackbarType.error:
        return Assets.error;
    }
  }

  Color get color {
    switch (this) {
      case SnackbarType.info:
        return primary;
      case SnackbarType.success:
        return primary;
      case SnackbarType.error:
        return Colors.red;
    }
  }

  dynamic iconColor(BuildContext context) {
    return white;
  }
}
