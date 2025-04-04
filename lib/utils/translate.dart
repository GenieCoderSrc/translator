import 'package:flutter/material.dart';

import 'app_local_delegate.dart';
import 'util_load_local_file.dart';

class Translate {
  final Locale locale;

  Translate(this.locale);

  static Translate? of(BuildContext context) {
    return Localizations.of<Translate>(context, Translate);
  }

  static const LocalizationsDelegate<Translate> delegate = AppLocaleDelegate();

  late Map<String, String> _localizedStrings;

  Future<bool> load() async {
    final Map<String, dynamic> jsonMap = await UtilLoadLocalFile.loadJson(
      "assets/locale/${locale.languageCode}.json",
    );

    _localizedStrings = jsonMap.map((String key, value) {
      return MapEntry(key, value.toString());
    });

    return true;
  }

  String translate(String key) {
    return _localizedStrings[key] ?? key.replaceAll('_', ' ');
    // return _localizedStrings[key] ?? 'Unknown';
  }
}
