// ignore_for_file: use_build_context_synchronously, file_names, avoid_function_literals_in_foreach_calls

part of 'DioImports.dart';

class DioHelper {
  late Dio _dio;
  late DioCacheManager _manager;
  late BuildContext context;
  final bool forceRefresh;
  final baseUrl = "https://api.goods99.net";
  final String _branch = "16";

  DioHelper({this.forceRefresh = true, required this.context}) {
    _dio = Dio(
      BaseOptions(
          baseUrl: baseUrl,
          contentType: "application/x-www-form-urlencoded; charset=utf-8"),
    )
      ..interceptors.add(_getCacheManager().interceptor)
      ..interceptors.add(LogInterceptor(
        responseBody: true,
        requestBody: true,
      ));
  }
//logdebugPrint: (data)=>log(data.toString())
  DioCacheManager _getCacheManager() {
    _manager = DioCacheManager(
        CacheConfig(baseUrl: baseUrl, defaultRequestMethod: "POST"));
    return _manager;
  }

  Options _buildCacheOptions(Map<String, dynamic> body, {bool subKey = true}) {
    return buildCacheOptions(
      const Duration(hours: 1),
      maxStale: const Duration(days: 1),
      forceRefresh: forceRefresh,
      subKey: subKey ? json.encode(body) : "",
      options: Options(extra: {}),
    );
  }

  Future<dynamic> get(String url, Map<String, dynamic> body) async {
    body.addAll({"branchId": _branch});
    _debugPrintRequestBody(body);
    _dio.options.headers = await _getHeader();
    try {
      var response = await _dio.post(url,
          data: FormData.fromMap(body), options: _buildCacheOptions(body));
      debugPrint("response ${response.statusCode}");

      var data = response.data;
      if (data["key"] == 1) {
        return data;
      } else {
        LoadingDialog.showToastNotification(data["msg"].toString());
      }
    } on DioError catch (e) {
      if (e.response?.statusCode == 401 ||
          e.response?.statusCode == 301 ||
          e.response?.statusCode == 302) {
        tokenExpired();
      } else {
        LoadingDialog.showToastNotification("check internet");
      }
    }
    return null;
  }

  Future<dynamic> post(String url, Map<String, dynamic> body,
      {bool loading = true}) async {
    if (loading == true) {
      LoadingDialog.showLoadingDialog();
    }
    body.addAll({"branchId": _branch});
    _debugPrintRequestBody(body);
    _dio.options.headers = await _getHeader();
    try {
      var response = await _dio.post(url, data: FormData.fromMap(body));
      debugPrint("response ${response.statusCode}");
      LoadingDialog.dismissDialog();
      if (response.data["msg"] != null) {
        LoadingDialog.showToastNotification(response.data["msg"].toString());
      }
      if (response.data["key"] == 1) return response.data;
    } on DioError catch (e) {
      LoadingDialog.dismissDialog();
      if (e.response?.statusCode == 401 ||
          e.response?.statusCode == 301 ||
          e.response?.statusCode == 302) {
        tokenExpired();
      } else {
        LoadingDialog.showToastNotification("check internet");
      }
    }

    return null;
  }

  Future<dynamic> uploadFile(String url, Map<String, dynamic> body) async {
    LoadingDialog.showLoadingDialog();
    body.addAll({"branchId": _branch});
    _debugPrintRequestBody(body);
    FormData formData = FormData.fromMap(body);
    body.forEach((key, value) async {
      if ((value) is File) {
        //create multipart using filepath, string or bytes
        MapEntry<String, MultipartFile> pic = MapEntry(
          key,
          MultipartFile.fromFileSync(value.path,
              filename: value.path.split("/").last),
        );
        //add multipart to request
        formData.files.add(pic);
      } else if ((value) is List<File>) {
        List<MapEntry<String, MultipartFile>> files = [];
        value.forEach((element) async {
          MapEntry<String, MultipartFile> pic = MapEntry(
              key,
              MultipartFile.fromFileSync(
                element.path,
                filename: element.path.split("/").last,
              ));
          files.add(pic);
        });
        formData.files.addAll(files);
      } else {
        // requestData.addAll({"$key":"$value"});

      }
    });

    _dio.options.headers = await _getHeader();
    //create multipart request for POST or PATCH method

    try {
      var response = await _dio.post(url, data: formData);
      debugPrint("response ${response.statusCode}");
      LoadingDialog.dismissDialog();
      if (response.data["msg"] != null) {
        LoadingDialog.showToastNotification(response.data["msg"].toString());
      }
      if (response.data["key"] == 1) return response.data;
    } on DioError catch (e) {
      LoadingDialog.dismissDialog();
      if (e.response?.statusCode == 401 ||
          e.response?.statusCode == 301 ||
          e.response?.statusCode == 302) {
        tokenExpired();
      } else {
        LoadingDialog.showToastNotification("check internet");
      }
    }

    return null;
  }

  Future<dynamic> uploadChatFile(String url, Map<String, dynamic> body,
      {bool showLoader = true}) async {
    LoadingDialog.showLoadingDialog();
    _debugPrintRequestBody(body);
    body.addAll({"branchId": _branch});
    FormData formData = FormData.fromMap(body);
    body.forEach((key, value) async {
      if ((value) is File) {
        //create multipart using filepath, string or bytes
        MapEntry<String, MultipartFile> pic = MapEntry(
          key,
          MultipartFile.fromFileSync(value.path,
              filename: value.path.split("/").last),
        );
        //add multipart to request
        formData.files.add(pic);
      } else if ((value) is List<File>) {
        List<MapEntry<String, MultipartFile>> files = [];
        value.forEach((element) async {
          MapEntry<String, MultipartFile> pic = MapEntry(
              key,
              MultipartFile.fromFileSync(
                element.path,
                filename: element.path.split("/").last,
              ));
          files.add(pic);
        });
        formData.files.addAll(files);
      } else {
        // requestData.addAll({"$key":"$value"});

      }
    });

    _dio.options.headers = await _getHeader();
    //create multipart request for POST or PATCH method

    try {
      var response = await _dio.post(url,
          data: formData, options: _buildCacheOptions(body, subKey: false));
      debugPrint("response ${response.statusCode}");
      LoadingDialog.dismissDialog();
      if (response.data["key"] == 1) return response.data;
    } on DioError catch (e) {
      LoadingDialog.dismissDialog();
      if (e.response?.statusCode == 401 ||
          e.response?.statusCode == 301 ||
          e.response?.statusCode == 302) {
        tokenExpired();
      } else {
        LoadingDialog.showToastNotification("check internet");
      }
    }

    return null;
  }

  void _debugPrintRequestBody(Map<String, dynamic> body) {
    debugPrint(
        "-------------------------------------------------------------------");
    log("$body");
    debugPrint(
        "-------------------------------------------------------------------");
  }

  _getHeader() async {
    String? token = GlobalState.instance.get("token");
    return {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    };
  }

  void tokenExpired() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
    AutoRouter.of(context).replaceAll([const LoginRoute()]);
  }
}
