 import 'package:flutter/material.dart';

void replaceScreenTo(BuildContext context, Widget destination) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (BuildContext context) => destination,
      ),
    );
  }


void goTo(BuildContext context, Widget destination) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (BuildContext context) => destination,
      ),
    );
  }

