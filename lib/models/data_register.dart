import 'dart:io';

import 'package:app_tesing/models/data_login.dart';

class DataRegister {
  // final DataLogin? dataLogin;
  List<String>? otp;
  String? phoneNumber;
  File? image;
  // final String? confirmPassword;
  DataRegister({
    // this.dataLogin,
    this.otp,
    this.phoneNumber,
    this.image,
    // this.confirmPassword,
  });
}
