import 'package:driver_tracking_task/core/constants/dimens.dart';
import 'package:driver_tracking_task/core/extensions/box_extensions.dart';
import 'package:driver_tracking_task/core/extensions/context_extension.dart';
import 'package:flutter/material.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: SizedBox(
              width: context.mediaQuerySize.width * 0.75,
              height: context.mediaQuerySize.height * 0.4,
              child: Card(
                margin: const EdgeInsets.all(
                  Dimens.marginTile,
                ),
                child: Form(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: Dimens.paddingPageHorizontal,
                        vertical: Dimens.paddingPageVertical),
                    child: Column(
                      children: [
                        context.box.emptySizedHeightBoxLow3x,
                        Expanded(
                          child: Text('Giriş Yap',
                              style: context.theme.textTheme.titleLarge),
                        ),
                        const Expanded(
                          child: SpTextFormField(
                            hintText: 'Email',
                          ),
                        ),
                        const Expanded(
                          child: SpTextFormField(
                            hintText: 'Şifre',
                          ),
                        ),
                        Flexible(
                          child: ElevatedButton(
                              onPressed: () {}, child: const Text('Giriş Yap')),
                        ),
                        context.box.emptySizedHeightBoxLow3x,
                      ],
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class SpTextFormField extends StatelessWidget {
  const SpTextFormField({
    this.controller,
    this.formKey,
    this.hintText,
    this.maxLine,
    super.key,
  });
  final String? hintText;
  final Key? formKey;
  final TextEditingController? controller;
  final int? maxLine;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      maxLines: maxLine,
      key: key,
      decoration: InputDecoration(
        hintText: hintText,
      ),
    );
  }
}
