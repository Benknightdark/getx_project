import 'package:get/get.dart';
import 'package:getx_project/providers/covid_api_provider.dart';

class DetailController extends GetxController {
  final CovidApiProvider provider = Get.put(CovidApiProvider());
  Map<String, dynamic> data = {};
  var _dataAvailable = false.obs;
  bool get dataAvailable => _dataAvailable.value;
  var _country = "".obs;
  String get country => _country.value;
  var _code = "".obs;
  String get code => _code.value;
  Future<Map<String, dynamic>> getCases() async {
    final cases = await provider.getCases("/total/dayone/country/$_country");
    if (cases.status.hasError) {
      return Future.error(cases.statusText!);
    } else {
      var lastData = cases.body.last;
      return lastData;
    }
  }

  @override
  Future<void> onInit() async {
    super.onInit();

    var object = Get.arguments;
    if (object != null) {
      _country.value = object['title'];
      _code.value = object['code'];
      data = await getCases();
      _dataAvailable.value = true;
    }
  }
}
