import 'package:bloc_provider/bloc_provider.dart';
import 'package:flutter/material.dart';
import 'package:free_fut_app/bloc/home_bloc.dart';
import 'package:free_fut_app/domain/model/chucky_data.dart';
import 'package:free_fut_app/widgets/app_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeBloc>(
      creator: (context, bag) => HomeBloc(),
      child: Builder(
        builder: (context) {
          final homeBloc = BlocProvider.of<HomeBloc>(context);

          return Scaffold(
            appBar: const CustomAppBar(),
            body: Center(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: GestureDetector(
                  child: _cardBuilder(homeBloc: homeBloc),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _cardBuilder({required HomeBloc homeBloc}) {
    return StreamBuilder<List<GroupCardHome>>(
      stream: homeBloc.homeScreenCards,
      builder: (BuildContext context,
          AsyncSnapshot<List<GroupCardHome>> snapshotListCards) {
        // saltar el primer elemento de la lista
        final List<GroupCardHome> cards = (snapshotListCards.data != null &&
                snapshotListCards.data!.isNotEmpty)
            ? snapshotListCards.data!.sublist(1)
            : [];

        return GestureDetector(
          onHorizontalDragEnd: (details) {},
          child: Card(
            child: ListView.separated(
              separatorBuilder: (context, index) => const Divider(
                  height: 20,
                  indent: 20,
                  endIndent: 20,
                  thickness: 4.0,
                  color: Colors.black54),
              itemCount: cards.length,
              itemBuilder: (BuildContext context, int index) {
                final card = cards[index];
                return ListTile(
                  title: Text(card.name,
                      style: Theme.of(context).textTheme.titleLarge),
                  leading: ClipOval(
                    child: Image.network(card.image,
                        width: 40.0, height: 40.0, fit: BoxFit.cover),
                  ),
                  horizontalTitleGap: 20.0,
                  trailing: const Icon(Icons.navigate_next_outlined),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
