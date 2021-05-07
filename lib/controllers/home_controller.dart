import 'package:get/get.dart';
import 'package:getx_project/providers/covid_api_provider.dart';

class HomeController extends GetxController {
  final CovidApiProvider provider = Get.put(CovidApiProvider());
  Map<String, dynamic> data = {};
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
    var aa = await getCases();
    print(aa);
    data = await getCases();
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
