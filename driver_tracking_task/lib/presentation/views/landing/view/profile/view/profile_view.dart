import 'package:driver_tracking_task/core/constants/dimens.dart';
import 'package:driver_tracking_task/core/extensions/box_extensions.dart';
import 'package:driver_tracking_task/core/extensions/context_extension.dart';
import 'package:driver_tracking_task/presentation/views/auth/view/login_view.dart';
import 'package:flutter/material.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _LandingViewState();
}

class _LandingViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBody: true,
        body: SafeArea(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: Dimens.paddingPageHorizontal * 3,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  context.box.emptySizedHeightBoxHigh,
                  const CircleAvatar(
                    maxRadius: 50,
                    backgroundColor: Colors.black,
                    child: Icon(
                      Icons.person_outline,
                      color: Colors.white,
                    ),
                  ),
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                        text: 'Buğra Aykan\n',
                        style: context.theme.textTheme.titleLarge?.copyWith(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                        ),
                        children: [
                          TextSpan(
                              text: 'Şoför',
                              style:
                                  context.theme.textTheme.titleMedium?.copyWith(
                                fontWeight: FontWeight.w200,
                              ))
                        ]),
                  ),
                  const SpTextFormField(
                    hintText: 'E-posta',
                  ),
                  const SpTextFormField(
                    hintText: 'Telefon Numarası',
                  ),
                  ElevatedButton(
                      onPressed: () {}, child: const Text('Güncelle')),
                  context.box.emptySizedHeightBoxHigh,
                ],
              ),
            ),
          ),
        ));
  }
}
