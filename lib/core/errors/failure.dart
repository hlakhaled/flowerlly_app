import 'package:dio/dio.dart';

abstract class Failure {}

class ServiceFailure extends Failure {
  final String errorMsg;
  ServiceFailure(this.errorMsg);

  factory ServiceFailure.fromDioError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        return ServiceFailure("Connection Timeout");
      case DioExceptionType.sendTimeout:
        return ServiceFailure("Send Timeout");
      case DioExceptionType.receiveTimeout:
        return ServiceFailure("Receive Timeout");
      case DioExceptionType.badCertificate:
        return ServiceFailure("Bad Certificate");
      case DioExceptionType.badResponse:
        return ServiceFailure("Bad Response");
      case DioExceptionType.cancel:
        return ServiceFailure("Request Cancelled");
      case DioExceptionType.connectionError:
        if (error.response != null && error.response!.statusCode != null) {
          return ServiceFailure.fromConnection(
              error.response!.statusCode!, error.response!.data);
        }
        return ServiceFailure("Connection Error");
      case DioExceptionType.unknown:
        if (error.message != null &&
            error.message!.contains("SocketException")) {
          return ServiceFailure("No Internet Connection");
        } else {
          return ServiceFailure("Unexpected Error");
        }
    }
  }

  factory ServiceFailure.fromConnection(int statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 402) {
      if (response is Map && response["error"]?["message"] != null) {
        return ServiceFailure(response["error"]["message"]);
      } else {
        return ServiceFailure("Authorization Error");
      }
    } else if (statusCode == 404) {
      return ServiceFailure("User Request Not Found");
    } else if (statusCode == 500) {
      return ServiceFailure("Internal Server Failure");
    } else {
      return ServiceFailure("There was an Error, Please try again");
    }
  }
}
