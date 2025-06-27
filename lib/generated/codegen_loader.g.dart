// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes, avoid_renaming_method_parameters, constant_identifier_names

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader{
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>?> load(String path, Locale locale) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String,dynamic> _en = {
  "salom": "hello"
};
static const Map<String,dynamic> _ru = {
  "salom": "ывавы"
};
static const Map<String,dynamic> _uz = {
  "salom": "salom"
};
static const Map<String, Map<String,dynamic>> mapLocales = {"en": _en, "ru": _ru, "uz": _uz};
}
