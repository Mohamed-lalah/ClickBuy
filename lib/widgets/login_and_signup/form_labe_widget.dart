import 'package:flutter/material.dart';

class FormLabelWidget extends StatelessWidget {
   FormLabelWidget({super.key, required this.label});
  late String label ;

  @override
  Widget build(BuildContext context) {
    return
      Text(
        label,
        style: Theme.of(context).textTheme.titleSmall,);
  }
}
