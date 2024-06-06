import 'package:red_dot_entertainment/features/authentication/controllers/login_controller.dart';
import 'package:red_dot_entertainment/features/authentication/screens/signup/signup.dart';
import 'package:red_dot_entertainment/utils/constants/exports.dart';
import 'package:red_dot_entertainment/utils/helpers/validation.dart';

class ELoginForm extends StatelessWidget {
  const ELoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Form(
      key: controller.loginFormKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: ESizes.spaceBtwSections),
        child: Column(
          children: [
            /// --- EMAIL TEXTFIELD --- ///
            TextFormField(
              showCursor: true,
              cursorColor: EColors.secondary,
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: EColors.secondary,
                  ),
              controller: controller.email,
              validator: (value) => EValidator.validateEmail(value),
              decoration: const InputDecoration(
                prefixIcon: Icon(
                  EImages.iconEmail,
                ),
                labelText: EText.formEmail,
              ),
            ),
            const SizedBox(
              height: ESizes.spaceBtwInputFields,
            ),

            /// --- PASSWORD TEXTFIELD --- ///
            Obx(
              () => TextFormField(
                showCursor: true,
                cursorColor: EColors.secondary,
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: EColors.secondary,
                    ),
                controller: controller.password,
                validator: (value) => EValidator.validatePassword(value),
                expands: false,
                obscureText: controller.hidePassword.value,
                decoration: InputDecoration(
                    labelText: EText.formPassword,
                    prefixIcon: const Icon(EImages.iconPassword),
                    suffixIcon: IconButton(
                        onPressed: () => controller.hidePassword.value =
                            !controller.hidePassword.value,
                        icon: Icon(controller.hidePassword.value
                            ? EImages.iconHidePassword
                            : EImages.iconShowPassword))),
              ),
            ),

            const SizedBox(
              height: ESizes.spaceBtwInputFields / 2,
            ),

            /// --- REMEMBER ME / FORGOT PASSWORD SECTIONM --- ///
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                /// --- REMEMBER ME --- ///
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Obx(
                      () => Checkbox(
                          value: controller.rememberMe.value,
                          onChanged: (value) => controller.rememberMe.value =
                              !controller.rememberMe.value),
                    ),
                    const Text(EText.authRememberMe),
                  ],
                ),

                /// --- FORGOT PASSWORD --- ///
                TextButton(
                  onPressed: () {},
                  // onPressed: () => Get.to(() => const ForgotPassword()),
                  child: const Text(
                    EText.authForgotPassword,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: ESizes.spaceBtwSections,
            ),

            /// --- LOGIN BUTTON --- ///
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => controller.emailAndPasswordSignIn(),
                child: const Text(
                  EText.authSignIn,
                ),
              ),
            ),
            const SizedBox(
              height: ESizes.spaceBtwItems,
            ),

            /// --- SIGNUP BUTTON --- ///
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () => Get.to(() => const SignupScreen()),
                child: Text(
                  EText.authCreateAccount,
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: EColors.secondary,
                      ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
