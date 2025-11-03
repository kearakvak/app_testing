import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';

class Profile {
  String? id;
  String? fullName;
  String? phone;
  String? birthDate;
  String? email;
  String? imageUrl;
  File? image;

  Profile({
    this.id,
    this.fullName,
    this.phone,
    this.birthDate,
    this.imageUrl,
    this.email,
    this.image,
  });

  // Convert ProfileData to Firestore Map
  Map<String, dynamic> toMap() {
    return {
      'fullName': fullName,
      'phone': phone,
      'birthDate': birthDate,
      'imageUrl': imageUrl,
      'createdAt': FieldValue.serverTimestamp(),
    };
  }

  // Create ProfileData from Firestore Document
  factory Profile.fromDocument(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return Profile(
      id: doc.id,
      fullName: data['fullName'],
      phone: data['phone'],
      birthDate: data['birthDate'],
      imageUrl: data['imageUrl'],
    );
  }
}
