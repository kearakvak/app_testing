import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:app_tesing/models/profile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirestoreService {
  // Reference to 'orders' collection
  final CollectionReference orders = FirebaseFirestore.instance.collection(
    "orders",
  );

  // Reference to 'profiles' collection
  final CollectionReference profiles = FirebaseFirestore.instance.collection(
    "profiles",
  );

  // Save order to Firestore
  Future<void> saveOrderToDatabase(String receipt) async {
    await orders.add({'date': DateTime.now(), 'order': receipt});
  }

  /// Save or update profile for current user
  Future<void> saveOrUpdateProfile(Profile profile) async {
    final uid = FirebaseAuth.instance.currentUser?.uid;
    if (uid == null) throw Exception('No logged-in user');

    await profiles.doc(uid).set(
      {'email': FirebaseAuth.instance.currentUser!.email, ...profile.toMap()},
      SetOptions(merge: true), // ✅ merge updates with existing data
    );
  }

  // Get all profiles
  Future<List<Profile>> getAllProfiles() async {
    final snapshot = await profiles.get();
    return snapshot.docs.map((doc) => Profile.fromDocument(doc)).toList();
  }

  // Get a single profile
  Future<Profile?> getProfile() async {
    final snapshot = await profiles.get();
    if (snapshot.docs.isNotEmpty) {
      return Profile.fromDocument(snapshot.docs.first); // take the first
    }
    return null; // no profile found
  }

  Future<Profile?> getCurrentUserProfile() async {
    final uid = FirebaseAuth.instance.currentUser?.uid;
    if (uid == null) return null;

    final doc = await FirebaseFirestore.instance
        .collection('profiles')
        .doc(uid)
        .get();
    if (doc.exists) {
      return Profile.fromDocument(doc);
    }
    return null;
  }

  // Get one profile by ID
  Future<Profile?> getProfileById(String id) async {
    final doc = await profiles.doc(id).get();
    if (doc.exists) {
      return Profile.fromDocument(doc);
    }
    return null;
  }

  Future<String?> uploadFileToFirebase(File? imageFile) async {
    if (imageFile == null) return null;

    try {
      final storageRef = FirebaseStorage.instance.ref().child(
        'images/${DateTime.now().millisecondsSinceEpoch}.jpg',
      );

      final uploadTask = storageRef.putFile(imageFile);

      // Wait until the upload completes
      final snapshot = await uploadTask;

      // Now safely get the download URL
      final downloadUrl = await snapshot.ref.getDownloadURL();
      return downloadUrl;
    } catch (e) {
      print('Error uploading file: $e');
      return null;
    }
  }
}
