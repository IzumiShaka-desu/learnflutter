
import 'package:flutter/material.dart';
import 'package:learflutter/constant/color_pallete.dart';

class ToLoginButton extends StatelessWidget {
  const ToLoginButton({
    Key key,
    @required bool isLoginPage,
    @required this.size,
    this.toLoginPage,
  })  : _isRegisterPage = isLoginPage,
        super(key: key);

  final bool _isRegisterPage;
  final Size size;
  final VoidCallback toLoginPage;
  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      left: (_isRegisterPage) ? -size.width : 0,
      top: size.height * 0.8,
      curve: Curves.bounceInOut,
      child: InkWell(
        onTap: toLoginPage,
        child: Container(
          padding: EdgeInsets.only(left: 30, top: 20, right: 20, bottom: 20),
          decoration: BoxDecoration(
              color: ColorPallete.primary,
              borderRadius:
                  BorderRadius.horizontal(right: Radius.circular(25))),
          child: Text.rich(
            TextSpan(
              children: [
                TextSpan(
                    text: ' Login',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold))
              ],
              text: 'OR ',
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w300,
                  color: Colors.white),
            ),
          ),
        ),
      ),
      duration: Duration(
        milliseconds: (_isRegisterPage) ? 10 : 500,
      ),
    );
  }
}
