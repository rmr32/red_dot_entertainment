import 'package:red_dot_entertainment/common/widgets/buttons/on_hover_button.dart';
import 'package:red_dot_entertainment/features/contact/controllers/contact_controller.dart';
import 'package:red_dot_entertainment/features/contact/controllers/subscribe_controller.dart';
import 'package:red_dot_entertainment/utils/constants/exports.dart';
import 'package:red_dot_entertainment/utils/helpers/validation.dart';
import 'package:red_dot_entertainment/utils/popups/loaders.dart';

class ESubscribeForm extends StatelessWidget {
  const ESubscribeForm({
    super.key,
    this.title = EText.name,
    this.subTitle = '',
  });

  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SubscribeController());

    return Form(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      key: controller.subscribeFormKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            textAlign: TextAlign.center,
            title,
            style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                  color: EColors.secondary,
                  fontSize: ESizes.fontSizeHeadline,
                ),
          ),
          Text(
            textAlign: TextAlign.center,
            subTitle,
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: EColors.secondary,
                ),
          ),
          const SizedBox(height: ESizes.spaceBtwItems),

          /// --- Email --- ///
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
              labelText: EText.formHintEmail,
            ),
          ),

          const SizedBox(height: ESizes.spaceBtwSections),
          OnHoverButton(
            controllerKey: '6',
            text: EText.buttonSubmit,
            onPressed: () {
              controller.joinSubscription(controller.email.text.trim());
              // controller.resetFormFields();
            },
          )
        ],
      ),
    );
  }
}
