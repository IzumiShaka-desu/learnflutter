
import 'package:flutter/material.dart';
import 'package:learflutter/constant/color_pallete.dart';

class ToRegisterPage extends StatelessWidget {
  const ToRegisterPage({
    Key key,
    @required bool isLoginPage,
    @required this.size,
    this.toRegisterPage,
  })  : _isRegisterPage = isLoginPage,
        super(key: key);

  final bool _isRegisterPage;
  final Size size;
  final VoidCallback toRegisterPage;
  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      right: (!_isRegisterPage) ? -size.width : 0,
      curve: Curves.bounceInOut,
      top: size.height * 0.8,
      child: InkWell(
        onTap: toRegisterPage,
        child: Container(
          padding: EdgeInsets.only(left: 30, top: 20, right: 20, bottom: 20),
          decoration: BoxDecoration(
            color: ColorPallete.primary,
            borderRadius: BorderRadius.horizontal(
              left: Radius.circular(25),
            ),
          ),
          child: Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: ' Register',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
              text: 'OR ',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w300,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
      duration: Duration(
        milliseconds: (!_isRegisterPage) ? 10 : 500,
      ),
    );
  }
}
