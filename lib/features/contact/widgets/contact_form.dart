import 'package:red_dot_entertainment/common/widgets/buttons/on_hover_button.dart';
import 'package:red_dot_entertainment/features/contact/controllers/contact_controller.dart';
import 'package:red_dot_entertainment/utils/constants/exports.dart';

import 'package:red_dot_entertainment/utils/helpers/validation.dart';

class EContactForm extends StatelessWidget {
  const EContactForm({
    super.key,
    this.title = EText.name,
    this.subTitle = '',
  });

  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ContactController());
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0),
        child: Form(
          key: controller.contactFormKey,
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

              /// --- FIRST NAME --- ///
              TextFormField(
                showCursor: true,
                cursorColor: EColors.secondary,
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: EColors.secondary,
                    ),
                controller: controller.firstName,
                validator: (value) =>
                    EValidator.validateEmptyText(EText.formFirstName, value),
                decoration: const InputDecoration(
                  prefixIcon: EIcons.user,
                  labelText: EText.formHintFirstName,
                ),
              ),
              const SizedBox(height: ESizes.spaceBtwItems),

              /// --- LAST NAME --- ///
              TextFormField(
                showCursor: true,
                cursorColor: EColors.secondary,
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: EColors.secondary,
                    ),
                controller: controller.lastName,
                validator: (value) =>
                    EValidator.validateEmptyText(EText.formLastName, value),
                decoration: const InputDecoration(
                  prefixIcon: EIcons.user,
                  labelText: EText.formHintLastName,
                ),
              ),
              const SizedBox(height: ESizes.spaceBtwItems),

              /// --- Email --- ///
              TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                showCursor: true,
                cursorColor: EColors.secondary,
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: EColors.secondary,
                    ),
                controller: controller.email,
                validator: (value) => EValidator.validateEmail(value),
                decoration: const InputDecoration(
                  prefixIcon: EIcons.email,
                  labelText: EText.formHintEmail,
                ),
              ),
              const SizedBox(height: ESizes.spaceBtwItems),

              /// --- REQUEST --- ///
              TextFormField(
                // minLines: 2,
                // maxLines: 2,
                showCursor: true,
                cursorColor: EColors.secondary,
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: EColors.secondary,
                    ),
                controller: controller.request,
                validator: (value) =>
                    EValidator.validateEmptyText(EText.formRequest, value),
                decoration: const InputDecoration(
                  prefixIcon: EIcons.reason,
                  labelText: EText.formHintRequest,
                ),
              ),
              const SizedBox(height: ESizes.spaceBtwSections),
              OnHoverButton(
                controllerKey: '6',
                text: EText.buttonSubmit,
                onPressed: () {
                  controller.submitContactForm(
                      controller.firstName.text.trim(),
                      controller.lastName.text.trim(),
                      controller.email.text.trim(),
                      controller.request.text.trim());
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
