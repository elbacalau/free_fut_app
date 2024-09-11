import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        filled: true, // Habilita el color de fondo
        fillColor: Colors.white, // Establece el color de fondo a blanco
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0), // Añade bordes redondeados
          borderSide: BorderSide.none, // Sin borde
        ),
        hintText: 'Ingresa tu texto aquí', // Texto de ayuda
        contentPadding: const EdgeInsets.symmetric(
          vertical: 15.0,
          horizontal: 10.0,
        ),
      ),
      style: const TextStyle(color: Colors.black), // Estilo del texto ingresado
      cursorColor: Colors.black, // Color del cursor
    );
  }
}
