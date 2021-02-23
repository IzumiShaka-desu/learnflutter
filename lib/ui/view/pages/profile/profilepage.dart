import 'package:flutter/material.dart';
import 'package:learflutter/components/atoms/logout_button.dart';
import 'package:learflutter/components/atoms/primary_button.dart';
import 'package:learflutter/components/atoms/text_subtitle_widget.dart';
import 'package:learflutter/components/molecules/default_alert_dialog.dart';
import 'package:learflutter/components/molecules/draggable_profile_container.dart';
import 'package:learflutter/components/molecules/idetity_field.dart';
import 'package:learflutter/constant/color_pallete.dart';
import 'package:learflutter/data/models/profile.dart';
import 'package:learflutter/ui/viewmodels/auth_viewmodel.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<AuthViewmodel>(
      builder: (context, provider, _) => Container(
        child: Column(
          children: [
            Expanded(
              child: Stack(
                children: [
                  Positioned.fill(
                    child: Container(),
                  ),
                  Consumer<AuthViewmodel>(
                    builder: (context, provider, _) =>
                        DraggableProfileContainer(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: IdentityField(
                            labelText: 'fullname',
                            icon: Icon(Icons.person),
                            onPressed: (text) async {
                              var _newProfile =
                                  Profile(fullname: text, id: provider.uid);
                              await provider.updateProfile(
                                  context, _newProfile);
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: IdentityField(
                            labelText: 'phone',
                            icon: Icon(Icons.phone_android),
                            type: TextInputType.phone,
                            onPressed: (text) async {
                              var _newProfile =
                                  Profile(fullname: text, id: provider.uid);
                              await provider.updateProfile(
                                  context, _newProfile);
                            },
                          ),
                        ),
                        
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            LogoutButton(
                              onPressed: () async{
                                bool isExit = await showDialog(
                context: context,
                builder: (context) => DefaultAlertDialog(
                  message: "are you sure to logout ?",
                  title: "Warning",
                  actions: [
                    PrimaryButton(
                      icon: Icon(Icons.cancel_outlined),
                      text: "No",
                      onPressed: () => Navigator.of(context).pop(false),
                    ),
                    PrimaryButton(
                      text: "Yes",
                      onPressed: () => Navigator.of(context).pop(true),
                    )
                  ],
                ),
              );
              if (isExit ?? false) {
                provider.logout(context);
              }
                              },
                              text: 'logout',
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Positioned(
                    child: Visibility(
                      replacement: SizedBox(),
                      visible: provider.profile == null,
                      child: Container(
                        height: 50,
                        width: double.infinity,
                        color: ColorPallete.primaryLight,
                        child: Center(
                          child: TextSubtitleWidget(
                            text: "please complete your profile",
                            isDark: true,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
