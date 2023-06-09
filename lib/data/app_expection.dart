/// The class `AppException` is defined to handle exceptions with a message and prefix.
class AppException implements Exception {
  final _message;
  final _prefix;
  AppException(this._message, this._prefix);

  /// This function returns a string that concatenates a prefix and a message.
  @override
  String toString() {
    return "$_prefix$_message";
  }
}

/// The class `FetchDataException` extends `AppException` and represents an exception related to
/// communication timeout.
class FetchDataException extends AppException {
  FetchDataException(String? message) : super(message, "Communication Timeout");
}

class BadRequestException extends AppException {
  BadRequestException(String? message) : super(message, "Invalid Request");
}

class UnauthorisedException extends AppException {
  UnauthorisedException(String? message)
      : super(message, "Unauthorised Request");
}

class InvalidInputException extends AppException {
  InvalidInputException(String? message) : super(message, "Invalid Data");
}

class SocketException extends AppException {
  SocketException(String? message) : super(message, "Network Error");
}

class NoServerException extends AppException {
  NoServerException(String? message) : super(message, "No Server Found");
}

class DefaultException extends AppException {
  DefaultException(String? message) : super(message, "Something Went Wrong");
}
