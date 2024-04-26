import 'package:red_dot_entertainment/common/widgets/appbar/appbar.dart';
import 'package:red_dot_entertainment/utils/constants/exports.dart';

class EImageViewer extends StatelessWidget {
  const EImageViewer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: EColors.primary,
      appBar: const EAppBar(
        leadingIconColor: EColors.secondary,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Hero(
            // tag: Get.arguments['src'],
            tag: 'hero',
            child: Image.asset(
              Get.arguments['src'],
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    );
  }
}
