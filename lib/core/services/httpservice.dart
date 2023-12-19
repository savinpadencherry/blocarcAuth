import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:journey/core/logger.dart';

class HttpService with LogMixin {
  Future<http.Response> makeGetRequest({
    required String url,
    Map<String, String>? headers,
  }) async {
    log('makeGetRequest: url: $url');
    try {
      Uri uri = Uri.parse(url);
      http.Response response = await http.get(uri, headers: headers);
      return response;
    } catch (error) {
      errorLog('error: url: $url');
      errorLog('error: headers: $headers');
      errorLog('error: message : $error');
      rethrow;
    }
  }

  Future<http.Response> makeDeleteRequest({
    required String url,
    Map<String, String>? headers,
    Object? data,
  }) async {
    log('makeDeleteRequest: url: $url');
    try {
      Uri uri = Uri.parse(url);
      http.Response response = await http.delete(
        uri,
        headers: headers,
      );

      return response;
    } catch (error) {
      errorLog('error: url: $url');
      errorLog('error: headers: $headers');
      errorLog('error: data: $data');
      errorLog('error: message : $error');
      rethrow;
    }
  }

  Future<http.Response> makePostRequest({
    required String url,
    Map<String, String>? headers,
    Map<String, dynamic>? data,
  }) async {
    log('makePostRequest: url: $url');
    warningLog('JSON data : ${json.encode(data)}');
    warningLog('Headers : $headers');
    try {
      Uri uri = Uri.parse(url);
      http.Response response = await http.post(
        uri,
        body: json.encode(data),
        headers: headers,
      );
      return response;
    } catch (error) {
      errorLog('error: url: $url');
      errorLog('error: headers: $headers');
      errorLog('error: data: ${json.encode(data)}');
      errorLog('error: message : $error');
      rethrow;
    }
  }

  Future<http.Response> makePutRequest({
    required String url,
    Map<String, String>? headers,
    Map<String, dynamic>? data,
  }) async {
    log('makePostRequest: url: $url');
    warningLog('JSON data : ${json.encode(data)}');
    warningLog('Headers : $headers');
    try {
      Uri uri = Uri.parse(url);
      http.Response response = await http.put(
        uri,
        body: json.encode(data),
        headers: headers,
      );
      return response;
    } catch (error) {
      errorLog('error: url: $url');
      errorLog('error: headers: $headers');
      errorLog('error: data: ${json.encode(data)}');
      errorLog('error: message : $error');
      rethrow;
    }
  }

  Future<http.Response> makePatchRequest({
    required String url,
    Map<String, String>? headers,
    Object? data,
  }) async {
    log('makePatchRequest: url: $url');
    warningLog('JSON data : ${json.encode(data)}');
    try {
      Uri uri = Uri.parse(url);
      http.Response response = await http.patch(
        uri,
        body: json.encode(data),
        headers: headers,
      );
      return response;
    } catch (error) {
      errorLog('error: url: $url');
      errorLog('error: headers: $headers');
      errorLog('error: data: $data');
      errorLog('error: message : $error');
      rethrow;
    }
  }
}
