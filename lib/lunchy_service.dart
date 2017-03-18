import 'dart:async';
import 'dart:convert';

import 'package:angular2/core.dart';
import 'package:http/browser_client.dart';

import 'lunch_place.dart';
import 'package:lunchy_ui/lunch.dart';

@Injectable()
class LunchyService {
  final BrowserClient _http;

  LunchyService(this._http);

  Future<List<LunchPlace>> getLunchPlaces() async {
    final response = await _http.get("https://lunchy.nu/lunch");
    final List<Map<String, dynamic>> json = JSON.decode(response.body);
    return json.map((lunchPlace) => new LunchPlace.fromJson(lunchPlace)).toList();
  }

  Future<Lunch> getLunches(final String uri) async {
    final response = await _http.get(uri);
    final Map<String, dynamic> json = JSON.decode(response.body);
    return new Lunch.fromJson(json);
  }
}