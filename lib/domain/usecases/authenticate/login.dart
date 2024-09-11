import 'package:free_fut_app/common/api_provider.dart';

class Login {
  Future<bool> call({required String pin}) async {
    bool resultLogin = await ApiProvider().loginCall(userPin: pin);
    return resultLogin;
  }
}
