import 'package:flutter/material.dart';

final appbar = AppBar();
final appbarHeight = appbar.preferredSize.height;

extension MediaQueryValues on BuildContext {
  double get width => MediaQuery.of(this).size.width;
  double get height => MediaQuery.of(this).size.height;
}
