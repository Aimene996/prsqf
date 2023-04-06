import 'package:flutter/material.dart';
import 'package:prsqf/components/model/note_model.dart';

class NoteProvider with ChangeNotifier {
  List<NoteModel> _items = [];

  List<NoteModel> get item {
    return [..._items];
  }

  addNote(NoteModel noteModel) {
    _items.add(noteModel);
    notifyListeners();
  }

  deleteNote(int id) {
    _items.removeWhere((element) => element.id == id);
    notifyListeners();
  }
}
