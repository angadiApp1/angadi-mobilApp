

import 'package:angadiapp/core/network/error_handler.dart';

class Failure {
  int code;
  String message;

  Failure({
    this.code = ResponseCode.DEFAULT,
    this.message = ResponseMessage.DEFAULT,
  });
}
