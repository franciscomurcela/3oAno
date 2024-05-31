// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, library_private_types_in_public_api, unnecessary_import, sort_child_properties_last, sized_box_for_whitespace, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const HomePage(),
    );
  }
}

class MyAppState{
  var favorites = <Image>[];
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<IconData> favoriteAnimationToggle = [];
  List<int> favorite_imgs = [];
  final List<Image> imgList = [
    Image.asset('images/1.jpg'),
    Image.asset('images/2.jpg'),
    Image.asset('images/3.jpg'),
    Image.asset('images/4.png'),
    Image.asset('images/5.jpg'),
    Image.asset('images/6.jpg'),
    Image.asset('images/7.jpg'),
  ];

  
  int currentIndex = 0;

  void toggleFavorite() {
      if (favorite_imgs.contains(currentIndex)) {
        favorite_imgs.remove(currentIndex);
      } else {
        favorite_imgs.add(currentIndex);
      }
    }
  void toggleFavoriteAnimation(IconData icon) {
    setState(() {
      if (favoriteAnimationToggle.contains(icon)) {
        favoriteAnimationToggle.remove(icon);
      } else {
        favoriteAnimationToggle.add(icon);
      }
    });
  }

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: Container(
          width: double.infinity,
          color: Color.fromARGB(255, 62, 10, 152),
          child: Text(
            'Flutter Homework',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 35,
            ),
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          
          children:[
            Container(
              width: 400,
              height: 400,
              child: FittedBox(
                child: imgList[currentIndex],
                fit: BoxFit.contain, // Choose the fit mode as needed
                ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children:[
                  ElevatedButton(
                  child: Text('Next'),
                  onPressed: (){
                    favoriteAnimationToggle.remove(Icons.favorite);
                    setState(() {
                    // Increment currentIndex
                    currentIndex = (currentIndex + 1) % imgList.length;
                });            
                  },
                ),
                SizedBox(width: 15),
                IconButton(
                  icon: Icon(
                    favoriteAnimationToggle.contains(Icons.favorite)
                        ? Icons.favorite
                        : Icons.favorite_border,
                    color: favoriteAnimationToggle.contains(Icons.favorite)
                        ? Colors.red
                        : Colors.black,
                  ),
                  onPressed: () {
                    toggleFavoriteAnimation(Icons.favorite);
                    toggleFavorite();
                  },
                ),
              ]
            ),
          ]
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Color.fromARGB(255, 62, 10, 152),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(
              color: Colors.white,
              icon: Icon(Icons.home),
              onPressed: () {
                
              },
            ),
            IconButton(
              color: Colors.white,
              icon: Icon(Icons.favorite),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FavoritePage(favoriteAnimationToggle: favoriteAnimationToggle)),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class FavoritePage extends StatelessWidget {
  final List<IconData> favoriteAnimationToggle;
  final int counter= 0;
  const FavoritePage({Key? key, required this.favoriteAnimationToggle});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: Container(
          width: double.infinity,
          color: Color.fromARGB(255, 62, 10, 152),
          child: const Text(
            'Flutter Homework',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 35,
            ),
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: favoriteAnimationToggle.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            leading: Icon(
              favoriteAnimationToggle[index],
              color: Colors.red,
            ),
            
          );
        },
      ),
      bottomNavigationBar: BottomAppBar(
        color: Color.fromARGB(255, 62, 10, 152),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(
              color: Colors.white,
              icon: Icon(Icons.home),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HomePage()),
                );
              },
            ),
            IconButton(
              color: Colors.white,
              icon: Icon(Icons.favorite),
              onPressed: () {
                // nada
              },
            ),
          ],
        ),
      ),
    );
  }
}
