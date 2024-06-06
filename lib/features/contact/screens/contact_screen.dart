import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hovering/hovering.dart';
import 'package:lottie/lottie.dart';
import 'package:red_dot_entertainment/common/widgets/buttons/on_hover_button.dart';
import 'package:red_dot_entertainment/common/widgets/containers/custom_card.dart';
import 'package:red_dot_entertainment/features/contact/widgets/contact_form.dart';
import 'package:red_dot_entertainment/features/contact/widgets/contact_info.dart';
import 'package:red_dot_entertainment/features/contact/widgets/google_map.dart';
import 'package:red_dot_entertainment/utils/constants/animations.dart';
import 'package:red_dot_entertainment/utils/constants/exports.dart';
import 'package:red_dot_entertainment/utils/popups/loaders.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Column(
      children: [
        Lottie.asset(
          EAnimate.sectionDividerRed,
          // width: width,
          // repeat: true,
          // fit: BoxFit.fitWidth,
        ),
        Image.asset(
          'assets/images/soundwave_large.gif',
          repeat: ImageRepeat.repeatX,
          width: width,
          height: 50,
        ),
        // const Divider(
        //   color: EColors.secondary,
        // ),
        const SizedBox(height: ESizes.spaceBtwSections),
        Padding(
          padding: width < ESizes.mobile
              ? const EdgeInsets.symmetric(horizontal: 30.0)
              : const EdgeInsets.only(left: 30.0, right: 30, bottom: 30),
          child: SizedBox(
            width: width < ESizes.mobile
                ? width * 0.7
                : width < ESizes.tablet
                    ? width * 0.8
                    : width * 0.5,
            child: GridView(
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: width > ESizes.mobile ? 2 : 1),
              children: const [
                ECard(child: GoogleMapWidget()),
                ContactInfo(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
