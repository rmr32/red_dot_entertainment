import 'package:red_dot_entertainment/utils/constants/exports.dart';
import 'package:red_dot_entertainment/utils/device/device_utility.dart';

class HeroScreen extends StatelessWidget {
  const HeroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double height = EDeviceUtils.getScreenHeight();
    double width = EDeviceUtils.getScreenWidth();
    return Stack(
      children: [
        Container(
          height: height - 100,
          foregroundDecoration: const BoxDecoration(
              gradient: LinearGradient(colors: [
            EColors.primary,
            Colors.transparent,
            EColors.primary
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              image: const DecorationImage(
                  image: AssetImage(EImages.bg), fit: BoxFit.cover),
            ),
          ),
        ),
        Positioned(
            bottom: 50,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                /// --- Pricing--- ///

                Text(EText.pricehour1,
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(color: EColors.secondary)),
                const SizedBox(height: ESizes.spaceBtwItems),
                Text(EText.pricehour4,
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(color: EColors.secondary)),
                const SizedBox(height: ESizes.spaceBtwItems),
                Text(
                  EText.pricehour8,
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(color: EColors.secondary),
                ),

                const SizedBox(height: ESizes.spaceBtwSections),
              ],
            ))
      ],
    );
  }
}

// return Container(
//       height: height - 100,
//       foregroundDecoration: const BoxDecoration(
//           gradient: LinearGradient(
//               colors: [EColors.primary, Colors.transparent, EColors.primary],
//               begin: Alignment.topCenter,
//               end: Alignment.bottomCenter)),
//       child: Container(
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(30),
//           image: const DecorationImage(
//               image: AssetImage(EImages.bg), fit: BoxFit.cover),
//         ),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.end,
//           children: [
//             ECard(
//               child: Padding(
//                 padding: const EdgeInsets.symmetric(
//                     horizontal: ESizes.md, vertical: ESizes.sm),
//                 child: Text(EText.priceDiscount,
//                     textAlign: TextAlign.center,
//                     style: Theme.of(context)
//                         .textTheme
//                         .titleSmall!
//                         .copyWith(color: EColors.secondary)),
//               ),
//             ),
//             const SizedBox(height: ESizes.spaceBtwItems),
//             Row(
//               children: [
//                 /// --- Pricing--- ///

//                 Text(EText.pricehour1,
//                     textAlign: TextAlign.center,
//                     style: Theme.of(context)
//                         .textTheme
//                         .titleLarge!
//                         .copyWith(color: EColors.secondary)),
//                 const SizedBox(height: ESizes.spaceBtwItems),
//                 Text(EText.pricehour4,
//                     textAlign: TextAlign.center,
//                     style: Theme.of(context)
//                         .textTheme
//                         .titleLarge!
//                         .copyWith(color: EColors.secondary)),
//                 const SizedBox(height: ESizes.spaceBtwItems),
//                 Text(EText.pricehour8,
//                         textAlign: TextAlign.center,
//                         style: Theme.of(context)
//                             .textTheme
//                             .titleLarge!
//                             .copyWith(color: EColors.secondary))
//                     .animate()
//                     .fade(duration: 2000.ms),

//                 const SizedBox(height: ESizes.spaceBtwSections),
//               ],
//             )
//           ],
//         ),
//       ),
//     );