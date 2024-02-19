import 'package:flutter/material.dart';
import 'package:sokosellers/data/model/response/language_model.dart';
import 'package:sokosellers/util/app_constants.dart';

class LanguageRepo {
  List<LanguageModel> getAllLanguages({BuildContext? context}) {
    return AppConstants.languages;
  }
}
