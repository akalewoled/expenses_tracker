import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expense_repository/src/entities/entities.dart';

import '../models/models.dart';

class userEntity {
  String username ;

  userEntity({
    required this.username,
  });

  Map<String, Object?> toDocument() {
    return {
      'username': username,
    };
  }

  static userEntity fromDocument(Map<String, dynamic> doc) {
    return userEntity(
      username: doc['username'],
    );
  }
}