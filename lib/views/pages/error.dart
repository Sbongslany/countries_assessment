import 'dart:convert';
import 'package:meta/meta.dart';

class ServerError {
  ServerError({
    @required this.timestamp,
    @required this.status,
    @required this.error,
    @required this.message,
    @required this.path,
  });
  final String timestamp;
  final int status;
  final String error;
  final String message;
  final String path;

  static ServerError fromMap(String response) {
    var map = json.decode(response).cast<String, dynamic>();
    return new ServerError(
      timestamp: map['timestamp'],
      status: map['status'],
      error: map['error'],
      message: map['message'],
      path: map['path'],
    );
  }
}
