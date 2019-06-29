import 'dart:ui';

class AppColors {
  static Color colorRed = HexColor("e41313");
  static Color colorWhite = HexColor("fff");
  static Color title = HexColor("010");
  static Color description = HexColor("222");
  static Color card_background = HexColor("#faefc9");
  static Color colorBlack = HexColor("#000");
  static Color colorGreen = HexColor("#006C6D");
  static Color colorGreenStatus = HexColor("#005454");
  static Color titleColor = HexColor("#4F4F4F");
  static Color colorBlue = HexColor("#0b70ff");
}
/*
const colorPrimary = colorGreenStatus;
const colorPrimaryDark = colorGreenStatus;
const colorAccent = colorGreenStatus;
*/

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}
