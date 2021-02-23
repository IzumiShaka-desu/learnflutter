import 'package:flutter/material.dart';
import 'package:learflutter/components/atoms/text_subtitle_widget.dart';
import 'package:learflutter/components/atoms/title_text_widget.dart';
import 'package:learflutter/components/organisms/form_default.dart';
import 'package:learflutter/ui/viewmodels/auth_viewmodel.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatelessWidget {
   static final keyLoader=GlobalKey<State>();
  @override
  Widget build(BuildContext context) {
   return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TitleTextWidget(text: "Register"),
          TextSubtitleWidget(text:'Welcome to LearnFlutter'),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(top:50),
                          child: FormDefault(
                field: ['email', 'password'],
                icons: [
                  Icon(Icons.email_outlined),
                  Icon(Icons.vpn_key_outlined),
                ],
                obscureField: ['password'],
                submitButtonLabel: " register ",
                onSubmit: (result)async {
                  String _email=result['email'];
                  String _password=result['password'];
                   await Provider.of<AuthViewmodel>(context, listen: false)
                      .register(_email, _password, context);
                 
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}