import 'dart:io';
import 'package:bloc_provider/bloc_provider.dart';
import 'package:flutter/material.dart';
import 'package:free_fut_app/domain/usecases/authenticate/login.dart';
import 'package:go_router/go_router.dart';
import 'package:rxdart/rxdart.dart';
import '../common/utils/constants.dart';

class LoginBloc implements Bloc {
  // Text Controller
  final TextEditingController pinTextController = TextEditingController();

  // Stream Controller
  final BehaviorSubject<String> _pin = BehaviorSubject<String>();
  final BehaviorSubject<bool> _enableFields = BehaviorSubject.seeded(true);
  final BehaviorSubject<String> _loginError = BehaviorSubject<String>();

  // Streams
  Stream<String> get pin => _pin.stream;

  Stream<bool> get enable => _enableFields.stream;
  Function(bool) get _changeEnable => _enableFields.sink.add;

  Stream<String> get loginError => _loginError.stream;
  Function(String) get changeLoginError => _loginError.sink.add;

  Future<void> loginFunction(BuildContext context) async {
    changeLoginError("");
    _changeEnable(false);

    _pin.sink.add(pinTextController.text);

    dynamic login;

    try {
      login = await Login()(pin: _pin.value);
    } on SocketException catch (_) {
      changeLoginError(socketError);
    } catch (e) {
      changeLoginError("$e");
    }

    if (login is bool) {
      if (login == true) {
        // Si el login es correcto cambiar a la siguiente pagina
        // ignore: use_build_context_synchronously
        GoRouter.of(context).go('/home');
        dispose();
      } else {
        changeLoginError(wrongPin);
      }
    }
  }

  @override
  void dispose() {
    _enableFields.close();
    _loginError.close();
    _pin.close();
  }
}
