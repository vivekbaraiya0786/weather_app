class Album {
  int userId;
  int id;
  String title;

  Album({
    required this.userId,
    required this.id,
    required this.title,
  });

  factory Album.frommap({required Map data}) {
    return Album(
      userId: data['userId'],
      id: data['id'],
      title: data['title'],
    );
  }
}
