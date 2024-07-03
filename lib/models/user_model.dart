import 'package:firebase_auth/firebase_auth.dart';

class UserModel {
  final String uid;
  final DateTime createdDate;
  final String email;
  final bool emailVerified;
  final String phoneNumber;
  final String displayName;
  final String photoURL;
  final String providerId;

  UserModel({
    required this.uid,
    required this.createdDate,
    required this.email,
    required this.emailVerified,
    required this.phoneNumber,
    required this.displayName,
    required this.photoURL,
    required this.providerId,
  });

  factory UserModel.initializeNewUserWithDefaultValues({
    required String uid,
    String email = '',
    String providerId = 'password'
  }) {
    return UserModel(
      uid: uid,
      createdDate: DateTime.now(),
      email: email,
      emailVerified: false,
      phoneNumber: '',
      displayName: '',
      photoURL: '',
      providerId: providerId
    );
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      uid: json['uid'],
      createdDate: DateTime.parse(json['createdDate']),
      email: json['email'],
      emailVerified: json['emailVerified'],
      phoneNumber: json['phoneNumber'],
      displayName: json['displayName'],
      photoURL: json['photoURL'],
      providerId: json['providerId'],
    );
  }

  static UserModel? fromDatabaseModel(User? user) {
    if(user == null) return null;

    return UserModel(
      uid: user.uid,
      createdDate: user.metadata.creationTime ?? DateTime.now(),
      email: user.email ?? "",
      emailVerified: user.emailVerified,
      phoneNumber: user.phoneNumber ?? "",
      displayName: user.displayName ?? "",
      photoURL: user.photoURL ?? "",
      providerId: user.providerData.first.providerId
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'createdDate': createdDate.toIso8601String(),
      'email': email,
      'emailVerified': emailVerified,
      'phoneNumber': phoneNumber,
      'displayName': displayName,
      'photoURL': photoURL,
      'providerId': providerId,
    };
  }
}