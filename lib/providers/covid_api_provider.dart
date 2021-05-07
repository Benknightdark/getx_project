import 'package:get/get.dart';

class CovidApiProvider extends GetConnect {
  @override
  void onInit() {
    // httpClient.defaultDecoder =
    //     (val) => CasesModel.fromJson(val as Map<String, dynamic>);
    httpClient.baseUrl = 'https://api.covid19api.com';
  }

  Future<Response<Map<String, dynamic>>> getCases(String path) => get(path);
}
