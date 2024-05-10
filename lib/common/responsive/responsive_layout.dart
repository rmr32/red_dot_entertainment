import 'package:red_dot_entertainment/common/responsive/layouts/desktop_layout.dart';
import 'package:red_dot_entertainment/common/responsive/layouts/mobile_layout.dart';
import 'package:red_dot_entertainment/common/responsive/layouts/tablet_layout.dart';
import 'package:red_dot_entertainment/utils/constants/exports.dart';

class ResponsiveLayout extends StatelessWidget {
  const ResponsiveLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < ESizes.mobile) {
          return const MobileLayout();
        } else if (constraints.maxWidth < ESizes.tablet) {
          return const DesktopLayout();
        } else {
          return const DesktopLayout();
        }
      },
    );
  }
}
