import 'package:parallax_cards/parallax_cards.dart';
import 'package:red_dot_entertainment/features/gallery/widgets/image_viewer.dart';
import 'package:red_dot_entertainment/utils/constants/exports.dart';
import 'package:red_dot_entertainment/utils/device/device_utility.dart';

class GalleryScreen extends StatelessWidget {
  GalleryScreen({super.key});
  final List<String> imagesList = [
    EImages.studio1,
    EImages.studio2,
    EImages.studio3,
    EImages.studio1,
    EImages.studio2,
    EImages.studio3,
    EImages.studio1,
    EImages.studio2,
    EImages.studio3,
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        maxWidth: MediaQuery.of(context).size.width,
        maxHeight: MediaQuery.of(context).size.height,
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          double height = constraints.maxHeight;
          double width = constraints.maxWidth;
          return SizedBox(
            // width: width,
            height: height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ParallaxCards(
                  margin: const EdgeInsets.symmetric(horizontal: 30),
                  scrollDirection: Axis.horizontal,
                  imagesList: imagesList,
                  width: 250,
                  height: height * 0.7,
                  onTap: (index) {
                    Get.to(
                      () => const EImageViewer(),
                      transition: Transition.fadeIn,
                      // duration: const Duration(seconds: 3),
                      arguments: {'src': imagesList[index]},
                    );
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
