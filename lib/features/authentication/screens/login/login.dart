import 'package:red_dot_entertainment/common/widgets/appbar/appbar.dart';
import 'package:red_dot_entertainment/common/widgets/buttons/social_buttons.dart';
import 'package:red_dot_entertainment/common/widgets/dividers/form_divider.dart';
import 'package:red_dot_entertainment/features/authentication/screens/login/widgets/login_form.dart';
import 'package:red_dot_entertainment/features/authentication/screens/login/widgets/login_header.dart';
import 'package:red_dot_entertainment/utils/constants/exports.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const EAppBar(showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              /// HEADER SECTION --- ///
              const ELoginHeader(),

              /// LOGIN FORM --- ///
              const ELoginForm(),

              /// --- DIVIDER --- ///
              EFormDivider(dividerText: EText.authOrSignInWith.capitalize!),
              const SizedBox(height: ESizes.spaceBtwSections),

              /// --- FOOTER SECTION --- ///
              const ESocialButtons(),
            ],
          ),
        ),
      ),
    );
  }
}
