import '../../../helpers/json.dart';

class Status422 {
  const Status422({
    required this.message,
    required this.errors,
  });

  final String message;
  final Map<String, dynamic> errors;

  factory Status422.fromJSON(dynamic data) {
    Map<String, dynamic> json = parseJSON(data);

    return Status422(
      message: json['message'],
      errors: json['errors'],
    );
  }

  Map<String, dynamic> toJSON() => {
        'message': message,
        'errors': errors,
      };
}
