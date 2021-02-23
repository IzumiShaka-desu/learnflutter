import 'package:flutter/material.dart';
import 'package:learflutter/components/atoms/default_snackbar.dart';

showSnackbar(BuildContext context, _message) {
  ScaffoldMessenger.of(context).removeCurrentSnackBar();
  ScaffoldMessenger.of(context).showSnackBar(
    createSnackbar(
      _message,
    ),
  );
}
