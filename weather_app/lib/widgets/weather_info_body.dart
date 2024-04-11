import 'package:flutter/material.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherInfoBody extends StatelessWidget {
  const WeatherInfoBody({
    super.key,
    required this.weatherModel,
  });

  final WeatherModel weatherModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomLeft,
            colors: [
              Theme.of(context).primaryColor,
              Theme.of(context).secondaryHeaderColor,
              // getColorTheme(weatherModel.weatherCondition),
              // getColorTheme(weatherModel.weatherCondition)[300],
              // getColorTheme(weatherModel.weatherCondition)[50],
            ]),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              weatherModel.cityName,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 45,
              ),
            ),
            const SizedBox(
              height: 32,
            ),
            Text(
              'Last updated at: ${weatherModel.date.hour}:${weatherModel.date.minute}',
              style: const TextStyle(
                fontSize: 20,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(28),
              child: Text(
                '${weatherModel.temp.round().toString()}°',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 70,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.network(
                  'https:${weatherModel.image!}',
                ),
                Column(
                  children: [
                    Text(
                      'H: ${weatherModel.maxTemp.round()}°',
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      'L: ${weatherModel.maxTemp.round()}°',
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 32,
            ),
            Text(
              weatherModel.weatherCondition,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 28,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
