import 'package:flutter/material.dart';

class MyWidgetHelper {
  static bool checkMiddleElement(index, rowElementsCount) {
    final firstRowElement = 0;
    final lastFirstRowElement = rowElementsCount - 1;
    final int currentRow = index ~/ rowElementsCount.ceil();

    return ![firstRowElement + (rowElementsCount * currentRow), lastFirstRowElement + (rowElementsCount * currentRow)].contains(index);
  }
}
