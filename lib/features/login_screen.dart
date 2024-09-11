import 'package:bloc_provider/bloc_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:free_fut_app/bloc/login_bloc.dart';
import 'package:free_fut_app/config/theme/app_theme.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final loginBloc = BlocProvider.of<LoginBloc>(context);

    return MaterialApp(
      theme: AppTheme.appTheme(),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: SizedBox(
            width: 300, // Ancho total del contenido
            child: Column(
              mainAxisSize: MainAxisSize.min,
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
                // Botón de login
                _buildLogin(
                    loginBloc: loginBloc, isEnabled: true, context: context),
                const SizedBox(height: 10.0),
                StreamBuilder<String>(
                  stream: loginBloc.loginError,
                  builder: (context, AsyncSnapshot<String> snapshotError) {
                    if (snapshotError.hasData) {
                      return Text(
                        snapshotError.data.toString(),
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: Colors.red,
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            ),
                        textAlign:
                            TextAlign.center, // Alinear el texto en el centro
                      );
                    } else {
                      return Container();
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  TextButton _buildLogin({
    bool isEnabled = false,
    required LoginBloc loginBloc,
    required BuildContext context,
  }) {
    return TextButton(
      onPressed: isEnabled ? () => loginBloc.loginFunction(context) : null,
      style: TextButton.styleFrom(
        backgroundColor: Theme.of(context).primaryColorLight,
        textStyle: Theme.of(context).textTheme.titleLarge?.copyWith(
              fontSize: 18, // Tamaño del texto del botón
            ),
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
        minimumSize: const Size(double.infinity, 50),
      ),
      child: const Text("Entrar"),
    );
  }

  // Input del PIN
  Widget _textFormField(BuildContext context, {required bool isEnabled}) {
    final loginBloc = BlocProvider.of<LoginBloc>(context);
    final FocusNode focusNode = FocusNode();

    return TextFormField(
      keyboardType: TextInputType.number,
      enabled: isEnabled,
      controller: loginBloc.pinTextController,
      decoration: InputDecoration(
        filled: true,
        fillColor: Theme.of(context).scaffoldBackgroundColor,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide.none,
        ),
        hintText: 'Ingresa el PIN',
        hintStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Theme.of(context).hintColor,
            ),
        contentPadding: const EdgeInsets.symmetric(
          vertical: 15.0,
          horizontal: 10.0,
        ),
      ),
      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: Theme.of(context).textTheme.bodyMedium?.color,
          ),
      cursorColor: Theme.of(context).cardColor,
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
        LengthLimitingTextInputFormatter(4),
      ],
      onTapOutside: (PointerDownEvent event) {
        focusNode.unfocus();
      },
    );
  }
}
