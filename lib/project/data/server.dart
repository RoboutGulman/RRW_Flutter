import 'package:http/http.dart' as http;
import '../domain/rating/post_rating.dart';

const String SERVER = 'https://rrw-test.herokuapp.com';

class RateChangeRepository {
  Future<GameRating> getGameRatingInfo() async {
    final Uri url = Uri.parse('$SERVER/game/get-rating');

    final http.Response response = await http.get(url);

    if (response.statusCode == 200) {
      return gameRatingFromJson(response.body);
    } else {
      throw Exception(
          'statusCode: ${response.statusCode}, tried getGameRating');
    }
  }
}

class AvailableTeamRepository {
  static Future<List<int>> generateAvailableTeam(int steps) async {
    final Uri url = Uri.parse('$SERVER/game/get-team');

    List<int> availableTeamId = List<int>.generate(13, (index) => index++);
    //TODO:
    //ипользовать заместо генерации следующее:
    //final http.Response response = await http.get(url);

    //if (response.statusCode == 200) {
    //  return fromJson(response.body);
    //} else {
    //  throw Exception(
    //    'statusCode: ${response.statusCode}, tried getGameRating');
    //}

    List<int> generate() {
      if (steps > 13) {
        print('Too many steps');
        return availableTeamId;
      } else if (steps >= 0) {
        steps = 13 - steps;
      }

      for (var i = 0; i < steps; i++) {
        availableTeamId.shuffle();
        availableTeamId.removeLast();
      }

      availableTeamId.sort();

      return availableTeamId;
    }

    return generate();
  }
}
