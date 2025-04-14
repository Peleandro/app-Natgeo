import 'package:flutter/material.dart';

void main() => runApp(NatGeoApp());

class NatGeoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'NatGeo App',
      theme: ThemeData(
        primarySwatch: Colors.green,
        fontFamily: 'Georgia',
      ),
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;
  final List<Widget> _pages = [
    HomePage(),
    SciencePage(),
    EnvironmentPage(),
    AnimalsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('National Geographic')),
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        selectedItemColor: Colors.green[700],
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          setState(() => _currentIndex = index);
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Inicio'),
          BottomNavigationBarItem(icon: Icon(Icons.science), label: 'Ciencia'),
          BottomNavigationBarItem(icon: Icon(Icons.public), label: 'Medioambiente'),
          BottomNavigationBarItem(icon: Icon(Icons.pets), label: 'Animales'),
        ],
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ContentPage(
      title: 'Noticias Destacadas',
      items: [
        ArticleItem(
          imageUrl: 'https://via.placeholder.com/400x200',
          title: 'El mundo natural en imágenes',
          description: 'Una mirada visual al esplendor del planeta.',
        ),
        ArticleItem(
          imageUrl: 'https://via.placeholder.com/400x200',
          title: 'Viajes extraordinarios',
          description: 'Historias desde los rincones más remotos.',
        ),
      ],
    );
  }
}

class SciencePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ContentPage(
      title: 'Ciencia',
      items: [
        ArticleItem(
          imageUrl: 'https://via.placeholder.com/400x200',
          title: 'Descubrimientos recientes',
          description: 'Lo último en astronomía y física.',
        ),
        ArticleItem(
          imageUrl: 'https://via.placeholder.com/400x200',
          title: 'Tecnología verde',
          description: 'Innovaciones para un mundo sustentable.',
        ),
      ],
    );
  }
}

class EnvironmentPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ContentPage(
      title: 'Medioambiente',
      items: [
        ArticleItem(
          imageUrl: 'https://via.placeholder.com/400x200',
          title: 'Cambio climático',
          description: 'Efectos y soluciones posibles.',
        ),
        ArticleItem(
          imageUrl: 'https://via.placeholder.com/400x200',
          title: 'Energías renovables',
          description: 'Cómo reducir nuestra huella ecológica.',
        ),
      ],
    );
  }
}

class AnimalsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ContentPage(
      title: 'Animales',
      items: [
        ArticleItem(
          imageUrl: 'https://via.placeholder.com/400x200',
          title: 'Especies en peligro',
          description: 'Acciones para proteger la fauna.',
        ),
        ArticleItem(
          imageUrl: 'https://via.placeholder.com/400x200',
          title: 'Mundo submarino',
          description: 'La biodiversidad de los océanos.',
        ),
      ],
    );
  }
}

class ContentPage extends StatelessWidget {
  final String title;
  final List<ArticleItem> items;

  ContentPage({required this.title, required this.items});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(16),
      children: [
        Text(title, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        SizedBox(height: 16),
        ...items.map((item) => ArticleCard(item: item)).toList(),
      ],
    );
  }
}

class ArticleItem {
  final String imageUrl;
  final String title;
  final String description;

  ArticleItem({required this.imageUrl, required this.title, required this.description});
}

class ArticleCard extends StatelessWidget {
  final ArticleItem item;

  ArticleCard({required this.item});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(item.imageUrl, fit: BoxFit.cover, width: double.infinity, height: 200),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(item.title, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                SizedBox(height: 8),
                Text(item.description),
              ],
            ),
          ),
        ],
      ),
    );
  }
}