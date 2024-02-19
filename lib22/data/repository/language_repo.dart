import 'package:flutter/material.dart';
import '../../../lib22/data/model/response/language_model.dart';
import '../../../lib22/util/app_constants.dart';

class LanguageRepo {
  List<LanguageModel> getAllLanguages({BuildContext? context}) {
    return AppConstants.languages;
  }
}
