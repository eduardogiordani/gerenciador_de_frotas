import 'package:flutter/material.dart';
import 'package:gerenciador_de_frota/pages/filtro_page.dart';
import 'package:gerenciador_de_frota/pages/lista_veiculos_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Gerenciador de Frotas',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
          brightness: Brightness.light,
        ),
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          centerTitle: true,
        ),
      ),
      home: ListaVeiculosPage(),
      routes: {
        FiltroPage.ROUTE_NAME: (context) => FiltroPage(),
      },
    );
  }
}