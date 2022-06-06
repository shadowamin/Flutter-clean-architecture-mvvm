import 'package:flutter/cupertino.dart';

class User {
  final String id;
  final String email;
  final String firstName;
  final String lastName;
  final String avatar;

  const User(this.id, this.email, this.firstName, this.lastName, this.avatar);

  factory User.fromJson(Map<String, dynamic> json) {
    return User(json["id"].toString(), json["email"], json["first_name"],
        json["last_name"], json["avatar"]);
  }

  @override
  bool operator ==(Object other) {
    return other is User &&
        id == other.id &&
        email == other.email &&
        firstName == other.firstName &&
        lastName == other.lastName &&
        avatar == other.avatar;
  }

  @override
  int get hashCode =>hashValues(id.hashCode,email.hashCode,firstName.hashCode,lastName.hashCode,avatar.hashCode);

}
