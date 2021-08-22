import 'dart:convert';

GameRating gameRatingFromJson(String str) => GameRating.fromJson(json.decode(str));

String gameRatingToJson(GameRating data) => json.encode(data.toJson());

class GameRating {
  factory GameRating.fromJson(Map<String, dynamic> json) => GameRating(
    railways: List<TeamInfo>.from(json["railways"].map((x) => TeamInfo.fromJson(x))),
    policies: List<TeamInfo>.from(json["policies"].map((x) => TeamInfo.fromJson(x))),
    tradingCompanies: List<TeamInfo>.from(json["tradingCompanies"].map((x) => TeamInfo.fromJson(x))),
  );

  GameRating({
    required this.railways,
    required this.policies,
    required this.tradingCompanies,
  });

  List<TeamInfo> railways;
  List<TeamInfo> policies;
  List<TeamInfo> tradingCompanies;

  Map<String, dynamic> toJson() => {
    "railways": List<dynamic>.from(railways.map((TeamInfo x) => x.toJson())),
    "policies": List<dynamic>.from(policies.map((TeamInfo x) => x.toJson())),
    "tradingCompanies": List<dynamic>.from(tradingCompanies.map((TeamInfo x) => x.toJson())),
  };

  static const int RR_FRACTION_ID = 0;
  static const int PR_FRACTION_ID = 1;
  static const int TK_FRACTION_ID = 2;

  List<TeamInfo> getFractionInfoBy(int fractionId) {
    switch (fractionId) {
      case RR_FRACTION_ID:
        return this.railways;        
      case PR_FRACTION_ID:
        return this.policies;
      case TK_FRACTION_ID:
        return this.tradingCompanies;
    }
    return [];
  }

}

class TeamInfo {
  TeamInfo({
    required this.teamName,
    required this.ratingChange1,
    required this.ratingChange2,
    required this.ratingChange3,
    required this.rating,
  });

  factory TeamInfo.fromJson(Map<String, dynamic> json) => TeamInfo(
    teamName: json["team_name"],
    ratingChange1: json["ratingChange1"],
    ratingChange2: json["ratingChange2"],
    ratingChange3: json["ratingChange3"],
    rating: json["rating"],
  );

  String teamName;
  int ratingChange1;
  int ratingChange2;
  int ratingChange3;
  int rating;

  Map<String, dynamic> toJson() => <String, dynamic>{
    "team_name": teamName,
    "ratingChange1": ratingChange1,
    "ratingChange2": ratingChange2,
    "ratingChange3": ratingChange3,
    "rating": rating,
  };

  List<int> getStatsInfo() {
    List<int> statsInfo = [];
    statsInfo.add(this.ratingChange1);
    statsInfo.add(this.ratingChange2);
    statsInfo.add(this.ratingChange3);
    return statsInfo;
  }
  
}

abstract class PostResult {}

class GameRatingResultSuccess extends PostResult {
  late GameRating postList;
  GameRatingResultSuccess(this.postList);
}

class GameRatingResultFailure extends PostResult {
  late String error;
  GameRatingResultFailure(this.error);
}

class GameRatingResultLoading extends PostResult {
  GameRatingResultLoading();
}