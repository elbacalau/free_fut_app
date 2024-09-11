import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(80.0);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.lightBlueAccent,
        borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(16.0),
            bottomRight: Radius.circular(16.0)),
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 8.0,
              spreadRadius: 1.0),
        ],
      ),
      child: AppBar(
        title: Text(
          'FutFree',
          style: GoogleFonts.poppins(
              fontWeight: FontWeight.bold,
              fontSize: 30.0,
              color: const Color.fromARGB(255, 0, 64, 117)),
        ),
        centerTitle: true,
        elevation: 5,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        // leading: IconButton(
        //   icon: const Icon(
        //     Icons.menu,
        //     size: 38.0,
        //   ),
        //   onPressed: () {
        //     Scaffold.of(context).openDrawer();
        //   },
        // ),
      ),
    );
  }
}
