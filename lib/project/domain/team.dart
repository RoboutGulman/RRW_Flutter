class Team implements Comparable {
  Team({
    required this.fractionId,
    required this.id,
    required this.name,
  });

  final int fractionId;
  final int id;
  late String name;

  List<int> stats = [0, 0, 0];

  int rating = 0;
  int ratingDynamic = 0;

  @override
  int compareTo(dynamic other) {
    other as Team;

    if (rating < other.rating) {
      return 1;
    }

    if (rating > other.rating) {
      return -1;
    }

    return 0;
  }
}
