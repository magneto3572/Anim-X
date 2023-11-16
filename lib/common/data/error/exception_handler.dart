import 'package:anime_app_flutter/common/data/network/error_message_model.dart';

class ExceptionHandlder implements Exception {
  final ErrorMessageModel errorMessageModel;

  const ExceptionHandlder({required this.errorMessageModel});
}

class DatabaseException implements Exception {}
