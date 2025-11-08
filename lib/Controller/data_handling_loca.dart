import 'dart:io';
import 'package:flutter/material.dart';
import 'package:app_tesing/models/profile.dart';

class DataHandlingLocal extends ChangeNotifier {
  Profile? _profile;

  Profile? get profileData => _profile;

  /// Replace entire profile
  set profileData(Profile? profile) {
    _profile = profile;
    notifyListeners();
  }

  /// ✅ Update using full Profile object
  void updateProfile(Profile profile) {
    if (_profile == null) {
      _profile = profile;
    } else {
      _profile!
        ..fullName = profile.fullName ?? _profile!.fullName
        ..phone = profile.phone ?? _profile!.phone
        ..birthDate = profile.birthDate ?? _profile!.birthDate
        ..email = profile.email ?? _profile!.email
        ..imageUrl = profile.imageUrl ?? _profile!.imageUrl
        ..image = profile.image ?? _profile!.image;
    }
    notifyListeners();
  }

  /// ✅ Update only specific fields (builder style) - FIXED: return void
  void update({
    String? fullName,
    String? phone,
    String? birthDate,
    String? email,
    String? imageUrl,
    File? image,
  }) {
    _profile ??= Profile();

    if (fullName != null) _profile!.fullName = fullName;
    if (phone != null) _profile!.phone = phone;
    if (birthDate != null) _profile!.birthDate = birthDate;
    if (email != null) _profile!.email = email;
    if (imageUrl != null) _profile!.imageUrl = imageUrl;
    if (image != null) _profile!.image = image;

    notifyListeners();
  }

  /// ✅ Clear local profile
  void clear() {
    _profile = null;
    notifyListeners();
  }
}
