import 'package:flutter/material.dart';
import 'package:learflutter/components/atoms/text_subtitle_widget.dart';
import 'package:learflutter/components/atoms/title_text_widget.dart';
import 'package:learflutter/components/organisms/form_default.dart';
import 'package:learflutter/ui/viewmodels/auth_viewmodel.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  static final keyLoader = GlobalKey<State>();
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TitleTextWidget(text: "Login"),
          TextSubtitleWidget(text: 'Welcome to LearnFlutter'),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(top: 50),
              child: FormDefault(
                field: ['email', 'password'],
                icons: [
                  Icon(Icons.email_outlined),
                  Icon(Icons.vpn_key_outlined),
                ],
                obscureField: ['password'],
                submitButtonLabel: " Login ",
                onSubmit: (result) async {
                  String _email = result['email'];
                  String _password = result['password'];
                  await Provider.of<AuthViewmodel>(context, listen: false)
                      .login(_email, _password, context);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
