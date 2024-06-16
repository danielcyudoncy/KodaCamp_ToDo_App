import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  Home({super.key});
  final List<Map<String, String>> movies = [
    {
      'title': 'Game of Thrones',
      'description':
          'An American fantasy drama television series created by David Benioff and D. B. Weiss for HBO.'
    },
    {
      'title': 'The Gods Must Be Crazy',
      'description':
          'A 1980 comedy film written, produced, edited and directed by Jamie Uys.'
    },
    {
      'title': 'Inception',
      'description':
          'The film stars Leonardo DiCaprio as a professional thief who steals information by infiltrating the subconscious of his targets.'
    },
    {
      'title': 'Interstellar',
      'description': 'A space epic by Christopher Nolan.'
    },
  ];

  final List<Map<String, String>> songs = [
    {
      'title': 'God Will Make a Way',
      'description': 'A worship song by Don Moen.'
    },
    {
      'title': 'Way Maker',
      'description':
          'A contemporary worship song written by Nigerian gospel singer Sinach, it was released as a single on 30 December 2015.'
    },
    {
      'title': "'I'm no longer a slave to fear",
      'description':
          'Jonathan David Helser & Melissa Helser song from album We Will Not Be Shaken (Live) is released in 2015'
    },
    {
      'title': 'Million Little Miracles',
      'description':
          'Maverick City Music. Joe L Barnes. Artist. Joe L Barnes. Recommended based on this song. Back To Life - LiveBethel Music, Zahriya Zachary.'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Favorite Movies and Songs')),
      ),
      body: Container(
        decoration: const BoxDecoration(
          color: Colors.amber,
        ),
        child: ListView(
          children: [
            ListTile(
              title: const Text(
                'Movies',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              tileColor: Colors.blue[100],
            ),
            ...movies.map((movie) => ListTile(
                  title: ElevatedButton(
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text(movie['title']!),
                    ),
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text(movie['title']!),
                            content: Text(movie['description']!),
                            actions: [
                              TextButton(
                                child: const Text('Close'),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          );
                        },
                      );
                    },
                  ),
                )),
            ListTile(
              title: const Text(
                'Songs',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              tileColor: Colors.green[100],
            ),
            ...songs.map((song) => ListTile(
                  title: ElevatedButton(
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text(song['title']!),
                    ),
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text(song['title']!),
                            content: Text(song['description']!),
                            actions: [
                              TextButton(
                                child: const Text('Close'),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          );
                        },
                      );
                    },
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
