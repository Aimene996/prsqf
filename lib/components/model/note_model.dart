class NoteModel {
  final int id;
  final String title;
  final String content;
  String? description;

  NoteModel({
    required this.id,
    required this.title,
    required this.content,
    this.description,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'content': content,
      'description': description,
    };
  }

  @override
  String toString() {
    return 'Note{id:$id , title: $title , content:$content , description:$description}';
  }
}
