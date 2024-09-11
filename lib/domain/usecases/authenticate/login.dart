import 'package:free_fut_app/common/api_provider.dart';

class Login {
  Future<bool> call({required String pin}) async {
    var resultLogin = await ApiProvider().loginCall(userPin: pin);
    return resultLogin;
  }
}
