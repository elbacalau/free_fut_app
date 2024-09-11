import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:free_fut_app/common/api_provider.dart';
import 'package:free_fut_app/widgets/app_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: IconButton(
            onPressed: () {
              ApiProvider().fetchData();
            },
            icon: const Icon(CupertinoIcons.arrow_2_circlepath),
            iconSize: 60.0,
          ),
        ),
      ),
    );
  }
}
