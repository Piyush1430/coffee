import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:google_fonts/google_fonts.dart";

import 'package:coffee/screen/home.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

final kSeedcolor = ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(255, 229, 238, 241),
  brightness: Brightness.light,
);

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        textTheme: TextTheme(
          labelLarge: GoogleFonts.lato(fontWeight: FontWeight.bold),
          titleLarge:
              GoogleFonts.notoSerifArmenian(fontWeight: FontWeight.bold),
        ),
        colorScheme:
            const ColorScheme.light(primary: Color.fromARGB(255, 244, 244, 244))
                .copyWith(background: Colors.grey[300]),
        
      ),
      home: const HomePage(),
    );
  }
}
