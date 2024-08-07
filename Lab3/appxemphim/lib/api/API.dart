import 'dart:convert';

import 'package:appxemphim/constants.dart';
import 'package:appxemphim/models/phim.dart';
import 'package:appxemphim/widgets/phimhot.dart';
import 'package:http/http.dart' as http;

class API {
  static const URL = 'https://api.themoviedb.org/3/trending/all/day?api_key=${Constants.apiKey}';

  Future<List<Phim>> getPhimHot() async{
final response = await http.get(Uri.parse(URL));
if(response.statusCode == 200){
  final decodedData = json.decode(response.body)['results'] as List;
return decodedData.map((phim)=> Phim.fromJson(phim)).toList();
} else
{
  throw Exception('Co gi do khong on');
}
  }
}