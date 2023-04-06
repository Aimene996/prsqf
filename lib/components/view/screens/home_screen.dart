import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:prsqf/components/controller/note_provider.dart';
import 'package:prsqf/components/data/sqf_helper.dart';
import 'add_note.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton.small(
          child: const Icon(Icons.add),
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
              return const AddNote();
            }));
          },
        ),
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () async {
                  await SQLHelper.deleteAllNotes()
                      .whenComplete(() => setState(() {}));
                },
                icon: Icon(Icons.delete_forever)),
          ],
          title: const Text("Note"),
        ),
        body: Consumer<NoteProvider>(builder: (context, value, child) {
          return ListView.builder(
            itemCount: value.item.length,
            itemBuilder: (BuildContext context, int index) {
              var data = value.item[index];

              return Dismissible(
                direction: DismissDirection.endToStart,
                key: UniqueKey(),
                child: Card(
                  color: Colors.deepOrangeAccent.shade100,
                  child: ListTile(
                    leading: CircleAvatar(
                      child: Text(data.id.toString()),
                    ),
                    title: Text(data.title),
                    subtitle: Text(data.content),
                    trailing: Text(('description') + ("desc")),
                  ),
                ),
              );
            },
          );
        }));
  }
}
