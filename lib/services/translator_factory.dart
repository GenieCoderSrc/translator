import 'package:dart_data_type_parser/dart_data_type_parsers/string_extensions.dart';
import 'package:flutter/material.dart';
import 'package:navigation_wihout_context/navigation_wihout_context.dart';
import 'package:translator/utils/translate.dart';

extension TranslateStringExtension on String {
  String translateTxt(BuildContext context) =>
      Translate.of(context)?.translate(this) ?? toTitleCase();

  String translateWithoutContext() {
    final BuildContext? context = AppRouter.navigatorKey.currentState?.context;
    return context != null
        ? Translate.of(context)?.translate(this) ?? toTitleCase()
        : toTitleCase();
  }
}


