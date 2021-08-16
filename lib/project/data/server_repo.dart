import 'package:http/http.dart' as http;
import '../models/post_rating.dart';

const String SERVER = 'https://rrw-test.herokuapp.com';

class RateChangeRepository {
  Future<GameRating> getGameRatingInfo() async {
    final url = Uri.parse("$SERVER/game/get-rating");

    final response = await http.get(url);

    if (response.statusCode == 200) {
      return gameRatingFromJson(response.body);
    } else {
      throw Exception(
        'statusCode: ${response.statusCode}, tried getGameRating');
    }
  }
}