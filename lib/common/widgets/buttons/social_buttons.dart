import 'package:red_dot_entertainment/features/authentication/controllers/login_controller.dart';
import 'package:red_dot_entertainment/utils/constants/exports.dart';

class ESocialButtons extends StatelessWidget {
  const ESocialButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        /// --- Google --- ///
        Container(
          padding: const EdgeInsets.all(ESizes.xs),
          decoration: BoxDecoration(
            border: Border.all(color: EColors.secondary),
            borderRadius: BorderRadius.circular(ESizes.borderRadiusXxl),
          ),
          child: IconButton(
            onPressed: () => controller.googleSignIn(),
            icon: EIcons.google,
            // icon: const Image(
            //   width: ESizes.iconMd,
            //   height: ESizes.iconMd,
            //   image: AssetImage(EImages.google),
            // ),
          ),
        ),
        const SizedBox(
          width: ESizes.spaceBtwItems,
        ),

        /// --- Facebook --- ///
        Container(
          padding: const EdgeInsets.all(ESizes.xs),
          decoration: BoxDecoration(
            border: Border.all(color: EColors.secondary),
            borderRadius: BorderRadius.circular(ESizes.borderRadiusXxl),
          ),
          child: IconButton(
            onPressed: () {},
            icon: EIcons.facebook,
            // icon: const Image(
            //   width: ESizes.iconMd,
            //   height: ESizes.iconMd,
            //   image: AssetImage(EImages.facebook),
            // ),
          ),
        ),
      ],
    );
  }
}
