import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MyApplicationHelper {
  static void unfocus(BuildContext context) => FocusScope.of(context).requestFocus(FocusNode());

  static String formatMoneyToBr(double value) => NumberFormat("#,##0.00", "pt_BR").format(value);

  static double formatWeirdMoneyStringToDouble(String value) {
    final String formatedValue = value.replaceAll('R\$', '').replaceAll(',', '').trim();
    return double.parse(formatedValue);
  }

  static String formatDateToBr(DateTime date) => DateFormat('dd/MM/y').format(date);

  static String customDateFormat(DateTime date) {
    final param = DateTime(date.year, date.month, date.day);
    final now = DateTime.now();

    if (param == DateTime(now.year, now.month, now.day)) {
      return 'Hoje';
    } else if (param == DateTime(now.year, now.month, now.day - 1)) {
      return 'Ontem';
    } else {
      return formatDateToBr(param);
    }
  }

  static String? phraseDateFormat(DateTime date) {
    final param = DateTime(date.year, date.month, date.day);
    final now = DateTime.now();

    if (param == DateTime(now.year, now.month, now.day)) {
      return 'Hoje, ${date.day} de ${DateFormat('MMM/yy').format(date)}';
    } else if (param == DateTime(now.year, now.month, now.day + 1)) {
      return 'Amanhã, ${date.day} de ${DateFormat('MMM/yy').format(date)}';
    } else if (param == DateTime(now.year, now.month, now.day - 1)) {
      return 'Ontem, ${date.day} de ${DateFormat('MMM/yy').format(date)}';
    } else {
      return toBeginningOfSentenceCase('${DateFormat('EEE').format(date)}, ${date.day} de ${DateFormat('MMM/yy').format(date)}');
    }
  }

  static Map<String, String> formatFilterToString(Map<String, dynamic> filter) {
    if (filter == null) {
      return <String, String>{};
    }

    Map holder = {};
    filter.forEach((key, value) {
      if (value is DateTime) {
        holder[key] = DateFormat('d%2FMM%2Fy').format(value);
      } else {
        holder[key] = value;
      }
    });
    return Map<String, String>.from(holder);
  }

  static String removeDataKeyFromJson(String value) {
    var val = json.decode(value);

    if (val['data'] == null) {
      return val;
    }

    final isSingleElementList = val['data'] is List && val['data'].length == 1;
    val = isSingleElementList ? (val['data'][0] ?? Map()) : val['data'];

    if (val.length == 0) {
      val = Map();
    }

    return json.encode(val);
  }

  static String removeDataKeyFromJsonArray(String value) {
    var val = json.decode(value);
    return val['data'] == null ? val : json.encode(val['data']);
  }

  static const _daysInMonth = const [0, 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];

  static bool isLeapYear(int value) => value % 400 == 0 || (value % 4 == 0 && value % 100 != 0);

  static int daysInMonth(int year, int month) {
    var result = _daysInMonth[month];
    if (month == 2 && isLeapYear(year)) result++;
    return result;
  }

  static DateTime subtractMonths(DateTime dt, int value) {
    var r = value % 12;
    var q = (value - r) ~/ 12;
    var newYear = dt.year - q;
    var newMonth = dt.month - r;
    if (newMonth == 0) {
      newYear--;
      newMonth = 12;
    }

    var newDay = min(dt.day, daysInMonth(newYear, newMonth));
    return dt.isUtc
        ? DateTime.utc(newYear, newMonth, newDay, dt.hour, dt.minute, dt.second, dt.millisecond, dt.microsecond)
        : DateTime(newYear, newMonth, newDay, dt.hour, dt.minute, dt.second, dt.millisecond, dt.microsecond);
  }

  static delayedRequest(Future request, Duration duration) async {
    final data = await Future.wait([
      request,
      Future.delayed(duration, () {}),
    ]);
    return data[0];
  }
}
