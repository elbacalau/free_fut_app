import 'package:free_fut_app/common/api_provider.dart';
import 'package:free_fut_app/domain/model/chucky_data.dart';

class CardsHome {
  Future<List<GroupCardHome>> call() async {
    List<GroupCardHome> listCardHome = await ApiProvider().getCardsGroupHome();
    return listCardHome;
  }
}
