import 'package:bloc_provider/bloc_provider.dart';
import 'package:free_fut_app/domain/usecases/cards_home/cards_home.dart';
import 'package:rxdart/rxdart.dart';
import '../domain/model/chucky_data.dart';

class HomeBloc implements Bloc {
  // StreamController
  final BehaviorSubject<List<GroupCardHome>> _homeScreenCards =
      BehaviorSubject<List<GroupCardHome>>();

  final BehaviorSubject<bool> _loadingSubject = BehaviorSubject<bool>();

  // Streams
  Stream<List<GroupCardHome>> get homeScreenCards => _homeScreenCards.stream;
  Stream<bool> get loadingStream => _loadingSubject.stream;

  // iniciar el fetch de datos al crear el bloc
  HomeBloc() {
    _fetchHomeScreenCards();
  }

  Future<void> _fetchHomeScreenCards() async {
    try {
      _loadingSubject.sink.add(true);
      final List<GroupCardHome> homeScreenCards = await CardsHome()();
      _homeScreenCards.sink.add(homeScreenCards);
    } catch (e) {
      _homeScreenCards.sink.addError(e);
    } finally {
      // se ha terminado de cargar
      _loadingSubject.sink.add(false);
    }
  }

  @override
  void dispose() {
    _homeScreenCards.close();
    _loadingSubject.close();
  }
}
