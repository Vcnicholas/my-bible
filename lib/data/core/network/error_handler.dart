import 'dart:convert';
import 'package:dio/dio.dart';
import '../../../utils/snack_message.dart';

// This handles the errors in the app i made use of DioError
void handleError(dynamic error) {
  var errorString = error.response.toString();
  if (error is DioException) {
    switch (error.type) {
      case DioExceptionType.cancel:
      // showCustomToast("Request to API server was cancelled");
        break;
      case DioExceptionType.connectionTimeout:
      // showCustomToast("Connection timeout with API server");
        break;
      case DioExceptionType.unknown:
        snackBars("No internet Connection",false);
        break;
      case DioExceptionType.receiveTimeout:
      // showCustomToast("Receive timeout in connection with API server");
        break;
      case DioExceptionType.badResponse:
        final errorMessage =  error.response?.data["message"];
        if(errorMessage!=null) {
          print("TTT$errorMessage");
          if(errorMessage=="invalid token"){
            // navigationService.navigateToReplaceWidget(const SignIn());
            snackBars("$errorMessage please try login again",false);

          }else{
            snackBars(errorMessage,false);
          }
          // invalid token
        }else{
          snackBars(error.response?.data["errors"],false);
        }
        break;
      case DioExceptionType.sendTimeout:
        snackBars("Send timeout in connection with API server",false);
        break;
      default:
        snackBars("Something went wrong",false);
        break;
    }
  } else {
    var json = jsonDecode(errorString);
    var nameJson = json['data'];
    snackBars(nameJson,false);
    throw nameJson;
  }
}