import 'package:red_dot_entertainment/features/authentication/controllers/signup_controller.dart';
import 'package:red_dot_entertainment/features/authentication/screens/signup/widgets/terms_conditions_checkbox.dart';
import 'package:red_dot_entertainment/utils/constants/exports.dart';
import 'package:red_dot_entertainment/utils/helpers/validation.dart';

class ESignupForm extends StatelessWidget {
  const ESignupForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignupController());
    return Form(
      key: controller.signupFormKey,
      child: Column(
        children: [
          const SizedBox(height: ESizes.spaceBtwSections),
          Row(
            children: [
              /// --- FIRST NAME TEXTFIELD --- ///
              Expanded(
                child: TextFormField(
                  showCursor: true,
                  cursorColor: EColors.secondary,
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: EColors.secondary,
                      ),
                  controller: controller.firstName,
                  validator: (value) =>
                      EValidator.validateEmptyText(EText.formFirstName, value),
                  expands: false,
                  decoration: const InputDecoration(
                    labelText: EText.formFirstName,
                    prefixIcon: Icon(EImages.iconUser),
                  ),
                ),
              ),

              const SizedBox(
                width: ESizes.spaceBtwInputFields,
              ),

              /// --- LAST NAME TEXTFIELD --- ///
              Expanded(
                child: TextFormField(
                  showCursor: true,
                  cursorColor: EColors.secondary,
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: EColors.secondary,
                      ),
                  controller: controller.lastName,
                  validator: (value) =>
                      EValidator.validateEmptyText(EText.formLastName, value),
                  expands: false,
                  decoration: const InputDecoration(
                    labelText: EText.formLastName,
                    prefixIcon: Icon(EImages.iconUser),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: ESizes.spaceBtwInputFields,
          ),

          // ///Username
          // TextFormField(
          //   controller: controller.username,
          //   validator: (value) =>
          //       EValidator.validateEmptyText(EText.username, value),
          //   // TODO: Verify Validator
          //   // validator: TValidator.validateUsername,
          //   expands: false,
          //   decoration: const InputDecoration(
          //     labelText: EText.username,
          //     prefixIcon: Icon(Icons.co_present_outlined),
          //   ),
          // ),
          // const SizedBox(
          //   height: ESizes.spaceBtwInputFields,
          // ),

          /// --- EMAIL TEXTFIELD --- ///
          TextFormField(
            showCursor: true,
            cursorColor: EColors.secondary,
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: EColors.secondary,
                ),
            controller: controller.email,
            validator: (value) => EValidator.validateEmail(value),
            // TODO: Verify Validator
            // validator: TValidator.validateEmail,
            // expands: false,
            decoration: const InputDecoration(
              labelText: EText.formEmail,
              prefixIcon: Icon(EImages.iconEmail),
            ),
          ),
          const SizedBox(
            height: ESizes.spaceBtwInputFields,
          ),

          /// --- PHONE NUMBER TEXTFIELD --- ///
          TextFormField(
            showCursor: true,
            cursorColor: EColors.secondary,
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: EColors.secondary,
                ),
            controller: controller.phoneNumber,
            validator: (value) => EValidator.validatePhoneNumber(value),
            decoration: const InputDecoration(
              labelText: EText.formPhone,
              prefixIcon: Icon(EImages.iconPhone),
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
            height: ESizes.spaceBtwSections,
          ),

          /// --- TERMS AND CONDITIONS CHECKBOX --- ///
          const ETermsAndConditionsCheckbox(),
          const SizedBox(
            height: ESizes.spaceBtwSections,
          ),

          /// --- SIGNUP BUTTON --- ///
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () => controller.signup(),
              child: const Text(
                EText.authCreateAccount,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
