import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Notivate',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(title: 'Feed'),
      debugShowCheckedModeBanner: true,
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.title});

  final String title;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Note> notes = List.of(const [
    Note(
      id: "1",
      title: "Hello World",
      subtitle: "lorem ipsum dolor sit amet",
    ),
    Note(
      id: "2",
      title: "Data Structures: LinkedList",
      subtitle: "LinkedList is one of the more common data structures...",
    ),
    Note(
      id: "3",
      title: "Favor Composition over Inheritance",
      subtitle: "OOP Design Principles - Part 007",
    ),
  ]);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SafeArea(
        child: ListView.builder(
          itemCount: notes.length,
          itemBuilder: (context, index) {
            final note = notes[index];

            return Card(
              key: ValueKey(note.id),
              child: ListTile(
                title: Text(note.title),
                subtitle: Text(note.subtitle),
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Write',
        child: const Icon(Icons.edit_outlined),
      ),
    );
  }
}

class Note {
  final String id;
  final String title;
  final String subtitle;

  const Note({
    required this.id,
    required this.title,
    required this.subtitle,
  });
}
