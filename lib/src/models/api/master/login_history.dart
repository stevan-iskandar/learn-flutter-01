import 'user.dart';

class LoginHistory {
  const LoginHistory({
    this.id,
    this.encryptionId,
    this.userId,
    this.ipAddress,
    this.device,
    this.os,
    this.imei,
    this.imsi,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.user,
  });

  final int? id;
  final String? encryptionId;
  final int? userId;
  final String? ipAddress;
  final String? device;
  final String? os;
  final String? imei;
  final String? imsi;
  final int? status;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  final User? user;
}
