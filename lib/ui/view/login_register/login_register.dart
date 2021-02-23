import 'package:flutter/material.dart';
import 'package:learflutter/components/atoms/toLoginButton.dart';
import 'package:learflutter/components/atoms/toRegisterButton.dart';
import 'package:learflutter/ui/view/pages/login/login_page.dart';
import 'package:learflutter/ui/view/pages/register/register_page.dart';

class LoginRegister extends StatefulWidget {
  @override
  _LoginRegisterState createState() => _LoginRegisterState();
}

class _LoginRegisterState extends State<LoginRegister> {
  bool _isRegisterPage = false;
  PageController _pageController;
  List<Widget> _pages = [
    LoginPage(),
    RegisterPage(),
  ];
  @override
  void initState() {
    _pageController = PageController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Stack(
          children: [
            Positioned.fill(
              child: PageView.builder(
                controller: _pageController,
                itemCount: _pages.length,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) => _pages[index],
              ),
            ),
            ToLoginButton(
              isLoginPage: !_isRegisterPage,
              size: size,
              toLoginPage: toRegisterPage,
            ),
            ToRegisterPage(
              isLoginPage: !_isRegisterPage,
              size: size,
              toRegisterPage: toLoginPage,
            ),
          ],
        ),
      ),
    );
  }

  void toLoginPage() {
    setState(() {
      _isRegisterPage = true;
      _pageController.animateToPage(
        1,
        duration: Duration(milliseconds: 350),
        curve: Curves.fastOutSlowIn,
      );
    });
  }

  void toRegisterPage() {
    setState(() {
      _isRegisterPage = false;
      _pageController.animateToPage(0,
          duration: Duration(milliseconds: 350), curve: Curves.fastOutSlowIn);
    });
  }
}
