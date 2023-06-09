/// The `ApiResponse` class is a generic class that represents the response of an API call, including
/// the status, data, and message.
import 'package:mvvm/data/response/status.dart';

class ApiResponse<T> {
  Status? status;
  /// `T? data;` is declaring a generic type `T` that can be any type of data and the `?` indicates that
  /// it is nullable. This means that the `data` property can either hold a value of type `T` or be
  /// null.
  T? data;
  String? message;

  ApiResponse(this.data, this.message, this.status);

  /// These are constructor methods for the `ApiResponse` class that set the `status` property to
  /// `LOADING`, `COMPLETED`, and `ERROR` respectively. These methods are used to create instances of
  /// `ApiResponse` with the corresponding status without having to manually set the `status` property
  /// each time.
  ApiResponse.loading() {
    status = Status.LOADING;
  }

  ApiResponse.completed() {
    status = Status.COMPLETED;
  }

  ApiResponse.error() {
    status = Status.ERROR;
  }

  @override
  String toString() {
     return "Status: $status \n Message: $message \n Data: $data";
  }
}
