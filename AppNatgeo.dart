import 'package:flutter/material.dart';

void main() => runApp(NatGeoApp());

class NatGeoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'National Geographic',
      theme: ThemeData(
        primaryColor: Color(0xFF007A33),
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: AppBarTheme(
          backgroundColor: Color(0xFF007A33),
          foregroundColor: Colors.white,
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    CienciaPage(),
    AnimalesPage(),
    MedioAmbientePage(),
    HistoriaPage(),
  ];

  void _onItemTapped(int index) {
    setState(() => _selectedIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('National Geographic')),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedItemColor: Color(0xFF007A33),
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.science), label: 'Ciencia'),
          BottomNavigationBarItem(icon: Icon(Icons.pets), label: 'Animales'),
          BottomNavigationBarItem(icon: Icon(Icons.eco), label: 'Medio Ambiente'),
          BottomNavigationBarItem(icon: Icon(Icons.history), label: 'Historia'),
        ],
      ),
    );
  }
}

class CienciaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(16),
      children: [
        Image.network("https://www.nationalgeographic.com.es/medio/2023/12/01/ciencia_6d4057d6_231201145328_1280x720.jpg"),
        SizedBox(height: 16),
        Text(
          'Explorando el conocimiento',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8),
        Text(
          'La sección de ciencia de National Geographic cubre los últimos avances científicos, investigaciones espaciales, salud, física y más. Aquí se explica el mundo desde lo observable hasta lo teórico.',
          style: TextStyle(fontSize: 16),
        ),
      ],
    );
  }
}

class AnimalesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(16),
      children: [
        Image.network("https://www.nationalgeographic.com.es/medio/2023/07/20/leon_9d4bce3c_230720140530_1280x720.jpg"),
        SizedBox(height: 16),
        Text(
          'El reino animal',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8),
        Text(
          'Desde los leones africanos hasta los insectos más extraños, esta sección nos lleva al corazón del comportamiento animal, conservación y biodiversidad global.',
          style: TextStyle(fontSize: 16),
        ),
      ],
    );
  }
}

class MedioAmbientePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(16),
      children: [
        Image.network("https://www.nationalgeographic.com.es/medio/2023/04/22/medio-ambiente_ef27f95f_230422105129_1280x720.jpg"),
        SizedBox(height: 16),
        Text(
          'Protegiendo el planeta',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8),
        Text(
          'Conoce los desafíos ambientales del presente: cambio climático, sostenibilidad, energías renovables y más. Aprende cómo podemos marcar la diferencia.',
          style: TextStyle(fontSize: 16),
        ),
      ],
    );
  }
}

class HistoriaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(16),
      children: [
        Image.network("https://www.nationalgeographic.com.es/medio/2022/06/10/historia-del-mundo_0e7bde2d_220610121153_1280x720.jpg"),
        SizedBox(height: 16),
        Text(
          'Tesoros del pasado',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8),
        Text(
          'Desde civilizaciones antiguas hasta eventos modernos, la sección de Historia nos transporta por los grandes momentos del pasado con rigor y fascinación.',
          style: TextStyle(fontSize: 16),
        ),
      ],
    );
  }
}
