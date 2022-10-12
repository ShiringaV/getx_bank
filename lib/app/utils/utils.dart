import 'package:flutter/material.dart';

class Utils {
   static Widget valueToWidgetWithFound(double value, {required ThemeData theme}) {
     String fixedValue = value.toStringAsFixed(2);
     fixedValue = fixedValue.split('.').last;

     return RichText(
       text: TextSpan(
         text: '£',
         style: theme.textTheme.titleSmall,
         children: [
           TextSpan(text: value.toStringAsFixed(0), style: theme.textTheme.titleLarge),
           TextSpan(text: '.$fixedValue', style: theme.textTheme.titleSmall),
         ],
       ),
     );
  }
}