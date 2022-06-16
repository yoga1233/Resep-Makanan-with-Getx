import 'package:basic_utils/basic_utils.dart';

String parsingText(String text) {
  String result = text.replaceAll('-', ' ');
  String capital = StringUtils.capitalize(result);
  return capital;
}
