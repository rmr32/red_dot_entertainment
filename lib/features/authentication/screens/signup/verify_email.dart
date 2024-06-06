import 'package:red_dot_entertainment/common/widgets/appbar/appbar.dart';
import 'package:red_dot_entertainment/data/repositories/authentication/authentication_repository.dart';
import 'package:red_dot_entertainment/features/authentication/controllers/verify_email_controller.dart';
import 'package:red_dot_entertainment/utils/constants/animations.dart';
import 'package:red_dot_entertainment/utils/constants/exports.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key, this.email});

  final String? email;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(VerifyEmailController());
    return Scaffold(
      appBar: EAppBar(
        actions: [
          IconButton(
            onPressed: () => AuthenticationRepository.instance.logout(),
            icon: const Icon(EImages.iconClear),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(ESizes.defaultSpace),
          child: Column(
            children: [
              SizedBox(
                width: EDeviceUtils.getScreenWidth(),
                child: Column(
                  children: [
                    /// Image
                    Image(
                      image: const AssetImage(EAnimate.deliveredEmail),
                      width: EDeviceUtils.getScreenWidth() * 0.6,
                    ),
                    const SizedBox(
                      height: ESizes.spaceBtwSections,
                    ),

                    /// Title & Subtitle
                    Text(
                      EText.authConfirmEmail,
                      style: Theme.of(context).textTheme.headlineMedium,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: ESizes.spaceBtwItems,
                    ),
                    Text(
                      email ?? '',
                      style: Theme.of(context).textTheme.labelLarge,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: ESizes.spaceBtwItems,
                    ),
                    Text(
                      EText.authConfirmEmailSubTitle,
                      style: Theme.of(context).textTheme.labelMedium,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: ESizes.spaceBtwSections,
                    ),

                    /// Buttons
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () =>
                            controller.checkEmailVerificationStatus(),
                        child: const Text(
                          EText.continueText,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: ESizes.spaceBtwItems,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: TextButton(
                        onPressed: () => controller.sendEmailVerification(),
                        child: const Text(
                          EText.authResendEmail,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
