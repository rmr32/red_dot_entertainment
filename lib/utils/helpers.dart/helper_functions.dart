import 'package:red_dot_entertainment/utils/constants/exports.dart';
// import 'package:intl/intl.dart';

class EHelperFunctions {
  // static Color? getColor(String value) {
  //   if (value == EText.green) {
  //     return EColors.green;
  //   } else if (value == EText.green) {
  //     return EColors.green;
  //   } else if (value == EText.red) {
  //     return EColors.red;
  //   } else if (value == EText.blue) {
  //     return EColors.blue;
  //   } else {
  //     return null;
  //   }
  // }

  static void navigateToScreen(BuildContext context, Widget screen) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => screen),
    );
  }

  static String truncateText(String text, int maxLength) {
    if (text.length <= maxLength) {
      return text;
    } else {
      return '${text.substring(0, maxLength)}...';
    }
  }

  static bool isDarkMode(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark;
  }

  // static String getFormattedDate(DateTime date,
  //     {String format = 'dd MMM yyyy'}) {
  //   return DateFormat(format).format(date);
  // }

  static String getFormattedTime(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final hours = twoDigits(duration.inHours);
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return [if (duration.inHours > 0) hours, minutes, seconds].join(':');
  }

  static List<E> removeDuplicates<E>(List<E> list) {
    return list.toSet().toList();
  }

  static List<Widget> wrapWidgets(List<Widget> widgets, int rowSize) {
    final wrappedList = <Widget>[];
    for (var i = 0; i < widgets.length; i += rowSize) {
      final rowChildren = widgets.sublist(
          i, i + rowSize > widgets.length ? widgets.length : i + rowSize);
      wrappedList.add(Row(children: rowChildren));
    }
    return wrappedList;
  }
}
