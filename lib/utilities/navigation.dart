import 'package:flutter/material.dart';

void navigationpush(
    {required final Widget widget, required final BuildContext context}) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => widget));
}

void navigationpop({required final BuildContext context}) {
  Navigator.pop(context);
}
