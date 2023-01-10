import 'dart:convert';

import 'package:covid_tracker/Services/Utilities/app_url.dart';
import 'package:http/http.dart' as http;
import 'package:covid_tracker/Models/World_statsModel.dart';

class StatsServices{
  Future<WorldStatsModel> fetchWorldStatsRecords () async{
    final response = await http.get(Uri.parse(AppUrl.worldstatsApi));

    if(response.statusCode==200){
      var data = jsonDecode(response.body);
      return WorldStatsModel.fromJson(data);
    }
    else{
      throw Exception('Error');
    }
  }

  Future<List<dynamic>> countrieslistApi () async{
    var data ;
    final response = await http.get(Uri.parse(AppUrl.countrieslist));

    if(response.statusCode==200){
      data = jsonDecode(response.body);
      return data;
    }
    else{
      throw Exception('Error');
    }
  }
}