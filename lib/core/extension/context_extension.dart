import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {
  double get deviceHeight => MediaQuery.of(this).size.height;
  double get deviceWidth => MediaQuery.of(this).size.width;

  EdgeInsets get padding8 => const EdgeInsets.all(8.0);
  EdgeInsets get paddingAutoComplete => const EdgeInsets.fromLTRB(10, 5, 5, 5);
}
