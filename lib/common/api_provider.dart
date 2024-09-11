import 'package:dio/dio.dart';
import 'package:free_fut_app/domain/model/chucky_data.dart';

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

  void fetchData() async {
    final Dio dio = Dio();

    try {
      final response = await dio.get(baseUrl);

      if (response.data is String) {
        final ChuckyList chuckyData = chuckyListFromJson(response.data);

        print(chuckyData.groups.map((ChuckyListGroup first) => first.name));
      } else {
        print('El formato de datos no es correcto');
      }
    } catch (e) {
      print('Exception: $e');
    }
  }
}
