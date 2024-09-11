import 'dart:io';
import 'package:bloc_provider/bloc_provider.dart';
import 'package:flutter/material.dart';
import 'package:free_fut_app/domain/usecases/authenticate/login.dart';
import 'package:go_router/go_router.dart';
import 'package:rxdart/rxdart.dart';
import '../common/utils/constants.dart';

class LoginBloc implements Bloc {
  final TextEditingController pinTextController = TextEditingController();

  final BehaviorSubject<String> _pin = BehaviorSubject<String>();
  final BehaviorSubject<bool> _enableFields = BehaviorSubject.seeded(true);
  final BehaviorSubject<String> _loginError = BehaviorSubject<String>();

  Stream<String> get pin => _pin.stream;
  Stream<bool> get enable => _enableFields.stream;
  Stream<String> get loginError => _loginError.stream;

  void _changeEnable(bool value) => _enableFields.sink.add(value);
  void changeLoginError(String error) => _loginError.sink.add(error);

  Future<void> loginFunction(BuildContext context) async {
    changeLoginError("");
    _changeEnable(false);

    _pin.sink.add(pinTextController.text);

    if (_pin.value.isEmpty) {
      changeLoginError(emptyPin);
      _changeEnable(true);
      return;
    }

    try {
      final login = await Login()(pin: _pin.value);

      if (login) {
        // si el login devuelve true cambiar a la sigiuente pagina
        if (context.mounted) {
          GoRouter.of(context).go('/home');
        }
      } else {
        changeLoginError(wrongPin);
        return;
      }
    } on SocketException {
      changeLoginError(socketError);
    } catch (e) {
      changeLoginError(e.toString());
    } finally {
      _changeEnable(true);
    }
  }

  @override
  void dispose() {
    _enableFields.close();
    _loginError.close();
    _pin.close();
  }
}
