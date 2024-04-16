import 'package:red_dot_entertainment/common/controllers/on_hover_button_controller.dart';
import 'package:red_dot_entertainment/utils/constants/exports.dart';
import 'package:red_dot_entertainment/utils/device/device_utility.dart';

class OnHoverButton extends StatelessWidget {
  const OnHoverButton({
    super.key,
    this.text = 'Click Here',
    this.onPressed,
    this.controllerKey = '1',
  });

  final String text;
  final VoidCallback? onPressed;
  final String controllerKey;

  @override
  Widget build(BuildContext context) {
    final controller = OnHoverButtonController.instance;

    return MouseRegion(
      onEnter: (_) => controller.onEnter(controllerKey),
      onExit: (_) => controller.onExit(controllerKey),
      child: Obx(
        () => ElevatedButton(
          onHover: (value) {},
          onPressed: onPressed,
          style: ButtonStyle(
            minimumSize: EDeviceUtils.isPortraitOrientation(context)
                ? MaterialStateProperty.all(
                    Size(EDeviceUtils.getScreenHeight() * 0.8, 0))
                : MaterialStateProperty.all(
                    Size(EDeviceUtils.getScreenWidth() * 0.5, 0)),
            animationDuration: const Duration(seconds: 1),
            backgroundColor: MaterialStateProperty.all<Color>(
              controller.isHovered[controllerKey]?.value ?? false
                  ? EColors.secondary
                  : EColors.accent,
            ),
          ),
          child: Text(
            text,
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  color: controller.isHovered[controllerKey]?.value ?? false
                      ? EColors.textPrimary
                      : EColors.textWhite,
                ),
          ),
        ),
      ),
    );
  }
}

// TODO: Change this to animate need to update the below with GET
// import 'package:flutter/material.dart';

//import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// void main() {
//   runApp(MyApp());
// }

// class ButtonController extends GetxController {
//   var isHovered = false.obs;

//   void onEnter() {
//     isHovered.value = true;
//   }

//   void onExit() {
//     isHovered.value = false;
//   }
// }

// class MyApp extends StatelessWidget {
//   final ButtonController _buttonController = Get.put(ButtonController());

//   @override
//   Widget build(BuildContext context) {
//     return GetMaterialApp(
//       home: Scaffold(
//         body: Center(
//           child: AnimatedButton(),
//         ),
//       ),
//     );
//   }
// }

// class AnimatedButton extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         // Handle button tap
//       },
//       child: MouseRegion(
//         onEnter: (_) => Get.find<ButtonController>().onEnter(),
//         onExit: (_) => Get.find<ButtonController>().onExit(),
//         child: Obx(() {
//           final isHovered = Get.find<ButtonController>().isHovered.value;
//           return AnimatedContainer(
//             duration: Duration(milliseconds: 200),
//             padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
//             decoration: BoxDecoration(
//               color: isHovered ? Colors.blueAccent : Colors.blue,
//               borderRadius: BorderRadius.circular(8),
//             ),
//             child: Text(
//               'Animate Me',
//               style: TextStyle(
//                 fontSize: 20,
//                 color: Colors.white,
//               ),
//             ),
//           );
//         }),
//       ),
//     );
//   }
// }
