import 'package:red_dot_entertainment/utils/constants/exports.dart';

class EFormDivider extends StatelessWidget {
  const EFormDivider({
    super.key,
    required this.dividerText,
  });

  final String dividerText;

  @override
  Widget build(BuildContext context) {
    final dark = EHelperFunctions.isDarkMode(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
          child: Divider(
            color: dark ? EColors.secondary : EColors.secondary,
            thickness: ESizes.formDividerThickness,
            indent: ESizes.formDividerIndentOne,
            endIndent: ESizes.formDividerIndentTwo,
          ),
        ),
        Text(dividerText,
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  color: EColors.secondary,
                )),
        Flexible(
          child: Divider(
            color: dark ? EColors.secondary : EColors.secondary,
            thickness: ESizes.formDividerThickness,
            indent: ESizes.formDividerIndentTwo,
            endIndent: ESizes.formDividerIndentOne,
          ),
        ),
      ],
    );
  }
}
