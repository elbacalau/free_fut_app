import '../common/utils/constants.dart';

class ApiProvider {
  Future<bool> loginCall({required String userPin}) async {
    await Future.delayed(
      const Duration(seconds: 1),
    );

    if (userPin == hostPin) {
      return true;
    } else {
      return false;
    }
  }
}
