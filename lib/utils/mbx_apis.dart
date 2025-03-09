import 'package:mbankingflutter/login/viewmodels/mbx_profile_vm.dart';
import 'package:mbankingflutter/preferences/mbx_preferences_vm+users.dart';
import 'package:mbankingflutter/utils/mbx_device_vm.dart';

import '../utils/api_x.dart';
import 'mbx_baseurl_vm.dart';

class MbxApi {
  static addRequiredHeader(Map<String, Object?> header) async {
    header['X-DEVICE-ID'] = await MbxDeviceVM.deviceId();
    header['X-DEVICE-NAME'] = await MbxDeviceVM.deviceName();
    header['X-DEVICE-OS'] = await MbxDeviceVM.deviceOSName();
    header['X-DEVICE-OS-VERSION'] = await MbxDeviceVM.deviceOSVersion();
    header['X-DEVICE-OS-VERSION-CODE'] =
        await MbxDeviceVM.deviceOSVersionCode();
    final token = await MbxUserPreferencesVM.getToken();
    if (token.isNotEmpty) {
      header['Authorization'] = 'Bearer $token';
    }
  }

  static Future<ApiXResponse> get(
      {required String endpoint,
      Map<String, Object?>? params,
      Map<String, Object?>? headers,
      String contractFile = '',
      bool contract = false}) async {
    Map<String, Object?> newHeaders = {};
    headers?.forEach((key, value) {
      newHeaders[key] = value;
    });
    await addRequiredHeader(newHeaders);
    return ApiX.get(
            url: contract == false
                ? MbxBaseUrlVM.apiUrl(endpoint)
                : contractFile,
            params: params,
            headers: newHeaders)
        .then((resp) {
      handleResponse(resp);
      return resp;
    });
  }

  static Future<ApiXResponse> post(
      {required String endpoint,
      Map<String, Object>? params,
      Map<String, Object>? headers,
      bool json = false,
      String contractFile = '',
      bool contract = false}) async {
    Map<String, Object?> newHeaders = {};
    headers?.forEach((key, value) {
      newHeaders[key] = value;
    });
    await addRequiredHeader(newHeaders);
    return ApiX.post(
            url: contract == false
                ? MbxBaseUrlVM.apiUrl(endpoint)
                : contractFile,
            params: params,
            headers: newHeaders,
            json: json)
        .then((resp) {
      handleResponse(resp);
      return resp;
    });
  }

  static Future<ApiXResponse> delete(
      {required String endpoint,
      Map<String, Object>? params,
      Map<String, Object>? headers,
      String contractFile = '',
      bool contract = false}) async {
    Map<String, Object?> newHeaders = {};
    headers?.forEach((key, value) {
      newHeaders[key] = value;
    });
    await addRequiredHeader(newHeaders);
    return ApiX.delete(
            url: contract == false
                ? MbxBaseUrlVM.apiUrl(endpoint)
                : contractFile,
            params: params,
            headers: newHeaders)
        .then((resp) {
      handleResponse(resp);
      return resp;
    });
  }

  static Future<ApiXResponse> put(
      {required String endpoint,
      Map<String, Object>? params,
      Map<String, Object>? headers,
      bool json = false,
      String contractFile = '',
      bool mock = false}) async {
    Map<String, Object?> newHeaders = {};
    headers?.forEach((key, value) {
      newHeaders[key] = value;
    });
    await addRequiredHeader(newHeaders);
    return ApiX.put(
            url: mock == false ? MbxBaseUrlVM.apiUrl(endpoint) : contractFile,
            params: params,
            headers: newHeaders,
            json: json)
        .then((resp) {
      handleResponse(resp);
      return resp;
    });
  }

  static Future<ApiXResponse> postMultipart(
      {required String endpoint,
      Map<String, String?>? files,
      Map<String, Object?>? params,
      Map<String, Object?>? headers,
      String contractFile = '',
      bool contract = false}) async {
    Map<String, Object?> newHeaders = {};
    headers?.forEach((key, value) {
      newHeaders[key] = value;
    });
    await addRequiredHeader(newHeaders);
    return ApiX.postMultipart(
            url: contract == false
                ? MbxBaseUrlVM.apiUrl(endpoint)
                : contractFile,
            files: files,
            params: params,
            headers: newHeaders)
        .then((resp) {
      handleResponse(resp);
      return resp;
    });
  }

  static Future<ApiXResponse> putMultipart(
      {required String endpoint,
      Map<String, String?>? files,
      Map<String, Object?>? params,
      Map<String, Object?>? headers,
      String contractFile = '',
      bool contract = false}) async {
    Map<String, Object?> newHeaders = {};
    headers?.forEach((key, value) {
      newHeaders[key] = value;
    });
    await addRequiredHeader(newHeaders);
    return ApiX.putMultipart(
            url: contract == false
                ? MbxBaseUrlVM.apiUrl(endpoint)
                : contractFile,
            files: files,
            params: params,
            headers: newHeaders)
        .then((resp) {
      handleResponse(resp);
      return resp;
    });
  }

  static handleResponse(ApiXResponse resp) async {
    if (resp.status == 401) {
      await MbxProfileVM.logout();
    }
  }
}
