import 'package:get/get.dart';
import 'package:getx_project/providers/covid_api_provider.dart';

class Countryontroller extends GetxController {
  final CovidApiProvider provider = Get.put(CovidApiProvider());
  Map<String, dynamic> data = {};
  var _dataAvailable = false.obs;
  bool get dataAvailable => _dataAvailable.value;
  var _title = "".obs;
  String get title => _title.value;
  Future<Map<String, dynamic>> getCases() async {
    final cases = await provider.getCases("/summary");
    if (cases.status.hasError) {
      return Future.error(cases.statusText!);
    } else {
      return cases.body!;
    }
  }

  @override
  Future<void> onInit() async {
    super.onInit();
    data = await getCases();
    _dataAvailable.value = true;
    var object = Get.arguments;
    if (object != null) {
      _title.value = object['title'];
    }
  }

  @override
  void onReady() {
    print('The build method is done. '
        'Your controller is ready to call dialogs and snackbars');
    super.onReady();
  }

  @override
  void onClose() {
    print('onClose called');
    super.onClose();
  }
}
