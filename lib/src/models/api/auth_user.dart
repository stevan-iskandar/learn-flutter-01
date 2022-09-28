import '../../helpers/json.dart';
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

  factory AuthUser.fromJSON(dynamic data) {
    Map<String, dynamic> json = parseJSON(data);

    return AuthUser(
      id: json['id'],
      encryptionId: json['encryption_id'],
      username: json['username'],
      email: json['email'],
      name: json['name'],
      firstname: json['firstname'],
      lastname: json['lastname'],
      modules: json['modules'],
      token: json['token'],
      expirationToken: json['expiration_token'],
      loginHistories: json['login_histories'],
    );
  }
}
