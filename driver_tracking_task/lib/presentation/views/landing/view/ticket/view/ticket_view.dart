import 'package:driver_tracking_task/core/constants/dimens.dart';
import 'package:driver_tracking_task/core/extensions/box_extensions.dart';
import 'package:driver_tracking_task/core/extensions/context_extension.dart';
import 'package:driver_tracking_task/presentation/views/auth/view/login_view.dart';
import 'package:flutter/material.dart';

class TicketView extends StatefulWidget {
  const TicketView({super.key});

  @override
  State<TicketView> createState() => _LandingViewState();
}

class _LandingViewState extends State<TicketView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBody: true,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: Dimens.paddingPageHorizontal * 3,
                ),
                child: Column(
                  children: [
                    context.box.emptySizedHeightBoxHigh,
                    context.box.emptySizedHeightBoxHigh,
                    Align(
                      alignment: Alignment.centerLeft,
                      child: RichText(
                        text: TextSpan(
                            text: 'Destek Talebinde Bulunun\n',
                            style: context.theme.textTheme.titleLarge?.copyWith(
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                            ),
                            children: [
                              TextSpan(
                                  text: 'Bir TicketOluştur',
                                  style: context.theme.textTheme.titleMedium
                                      ?.copyWith(
                                    fontWeight: FontWeight.w200,
                                  ))
                            ]),
                      ),
                    ),
                    context.box.emptySizedHeightBoxNormal,
                    const SpTextFormField(
                      hintText: 'Başlık',
                    ),
                    context.box.emptySizedHeightBoxLow3x,
                    const SpTextFormField(
                      hintText: 'İçerik',
                      maxLine: 6,
                    ),
                    context.box.emptySizedHeightBoxNormal,
                    ElevatedButton(
                        onPressed: () {}, child: const Text('Gönder')),
                    context.box.emptySizedHeightBoxHigh,
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
