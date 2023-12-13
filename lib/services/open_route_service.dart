import 'package:dio/dio.dart';
import 'package:map_flutter/env/env.dart';
import 'package:map_flutter/models/route.dart' as api_route;

class OpenRouteService {
  final _dio = Dio();

  Future<List<List<double>>>getRoute(double latStart,double longStart,double latEnd,double longEnd) async {
    String routeOption = apiOptions[0];
    try {
      String routeUrl = '$apiUrl/$routeOption?api_key=$apiKey&start=$latStart,$longStart&end=$latEnd,$longEnd';
      print(" MI PRIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIINT "+routeUrl);
      final Response response = await _dio.get(routeUrl);
      api_route.Route route = api_route.Route.fromJson(response.data);
      return route.features[0].geometry.coordinates;
    } catch (e) {
      rethrow;
    }
  }

}
