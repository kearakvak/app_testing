import 'dart:io';

import 'package:app_tesing/models/data_register.dart';
import 'package:flutter/material.dart';

class DataHandlingLocal extends ChangeNotifier {
  DataRegister? _registerData;

  DataRegister? get registerData => _registerData;

  set registerData(DataRegister? regData) {
    _registerData = regData;
    notifyListeners();
  }

  // ✅ safely update image field and notify UI
  void updateImage(File? imageFile) {
    if (_registerData != null) {
      _registerData = DataRegister(
        dataLogin: _registerData!.dataLogin,
        otp: _registerData!.otp,
        phoneNumber: _registerData!.phoneNumber,
        image: imageFile,
      );
      notifyListeners(); // <--- This is the key!
    } else {
      // If _registerData is null, initialize it
      _registerData = DataRegister(image: imageFile);
      notifyListeners();
    }
  }

  void cleanRegisterData() {
    _registerData = null;
    notifyListeners();
  }

  // set image(File? img) {
  //   _image = img;
  //   notifyListeners();
  // }
}
