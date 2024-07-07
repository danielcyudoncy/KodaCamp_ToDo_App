
class Task {
  String title;
  String description;
  DateTime dateCreated;
  bool isCompleted;

  Task({
    required this.title,
    required this.description,
    required this.dateCreated,
    this.isCompleted = false,
  });
}