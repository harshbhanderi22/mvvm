import 'dart:convert';
import 'package:http/http.dart';
import 'package:mvvm/data/app_expection.dart';
import 'package:mvvm/data/network/base_api_service.dart';
import 'package:http/http.dart' as http;

class NetworkApiService extends BaseApiService {
  /// This function sends an HTTP GET request to a specified URL and returns the response in JSON
  /// format, handling any potential socket exceptions.
  ///
  /// Args:
  ///   url (String): The URL of the API endpoint that the function is trying to access.
  ///
  /// Returns:
  ///   The `getApi` function is returning a `Future` object that resolves to the `responseJson`
  /// variable. The type of `responseJson` is not specified in the code snippet, so it could be any type
  /// depending on the implementation of the `responseReturn` function.
  @override
  Future getApi(String url) async {
    dynamic responseJson;
    try {
      final response = await http.get(Uri.parse(url));
      responseJson = responseReturn(response);
    } on SocketException {
      throw SocketException("Network Connection Timeout");
    }
    return responseJson;
  }

  /// This function sends a POST request to a specified URL with provided data and returns the response.
  /// 
  /// Args:
  ///   url (String): The URL of the API endpoint that the request will be sent to.
  ///   data: The `data` parameter is the body of the HTTP POST request being sent to the specified
  /// `url`. It contains the data that needs to be sent to the server.
  /// 
  /// Returns:
  ///   a Future object that resolves to the responseJson variable.
  @override
  Future postApi(String url, data) async {
    dynamic responseJson;
    try {
      Response response = await post(Uri.parse(url), body: data);
      responseJson = responseReturn(response);
    } on SocketException {
      throw SocketException("Network Connection Timeout");
    }
    return responseJson;
  }

  /// The function returns different exceptions based on the HTTP response status code.
  ///
  /// Args:
  ///   response (http): An object of the class http.Response, which contains the response data received
  /// from an HTTP request.
  ///
  /// Returns:
  ///   The function `responseReturn` returns an object based on the status code of the HTTP response. If
  /// the status code is 200, it returns the decoded JSON body of the response. If the status code is
  /// 400, it returns a `BadRequestException` object with the message "Bad Request". If the status code
  /// is 401, it returns an `UnauthorisedException` object with the
  responseReturn(http.Response response) {
    switch (response.statusCode) {
      case 200:
        return jsonDecode(response.body);

      case 400:
        return BadRequestException("Bad Request");

      case 401:
        return UnauthorisedException("Unauthorised Request");

      case 404:
        return NoServerException("Server do not exists");

      default:
        return DefaultException("Something Went Wrong");
    }
  }
}
