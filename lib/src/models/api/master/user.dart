import 'module.dart';

class User {
  const User({
    this.id,
    this.encryptionId,
    this.username,
    this.email,
    this.name,
    this.firstname,
    this.lastname,
    this.createdBy,
    this.updatedBy,
    this.createdAt,
    this.updatedAt,
    this.modules,
  });

  final int? id;
  final String? encryptionId;
  final String? username;
  final String? email;
  final String? name;
  final String? firstname;
  final String? lastname;
  final int? createdBy;
  final int? updatedBy;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  final List<Module>? modules;
}
