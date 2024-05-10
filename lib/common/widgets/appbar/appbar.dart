import 'package:red_dot_entertainment/utils/constants/exports.dart';
import 'package:red_dot_entertainment/utils/device/device_utility.dart';
import 'package:red_dot_entertainment/utils/helpers/helper_functions.dart';

class EAppBar extends StatelessWidget implements PreferredSizeWidget {
  /// Custom appbar for achieving a desired design goal.
  /// - Set [title] for a custom title.
  /// - [showBackArrow] to toggle the visibility of the back arrow.
  /// - [leadingIcon] for a custom leading icon.
  /// - [leadingOnPressed] callback for the leading icon press event.
  /// - [actions] for adding a list of action widgets.
  /// - Horizontal padding of the appbar can be customized inside this widget.
  const EAppBar({
    super.key,
    this.title,
    this.color = Colors.transparent,
    this.showBackArrow = true,
    this.showImplyLeading = false,
    this.leadingIcon,
    this.leadingIconColor,
    this.actions,
    this.leadingOnPressed,
    this.centerTitle = true,
  });

  final Widget? title;
  final Color color;
  final bool showBackArrow;
  final bool showImplyLeading;
  final IconData? leadingIcon;
  final Color? leadingIconColor;
  final List<Widget>? actions;
  final VoidCallback? leadingOnPressed;
  final bool centerTitle;

  @override
  Widget build(BuildContext context) {
    final dark = EHelperFunctions.isDarkMode(context);
    return Padding(
      padding: const EdgeInsets.only(
          top: ESizes.appBarHeight * 0.25,
          left: ESizes.appBarPaddingLeft,
          right: ESizes.appBarPaddingRight,
          bottom: 0),
      child: AppBar(
        backgroundColor: color,
        automaticallyImplyLeading: showImplyLeading,
        leading: showBackArrow
            ? IconButton(
                onPressed: () => Get.back(),
                icon: Icon(Icons.arrow_back,
                    color: leadingIconColor ??
                        (dark ? EColors.textWhite : EColors.backgroundDark)))
            : leadingIcon != null
                ? IconButton(
                    onPressed: leadingOnPressed, icon: Icon(leadingIcon))
                : null,
        title: title,
        centerTitle: centerTitle,
        actions: actions,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(EDeviceUtils.getAppBarHeight());
}
