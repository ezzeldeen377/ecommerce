import 'package:ecommerce/core/resources/font_manager.dart';
import 'package:flutter/painting.dart';

TextStyle getTextStyle(double size, FontWeight fontWeight, Color color) {
  return TextStyle(
      fontSize: size,
      fontWeight: fontWeight,
      fontFamily: FontFamily.poppins,
      color: color);
}

TextStyle getLightStyle({double size = FontSize.s12, required Color color}) {
  return getTextStyle(size, FontWeightManager.light, color);
}

TextStyle getRegularStyle({double size = FontSize.s12, required Color color}) {
  return getTextStyle(size, FontWeightManager.regular, color);
}

TextStyle getMediumStyle({double size = FontSize.s12, required Color color}) {
  return getTextStyle(size, FontWeightManager.medium, color);
}

TextStyle getSemiBoldStyle({double size = FontSize.s12, required Color color}) {
  return getTextStyle(size, FontWeightManager.semiBold, color);
}

TextStyle getBoldStyle({double size = FontSize.s12, required Color color}) {
  return getTextStyle(size, FontWeightManager.bold, color);
}
