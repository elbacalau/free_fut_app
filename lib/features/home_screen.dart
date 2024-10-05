import 'package:flutter/material.dart';
import 'package:free_fut_app/widgets/app_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: _buildBodyContent(),
    );
  }

  Widget _buildBodyContent() {
    return Placeholder();
  }
}
