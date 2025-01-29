import 'package:get/get.dart';

import '../config/api_client.dart';

class BaseController extends FullLifeCycleController with FullLifeCycleMixin {
  final ApiClient apiClient = ApiClient();

  @override
  void onDetached() {}

  @override
  void onHidden() {}

  @override
  void onInactive() {}

  @override
  void onPaused() {}

  @override
  void onResumed() {}
}