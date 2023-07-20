// ignore: file_names
import 'package:flutter/material.dart';

import '../constants.dart';

// ignore: camel_case_types
class myButton extends StatelessWidget {
  final String name;
  final Function fun;
  const myButton({super.key, required this.name, required this.fun});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              backgroundColor: kButtonColor),
          onPressed: () {
            fun();
          },
          child: Text(
            name,
            style: kStyleMediumBold,
          )),
    );
  }
}
