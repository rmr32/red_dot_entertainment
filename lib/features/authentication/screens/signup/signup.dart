import 'package:red_dot_entertainment/common/widgets/appbar/appbar.dart';
import 'package:red_dot_entertainment/common/widgets/buttons/social_buttons.dart';
import 'package:red_dot_entertainment/common/widgets/dividers/form_divider.dart';
import 'package:red_dot_entertainment/features/authentication/screens/signup/widgets/signup_form.dart';
import 'package:red_dot_entertainment/utils/constants/exports.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: const EAppBar(showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(ESizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// --- TITLE SECTION --- ///
              Text(
                EText.authSignupTitle,
                style: width > ESizes.mobile
                    ? Theme.of(context).textTheme.headlineLarge!.copyWith(
                          color: EColors.secondary,
                          fontSize: ESizes.fontSizeHeadline * 1.5,
                        )
                    : Theme.of(context).textTheme.headlineLarge!.copyWith(
                          color: EColors.secondary,
                          fontSize: ESizes.fontSizeHeadline * 0.6,
                        ),
              ),
              const SizedBox(
                height: ESizes.spaceBtwSections,
              ),

              /// --- FORM SECTION --- ///
              const ESignupForm(),
              const SizedBox(
                height: ESizes.spaceBtwSections,
              ),

              /// Divider
              EFormDivider(dividerText: EText.authOrSignInWith.capitalize!),
              const SizedBox(
                height: ESizes.spaceBtwSections,
              ),

              /// Social Buttons
              const ESocialButtons(),
              const SizedBox(
                height: ESizes.spaceBtwSections,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
