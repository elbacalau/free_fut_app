import 'package:bloc_provider/bloc_provider.dart';
import 'package:flutter/material.dart';
import 'package:free_fut_app/bloc/login_bloc.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final loginBloc = BlocProvider.of<LoginBloc>(context);
    // final Size size = MediaQuery.of(context).size;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Stack(
          children: <Widget>[
            // Imagen de fondo
            // Container(
            //   width: size.width,
            //   height: size.height,
            //   decoration: const BoxDecoration(
            //     image: DecorationImage(
            //       image: AssetImage('assets/login-screen.jpeg'),
            //       opacity: 1,
            //       fit: BoxFit.cover,
            //     ),
            //   ),
            // ),

            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                StreamBuilder<bool>(
                  stream: loginBloc.enable,
                  builder: (BuildContext context,
                      AsyncSnapshot<bool> snapshotIsEnabled) {
                    if (snapshotIsEnabled.hasData) {
                      return _textFormField(context,
                          isEnabled: snapshotIsEnabled.data!);
                    } else {
                      return const CircularProgressIndicator();
                    }
                  },
                ),
                const SizedBox(height: 30.0),
                // Button for login
                _buildLogin(
                    loginBloc: loginBloc, isEnabled: true, context: context),
              ],
            ),
          ],
        ),
      ),
    );
  }

  TextButton _buildLogin(
      {bool isEnabled = false,
      required LoginBloc loginBloc,
      required BuildContext context}) {
    return TextButton(
      onPressed: isEnabled ? () => loginBloc.loginFunction(context) : null,
      child: const Text("Entrar"),
    );
  }

  // Input del Pin
  TextFormField _textFormField(BuildContext context,
      {required bool isEnabled}) {
    final loginBloc = BlocProvider.of<LoginBloc>(context);
    final FocusNode focusNode = FocusNode();

    return TextFormField(
      keyboardType: const TextInputType.numberWithOptions(),
      enabled: isEnabled,
      controller: loginBloc.pinTextController,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide.none,
        ),
        hintText: 'Ingresa el PIN',
        contentPadding: const EdgeInsets.symmetric(
          vertical: 15.0,
          horizontal: 10.0,
        ),
      ),
      style: const TextStyle(color: Colors.black),
      cursorColor: Colors.black,
      onTapOutside: (PointerDownEvent event) {
        focusNode.unfocus();
      },
    );
  }
}
