import 'package:red_dot_entertainment/utils/constants/exports.dart';

class RoundedContainer extends StatelessWidget {
  const RoundedContainer(
      {super.key,
      this.text = '',
      this.color = EColors.accent,
      required this.child});

  final Color color;
  final String text;
  // final TextSpan child;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 1),
      child: child,
      // child: RichText(text: child),
    );
  }
}

// To use in a RichText/TextSpan

                    // WidgetSpan(
                    //   alignment: PlaceholderAlignment.baseline,
                    //   baseline: TextBaseline.alphabetic,
                    //   child: RoundedContainer(
                    //     child: Text(EText.aboutSubtextHighlight3.toUpperCase(),
                    //         style: Theme.of(context).textTheme.titleMedium),
                    //   ),
                    // ),