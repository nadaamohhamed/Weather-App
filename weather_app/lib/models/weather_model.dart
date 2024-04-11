class WeatherModel {
  final String cityName;
  final DateTime date;
  final double temp;
  final double minTemp;
  final double maxTemp;
  final String weatherCondition;
  final String? image;

  WeatherModel({
    required this.cityName,
    required this.date,
    required this.temp,
    required this.minTemp,
    required this.maxTemp,
    required this.weatherCondition,
    this.image,
  });

  factory WeatherModel.fromJSON(Map<String, dynamic> json) {
    return WeatherModel(
      cityName: json['location']['name'] as String,
      date: DateTime.parse(json['current']['last_updated']),
      temp: json['forecast']['forecastday'][0]['day']['avgtemp_c'] as double,
      minTemp: json['forecast']['forecastday'][0]['day']['mintemp_c'] as double,
      maxTemp: json['forecast']['forecastday'][0]['day']['maxtemp_c'] as double,
      weatherCondition: json['forecast']['forecastday'][0]['day']['condition']
          ['text'] as String,
      image: json['forecast']['forecastday'][0]['day']['condition']['icon']
          as String,
    );
  }
}
