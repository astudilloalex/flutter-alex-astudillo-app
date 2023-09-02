import 'package:alex_astudillo/app/app_asset.dart';
import 'package:alex_astudillo/ui/pages/forgot_password/widgets/forgot_password_form_container.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class ForgotPasswordDesktopPage extends StatelessWidget {
  const ForgotPasswordDesktopPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      alignment: Alignment.center,
      children: [
        CarouselSlider(
          items: [
            Image.asset(
              AppAsset.businessFutureCarousel,
              fit: BoxFit.cover,
              width: MediaQuery.of(context).size.width,
            ),
            Image.asset(
              AppAsset.circleFutureCarousel,
              fit: BoxFit.cover,
              width: MediaQuery.of(context).size.width,
            ),
            Image.asset(
              AppAsset.spaceshipFutureCarousel,
              fit: BoxFit.cover,
              width: MediaQuery.of(context).size.width,
            ),
          ],
          options: CarouselOptions(
            height: MediaQuery.of(context).size.height,
            autoPlay: true,
            viewportFraction: 1.0,
          ),
        ),
        Positioned(
          child: ColoredBox(color: Theme.of(context).hintColor),
        ),
        Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: 400.0,
              maxHeight: 400.0,
            ),
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).canvasColor,
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: const ForgotPasswordFormContainer(),
            ),
          ),
        ),
      ],
    );
  }
}
