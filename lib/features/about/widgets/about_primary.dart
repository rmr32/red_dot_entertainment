import 'package:flutter/material.dart';
import 'package:red_dot_entertainment/utils/constants/exports.dart';

class AboutPrimary extends StatelessWidget {
  const AboutPrimary({super.key});

  @override
  Widget build(BuildContext context) {
    double width = EDeviceUtils.getScreenWidth();
    final isMobile = width < ESizes.mobile;
    return Center(
      child: SingleChildScrollView(
        child: Column(
          children: [
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                style: isMobile
                    ? Theme.of(context).textTheme.bodyLarge!.copyWith(
                          color: EColors.secondary,
                        )
                    : Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: EColors.secondary,
                        ),
                children: const <TextSpan>[
                  TextSpan(
                    text: EText.homeSubtext2,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ).animate().fadeIn(duration: 750.ms, curve: Curves.easeIn);
  }
}
