import 'dart:developer';

import 'package:dio/dio.dart';

import 'package:weather_app/models/weather_model.dart';

class WeatherService {
  final Dio dio;

  final String baseUrl = 'http://api.weatherapi.com/v1';
  // set your API key that is associated with your registered account here
  final String apiKey = '';

  WeatherService(this.dio);

  Future<WeatherModel> getCurrentWeather({required String cityName}) async {
    try {
      Response response = await dio
          .get('$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=1');

      WeatherModel weatherModel = WeatherModel.fromJSON(response.data);

      return weatherModel;
    } on DioException catch (e) {
      final String errorMessage = e.response?.data['error']['message'] ??
          'Oops, there was an error, try again later...';

      throw Exception(errorMessage);
    } catch (e) {
      log(e.toString());

      throw Exception('Oops, there was an error, try again later...');
    }
  }
}
