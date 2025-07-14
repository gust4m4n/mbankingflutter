import 'dart:async';

import 'package:http/http.dart' as http;

import '../utils/all_utils.dart';
import '../widget-x/all_widgets.dart';

export 'api_x.dart';

class ApiXResponse {
  http.Response? response;
  Map headers = {};
  int statusCode = 0;
  String body = '';
  Jason jason = Jason();
  int status = 0;
  String title = '';
  String message = '';

  decodeHttpResponse(http.Response response) {
    this.response = response;
    headers = response.headers;
    statusCode = response.statusCode;
    body = response.body;
    if (statusCode != 200) {
      if (body.isNotEmpty) {
        message = body;
      } else {
        if (response.reasonPhrase != null &&
            response.reasonPhrase!.isNotEmpty) {
          message = '$statusCode | ${response.reasonPhrase}';
        } else {
          message = '$statusCode';
        }
      }
    }
    status = statusCode;
    decodeBody();
  }

  decodeBody() {
    jason = Jason.decode(body);
    if (jason['status'].intValue != 0) {
      status = jason['status'].intValue;
    }
    if (jason['title'].stringValue.isNotEmpty) {
      title = jason['title'].stringValue;
    }
    if (jason['message'].stringValue.isNotEmpty) {
      message = jason['message'].stringValue;
    }
  }
}

class ApiX {
  static int timeoutInSecs = 120;
  static int contractDelay = 500;

  static ApiXResponse apiNoInternetResponse() {
    ApiXResponse resp = ApiXResponse();
    resp.statusCode = -1;
    resp.message = 'No Internet connection.';
    return resp;
  }

  static ApiXResponse apiTimeoutResponse() {
    ApiXResponse resp = ApiXResponse();
    resp.statusCode = -2;
    resp.message = 'Connection timeout.';
    return resp;
  }

  static Future<ApiXResponse?> handleContract(String url) async {
    if (url.trim().toLowerCase().startsWith('http://') == false &&
        url.trim().toLowerCase().startsWith('https://') == false) {
      try {
        var json = await Assets.loadString(url);
        ApiXResponse resp = ApiXResponse();
        resp.statusCode = 200;
        resp.body = json;
        resp.decodeBody();
        return resp;
      } catch (_) {
        return null;
      }
    } else {
      return null;
    }
  }

  static ApiXResponse? handleNoInternet() {
    if (ReachabilityX.internetConnected == false) {
      return apiNoInternetResponse();
    } else {
      return null;
    }
  }

  static logApiCall(String url, String method, Map<String, String>? headers,
      Map<String, Object?>? params) {
    if (kDebugMode) {
      var headerLines = '';
      if (headers != null && headers.isNotEmpty) {
        headers.forEach((key, value) {
          headerLines = '$headerLines$key: $value\n';
        });
      }
      var paramLines = '';
      if (params != null && params.isNotEmpty) {
        params.forEach((key, value) {
          paramLines = '$paramLines$key: $value\n';
        });
      }
      LoggerX.logSeparated(
          '[ApiX] $method $url\nHeaders:\n$headerLines\nParameters:\n$paramLines');
    }
  }

  static Future<ApiXResponse> get(
      {required String url,
      Map<String, Object?>? params,
      Map<String, Object?>? headers}) async {
    String finalUrl = url;
    if (params != null && params.isNotEmpty) {
      final Map<String, String> newParams =
          params.map((key, value) => MapEntry(key, value.toString()));
      String queryString = Uri(queryParameters: newParams).query;
      finalUrl = '$finalUrl?$queryString';
    }

    Map<String, String>? newHeaders;
    if (headers != null && headers.isNotEmpty) {
      newHeaders = headers.map((key, value) => MapEntry(key, value.toString()));
    }

    logApiCall(url, 'GET', newHeaders, params);

    ApiXResponse? resp = await handleContract(url);
    if (resp != null) {
      LoggerX.logSeparated(
          '[ApiX] ${resp.statusCode} $url\n${resp.jason.encoded()}');
      await Future.delayed(Duration(milliseconds: contractDelay));
      return Future.value(resp);
    }

    resp = handleNoInternet();
    if (resp != null) {
      return Future.value(resp);
    }

    try {
      var response = await http
          .get(Uri.parse(finalUrl), headers: newHeaders)
          .timeout(Duration(seconds: timeoutInSecs));
      ApiXResponse resp = ApiXResponse();
      resp.decodeHttpResponse(response);
      LoggerX.logSeparated(
          '[ApiX] ${resp.statusCode} $url\n${resp.jason.encoded()}');
      return resp;
    } catch (e) {
      if (e is TimeoutException) {
        return apiTimeoutResponse();
      } else {
        var resp = ApiXResponse();
        resp.statusCode = -1;
        resp.message = e.toString();
        return resp;
      }
    }
  }

  static Future<ApiXResponse> post(
      {required String url,
      Map<String, Object?>? params,
      Map<String, Object?>? headers,
      bool json = false}) async {
    Map<String, String>? newHeaders;
    if (headers != null && headers.isNotEmpty) {
      newHeaders = headers.map((key, value) => MapEntry(key, value.toString()));
    }
    if (json == true) {
      newHeaders?['Content-Type'] = 'application/json';
    }

    logApiCall(url, 'POST', newHeaders, params);

    ApiXResponse? resp = await handleContract(url);
    if (resp != null) {
      LoggerX.logSeparated(
          '[ApiX] ${resp.statusCode} $url\n${resp.jason.encoded()}');
      await Future.delayed(Duration(milliseconds: contractDelay));
      return Future.value(resp);
    }

    resp = handleNoInternet();
    if (resp != null) {
      return Future.value(resp);
    }

    try {
      var response = await http
          .post(Uri.parse(url),
              body: json == true
                  ? params?.toSortedJsonMap().toJsonString()
                  : params,
              headers: newHeaders)
          .timeout(Duration(seconds: timeoutInSecs));
      ApiXResponse resp = ApiXResponse();
      resp.decodeHttpResponse(response);
      LoggerX.logSeparated(
          '[ApiX] ${resp.statusCode} $url\n${resp.jason.encoded()}');
      return resp;
    } catch (e) {
      if (e is TimeoutException) {
        return apiTimeoutResponse();
      } else {
        var resp = ApiXResponse();
        resp.statusCode = -1;
        resp.message = e.toString();
        return resp;
      }
    }
  }

  static Future<ApiXResponse> put(
      {url = String,
      Map<String, Object?>? params,
      Map<String, Object?>? headers,
      bool json = false}) async {
    Map<String, String>? newHeaders;
    if (headers != null && headers.isNotEmpty) {
      newHeaders = headers.map((key, value) => MapEntry(key, value.toString()));
    }
    if (json == true) {
      newHeaders?['Content-Type'] = 'application/json';
    }

    logApiCall(url, 'PUT', newHeaders, params);

    ApiXResponse? resp = await handleContract(url);
    if (resp != null) {
      await Future.delayed(Duration(milliseconds: contractDelay));
      return Future.value(resp);
    }

    resp = handleNoInternet();
    if (resp != null) {
      return Future.value(resp);
    }

    try {
      var response = await http
          .put(Uri.parse(url),
              body: json == true
                  ? params?.toSortedJsonMap().toJsonString()
                  : params,
              headers: newHeaders)
          .timeout(Duration(seconds: timeoutInSecs));
      ApiXResponse resp = ApiXResponse();
      resp.decodeHttpResponse(response);
      LoggerX.logSeparated(
          '[ApiX] ${resp.statusCode} $url\n${resp.jason.encoded()}');
      return resp;
    } catch (e) {
      if (e is TimeoutException) {
        return apiTimeoutResponse();
      } else {
        var resp = ApiXResponse();
        resp.statusCode = -1;
        resp.message = e.toString();
        return resp;
      }
    }
  }

  static Future<ApiXResponse> delete(
      {url = String,
      Map<String, Object?>? params,
      Map<String, Object?>? headers,
      bool json = false}) async {
    Map<String, String>? newHeaders;
    if (headers != null && headers.isNotEmpty) {
      newHeaders = headers.map((key, value) => MapEntry(key, value.toString()));
    }
    if (json == true) {
      newHeaders?['Content-Type'] = 'application/json';
    }

    logApiCall(url, 'DELETE', newHeaders, params);

    ApiXResponse? resp = await handleContract(url);
    if (resp != null) {
      await Future.delayed(Duration(milliseconds: contractDelay));
      return Future.value(resp);
    }

    resp = handleNoInternet();
    if (resp != null) {
      return Future.value(resp);
    }

    try {
      var response = await http
          .delete(Uri.parse(url),
              body: json == true
                  ? params?.toSortedJsonMap().toJsonString()
                  : params,
              headers: newHeaders)
          .timeout(Duration(seconds: timeoutInSecs));
      ApiXResponse resp = ApiXResponse();
      resp.decodeHttpResponse(response);
      LoggerX.logSeparated(
          '[ApiX] ${resp.statusCode} $url\n${resp.jason.encoded()}');
      return resp;
    } catch (e) {
      if (e is TimeoutException) {
        return apiTimeoutResponse();
      } else {
        var resp = ApiXResponse();
        resp.statusCode = -1;
        resp.message = e.toString();
        return resp;
      }
    }
  }

  static Future<ApiXResponse> postMultipart(
      {url = String,
      Map<String, String?>? files,
      Map<String, Object?>? params,
      Map<String, Object?>? headers}) async {
    ApiXResponse? resp = await handleContract(url);
    if (resp != null) {
      await Future.delayed(Duration(milliseconds: contractDelay));
      return Future.value(resp);
    }

    resp = handleNoInternet();
    if (resp != null) {
      return Future.value(resp);
    }

    Map<String, String>? newHeaders;
    if (headers != null && headers.isNotEmpty) {
      newHeaders = headers.map((key, value) => MapEntry(key, value.toString()));
    }

    var request = http.MultipartRequest('POST', Uri.parse(url));
    if (params != null && params.isNotEmpty) {
      request.fields.addAll(params.cast<String, String>());
    }
    if (newHeaders != null && newHeaders.isNotEmpty) {
      request.headers.addAll(newHeaders.cast<String, String>());
    }

    if (files != null && files.isNotEmpty) {
      List<http.MultipartFile> newFiles = [];
      for (var entry in files.entries) {
        if (entry.value!.isNotEmpty) {
          var f = await http.MultipartFile.fromPath(entry.key, entry.value!);
          newFiles.add(f);
        }
      }
      request.files.addAll(newFiles);
    }

    if (kDebugMode) {
      var headerLines = '';
      if (newHeaders != null && newHeaders.isNotEmpty) {
        newHeaders.forEach((key, value) {
          headerLines = '$headerLines$key: $value\n';
        });
      }
      var paramLines = '';
      if (params != null && params.isNotEmpty) {
        params.forEach((key, value) {
          paramLines = '$paramLines$key: $value\n';
        });
      }
      var fileLines = '';
      if (files != null && files.isNotEmpty) {
        files.forEach((key, value) {
          fileLines = '$fileLines$key: $value\n';
        });
      }
      LoggerX.logSeparated(
          '[ApiX] POST MULTIPART $url\nHeaders:\n$headerLines\nParameters:\n$paramLines\nFiles:\n$fileLines');
    }

    return request.send().then((stremedResponse) async {
      var response = await http.Response.fromStream(stremedResponse);
      ApiXResponse resp = ApiXResponse();
      resp.decodeHttpResponse(response);
      LoggerX.logSeparated(
          '[ApiX] ${resp.statusCode} $url\n${resp.jason.encoded()}');
      return resp;
    }).timeout(Duration(seconds: timeoutInSecs), onTimeout: () {
      return apiTimeoutResponse();
    });
  }

  static Future<ApiXResponse> putMultipart(
      {url = String,
      Map<String, String?>? files,
      Map<String, Object?>? params,
      Map<String, Object?>? headers}) async {
    ApiXResponse? resp = await handleContract(url);
    if (resp != null) {
      await Future.delayed(Duration(milliseconds: contractDelay));
      return Future.value(resp);
    }

    resp = handleNoInternet();
    if (resp != null) {
      return Future.value(resp);
    }

    Map<String, String>? newHeaders;
    if (headers != null && headers.isNotEmpty) {
      newHeaders = headers.map((key, value) => MapEntry(key, value.toString()));
    }

    var request = http.MultipartRequest('PUT', Uri.parse(url));
    if (params != null && params.isNotEmpty) {
      request.fields.addAll(params.cast<String, String>());
    }
    if (newHeaders != null && newHeaders.isNotEmpty) {
      request.headers.addAll(newHeaders.cast<String, String>());
    }

    if (files != null && files.isNotEmpty) {
      List<http.MultipartFile> newFiles = [];
      for (var entry in files.entries) {
        if (entry.value!.isNotEmpty) {
          var f = await http.MultipartFile.fromPath(entry.key, entry.value!);
          newFiles.add(f);
        }
      }
      request.files.addAll(newFiles);
    }

    if (kDebugMode) {
      var headerLines = '';
      if (newHeaders != null && newHeaders.isNotEmpty) {
        newHeaders.forEach((key, value) {
          headerLines = '$headerLines$key: $value\n';
        });
      }
      var paramLines = '';
      if (params != null && params.isNotEmpty) {
        params.forEach((key, value) {
          paramLines = '$paramLines$key: $value\n';
        });
      }
      var fileLines = '';
      if (files != null && files.isNotEmpty) {
        files.forEach((key, value) {
          fileLines = '$fileLines$key: $value\n';
        });
      }
      LoggerX.logSeparated(
          '[ApiX] PUT MULTIPART $url\nHeaders:\n$headerLines\nParameters:\n$paramLines\nFiles:\n$fileLines');
    }
    return request.send().then((stremedResponse) async {
      var response = await http.Response.fromStream(stremedResponse);
      ApiXResponse resp = ApiXResponse();
      resp.decodeHttpResponse(response);
      LoggerX.logSeparated(
          '[ApiX] ${resp.statusCode} $url\n${resp.jason.encoded()}');
      return resp;
    }).timeout(Duration(seconds: timeoutInSecs), onTimeout: () {
      return apiTimeoutResponse();
    });
  }

  static Future<ApiXResponse> download(
      {required String url,
      Map<String, Object?>? params,
      Map<String, Object?>? headers}) async {
    ApiXResponse? resp = await handleContract(url);
    if (resp != null) {
      LoggerX.logSeparated(
          '[ApiX] ${resp.statusCode} $url\n${resp.jason.encoded()}');
      await Future.delayed(Duration(milliseconds: contractDelay));
      return Future.value(resp);
    }

    resp = handleNoInternet();
    if (resp != null) {
      return Future.value(resp);
    }

    String finalUrl = url;
    if (params != null && params.isNotEmpty) {
      final Map<String, String> newParams =
          params.map((key, value) => MapEntry(key, value.toString()));
      String queryString = Uri(queryParameters: newParams).query;
      finalUrl = '$finalUrl?$queryString';
    }

    Map<String, String>? newHeaders;
    if (headers != null && headers.isNotEmpty) {
      newHeaders = headers.map((key, value) => MapEntry(key, value.toString()));
    }

    logApiCall(url, 'GET', newHeaders, params);

    try {
      var response = await http
          .get(Uri.parse(finalUrl), headers: newHeaders)
          .timeout(Duration(seconds: timeoutInSecs));
      ApiXResponse resp = ApiXResponse();
      resp.decodeHttpResponse(response);
      LoggerX.logSeparated(
          '[ApiX] ${resp.statusCode} $url\n${resp.jason.encoded()}');
      return resp;
    } catch (e) {
      if (e is TimeoutException) {
        return apiTimeoutResponse();
      } else {
        var resp = ApiXResponse();
        resp.statusCode = -1;
        resp.message = e.toString();
        return resp;
      }
    }
  }
}
