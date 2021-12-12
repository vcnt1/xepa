import 'package:flutter/foundation.dart';
import 'package:xepa/app/config/enums.dart';

class MyError implements Exception {
  final ErrorType type;
  final String? errorMessage;

  MyError({
    required this.type,
    this.errorMessage,
  }) {
    if (kDebugMode) {
      print(errorMessage);
    }
  }

  String errMsg() => errorMessage ?? type.message;
}