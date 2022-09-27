import 'master/login_history.dart';
import 'master/module.dart';

class AuthUser {
  const AuthUser({
    this.id,
    this.encryptionId,
    this.username,
    this.email,
    this.name,
    this.firstname,
    this.lastname,
    this.modules,
    this.token,
    this.expirationToken,
    this.loginHistories,
  });

  final int? id;
  final String? encryptionId;
  final String? username;
  final String? email;
  final String? name;
  final String? firstname;
  final String? lastname;
  final String? token;
  final String? expirationToken;

  final List<Module>? modules;
  final List<LoginHistory>? loginHistories;
}
