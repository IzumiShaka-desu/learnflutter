import 'package:flutter/material.dart';
import 'package:learflutter/constant/color_pallete.dart';

createSnackbar(String message) => SnackBar(
      duration: Duration(seconds: 3),
      backgroundColor: ColorPallete.backgroundDark,
      content: Material(
        type: MaterialType.transparency,
        child: Container(
          height: 50,
          child: Center(
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    message??"",
                    style: TextStyle(
                        fontWeight: FontWeight.w700, color: ColorPallete.backgroundLight),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
