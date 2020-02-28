import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:moorexample/db.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    Provider<AppDatabase>(
      create: (_) => AppDatabase(),
      dispose: (_, value) => value.close(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key key}) : super(key: key);

  static const String routeName = 'home-page';

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();

    SchedulerBinding.instance.addPostFrameCallback((_) {
      final db = Provider.of<AppDatabase>(context, listen: false);
    });
  }

  @override
  Widget build(BuildContext context) {
    final db = Provider.of<AppDatabase>(context, listen: false);

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          db.insertNote(
            Note(id: null, title: 'null', content: 'null', synced: false),
          );
        },
      ),
      body: StreamBuilder<List<Note>>(
        stream: db.streamAllNotes(),
        builder: (_, AsyncSnapshot<List<Note>> snapshot) {
          print(snapshot.connectionState);
          if (snapshot.connectionState == ConnectionState.active) {
            if (snapshot.hasError) {
              return Text('Ellol');
            }

            return ListView.builder(
              itemBuilder: (_, int index) {
                return Text(snapshot.data[index].title);
              },
              itemCount: snapshot.data.length,
            );
          } else {
            return Text('no data');
          }
        },
      ),
    );
  }
}
