import 'package:ecommerce/core/resources/font_manager.dart';
import 'package:flutter/painting.dart';

TextStyle getTextStyle(double size, FontWeight fontWeight, Color color,{TextDecoration decoration=TextDecoration.none}) {
  return TextStyle(
      fontSize: size,
      fontWeight: fontWeight,
      fontFamily: FontFamily.poppins,
      color: color,
    decoration: decoration
  );
}

TextStyle getLightStyle({double size = FontSize.s12, required Color color,TextDecoration decoration=TextDecoration.none}) {
  return getTextStyle(size, FontWeightManager.light, color,decoration: decoration);
}

TextStyle getRegularStyle({double size = FontSize.s12, required Color color,TextDecoration decoration=TextDecoration.none}) {
  return getTextStyle(size, FontWeightManager.regular, color,decoration: decoration);
}

TextStyle getMediumStyle({double size = FontSize.s12, required Color color,TextDecoration decoration=TextDecoration.none}) {
  return getTextStyle(size, FontWeightManager.medium, color,decoration: decoration);
}

TextStyle getSemiBoldStyle({double size = FontSize.s12, required Color color,TextDecoration decoration=TextDecoration.none}) {
  return getTextStyle(size, FontWeightManager.semiBold, color,decoration: decoration);
}

TextStyle getBoldStyle({double size = FontSize.s12, required Color color,TextDecoration decoration=TextDecoration.none}) {
  return getTextStyle(size, FontWeightManager.bold, color,decoration: decoration);
}
