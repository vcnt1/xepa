import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:xepa/app/model/error.dart';

import 'package:xepa/app/config/enums.dart';

import 'hosts.dart';

class Network {
  static final Network _instance = Network._internal();

  factory Network() {
    return _instance;
  }

  Network._internal() {
    setAuthHeader();
  }

  Map _authHeader = Map();

  Map<String, String> get authHeader => Map<String, String>.from(_authHeader);

  void setAuthHeader() {
    _authHeader[HttpHeaders.authorizationHeader] = 'bearer $TOKEN';
    _authHeader[HttpHeaders.contentTypeHeader] = 'application/json';
  }

  Future<dynamic> get(String url, {Map<String, String>? headers}) async => request(http.get(Uri.parse(url), headers: headers ?? authHeader));

  Future<dynamic> post(String url, {Map<String, String>? headers, body, encoding}) async =>
      request(http.post(Uri.parse(url), body: jsonEncode(body), headers: headers ?? authHeader, encoding: encoding));

  Future<dynamic> put(String url, {Map<String, String>? headers, body, encoding}) async =>
      request(http.put(Uri.parse(url), body: jsonEncode(body), headers: headers ?? authHeader, encoding: encoding));

  Future<dynamic> delete(String url, {Map<String, String>? headers}) async => request(http.delete(Uri.parse(url), headers: headers ?? authHeader));

  Future<dynamic> request(Future request) async {
    try {
      final response = await request;
      if (response.statusCode != 422 && (response.statusCode < 200 || response.statusCode > 400)) return MyError(type: ErrorType.noServiceAvailable);
      if (jsonDecode(response.body) is Map && jsonDecode(response.body)['error'] != null) {
        return MyError(type: ErrorType.apiError, errorMessage: jsonDecode(response.body)['error'].toString());
      }

      return response.body;
      // } on Exception catch (e){
      //     throw e;
      // }
    } on SocketException catch (e) {
      return MyError(type: ErrorType.noInternetConnection, errorMessage: e.toString());
    } on Error catch (e) {
      return MyError(type: ErrorType.noServiceAvailable, errorMessage: e.toString());
    } on FormatException catch (e) {
      return MyError(type: ErrorType.invalidFormat, errorMessage: e.toString());
    } catch (e) {
      return MyError(type: ErrorType.unknown, errorMessage: e.toString());
    }
  }

  Future<dynamic> multipartPost(String url, Map<String, File> files, {Map<String, String>? headers, required Map body}) async {
    try {
      var postUri = Uri.parse(url);
      var request = http.MultipartRequest("POST", postUri);
      if (headers != null) request.headers.addAll(headers);

      for (var entry in files.entries) {
        request.files.add(await http.MultipartFile.fromPath(entry.key, entry.value.path));
      }

      for (var entry in body.entries) {
        request.fields[entry.key] = entry.value;
      }

      var response = await request.send();
      final respStr = await response.stream.bytesToString();

      if (response.statusCode != 422 && (response.statusCode < 200 || response.statusCode > 400)) return MyError(type: ErrorType.noServiceAvailable);

      return respStr;
      // } on Exception catch (e){
      //     throw e;
      // }
    } on SocketException catch (e) {
      return MyError(type: ErrorType.noInternetConnection, errorMessage: e.toString());
    } on Error catch (e) {
      return MyError(type: ErrorType.noServiceAvailable, errorMessage: e.toString());
    } on FormatException catch (e) {
      return MyError(type: ErrorType.invalidFormat, errorMessage: e.toString());
    } catch (e) {
      return MyError(type: ErrorType.unknown, errorMessage: e.toString());
    }
  }
}
