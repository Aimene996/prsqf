// ignore_for_file: unused_local_variable, unnecessary_type_check

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:prsqf/components/controller/note_provider.dart';
import 'package:prsqf/components/data/sqf_helper.dart';
import 'package:prsqf/components/model/note_model.dart';
import 'package:prsqf/components/view/screens/home_screen.dart';
import 'package:uuid/uuid.dart';

class AddNote extends StatefulWidget {
  const AddNote({super.key});
  @override
  State<AddNote> createState() => _AddNoteState();
}

class _AddNoteState extends State<AddNote> {
  late TextEditingController _titleController;
  late TextEditingController _contentController;
  var uid = Uuid().v4();
  int counter = 0;

  int generateUniqueId() {
    return ++counter;
  }

  String newId = "";

  String getID() {
    for (int i = 0; i < uid.length; i++) {
      print(uid[i]);
      if (uid[0] is int) {
        newId = uid.substring(0, 1).toString();
      } else if (uid[0] is String) {
        newId = int.parse(uid.substring(0, 1)).toString();
      }
    }
    return newId;
  }

  @override
  void initState() {
    _titleController = TextEditingController();
    _contentController = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    _contentController.dispose();
    _titleController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Card(
            child: Column(
          children: [
            SizedBox(
              child: TextFormField(
                onChanged: (value) {
                  setState(() {
                    value = _titleController.text;
                  });
                },
                controller: _titleController,
                decoration: const InputDecoration(
                    hintText: "title", hoverColor: Colors.amber),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              child: TextFormField(
                onChanged: (value) {
                  setState(() {
                    value = _contentController.text;
                  });
                },
                controller: _contentController,
                decoration: const InputDecoration(
                    hintText: "content", hoverColor: Colors.amber),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton.icon(
                    onPressed: () {
                      context.read<NoteProvider>().addNote(NoteModel(
                          id: generateUniqueId(),
                          title: _titleController.text,
                          content: _contentController.text));

                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (ctx) => const HomeScreen()));
                    },
                    icon: const Icon(Icons.add),
                    label: const Text("Add")),
                TextButton.icon(
                    onPressed: () async {
                      if (kDebugMode) {}
                    },
                    icon: const Icon(Icons.delete),
                    label: const Text("delete"))
              ],
            )
          ],
        )),
      ),
    );
  }
}
