import 'dart:io';

class UserProfile {
  String fullName = '';
  DateTime birthDate = DateTime.now();
  String city = '';
  String country = '';
  String interests = '';
  String preferredLanguage = '';
  bool emailNotifications = false;
  File? profileImage;

  set language(String language) {}
}
