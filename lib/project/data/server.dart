import 'package:http/http.dart' as http;
import '../domain/post_rating.dart';

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