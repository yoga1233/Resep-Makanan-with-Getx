import 'package:basic_utils/basic_utils.dart';

String changeToSenteceCase(String text) {
  String result = text.replaceAll('-', ' ');
  String capital = StringUtils.capitalize(result);
  return capital;
}

String remove(String text) {
  String result = text.substring(2);
  return result;
}
