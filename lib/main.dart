import 'package:bloc_provider/bloc_provider.dart';
import 'package:flutter/material.dart';
import 'package:free_fut_app/bloc/login_bloc.dart';
import 'package:free_fut_app/config/routes/app_routes.dart';
import 'package:free_fut_app/config/theme/app_theme.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final appRoutes = AppRoutes().appRoutes;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      creator: (context, BlocCreatorBag bag) => LoginBloc(),
      child: MaterialApp.router(
        theme: AppTheme.appTheme(),
        routerConfig: appRoutes,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
