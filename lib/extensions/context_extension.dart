import 'package:flutter/material.dart';

import '../utils/dialog_manager.dart';

extension ContextExtensions on BuildContext {
  TextTheme get textTheme => Theme.of(this).textTheme;

  double get maxWidth => MediaQuery.of(this).size.width;
  double get maxHeight => MediaQuery.of(this).size.height;
  EdgeInsets get padding => MediaQuery.of(this).padding;
  Orientation get orientation => MediaQuery.of(this).orientation;

  TextStyle snackbarTextStyle({SnackbarType type = SnackbarType.info}) {
    final contentTextStyle = Theme.of(this).snackBarTheme.contentTextStyle!;

    return contentTextStyle;
  }
}
