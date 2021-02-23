
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:learflutter/components/atoms/icon_button_normal.dart';
import 'package:learflutter/components/atoms/logo_widgets.dart';
import 'package:learflutter/components/atoms/primary_button.dart';

import 'default_alert_dialog.dart';

class AppBarDefault extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: LogoWidget(),
      centerTitle: true,
      actions: [
        IconButtonNormal(
          icon: Icon(
            Icons.exit_to_app_outlined,
          ),
          onPressed: (){
            showDialog(context: context, builder: (context)=>DefaultAlertDialog(message: "apakah anda yakin akan keluar aplikasi",title: "peringatan",actions: [PrimaryButton(onPressed: ()=>Navigator.of(context).pop(),)],),);
            SystemNavigator.pop();},
        ),
      ],
    );
  }
}
