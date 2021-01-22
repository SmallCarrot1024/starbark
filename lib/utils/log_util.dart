import 'package:logger/logger.dart';

class LogUtil {
  static Logger logger = Logger(
    printer: PrettyPrinter(methodCount: 1,printEmojis: false,printTime: true),
  );

  static void d(String tag, message) {
    logger.d(message);
  }

  static void e(String tag, message) {
    logger.d(message);
  }


  static void i(String tag, message) {
    logger.i(message);
  }


  static void v(String tag, message) {
    logger.i(message);
  }


  static void w(String tag, message) {
    logger.i(message);
  }
}
