class TodoItem {
  String title;
  String description;
  bool completed;

  TodoItem(
      {required this.title, this.completed = false, required this.description});
}