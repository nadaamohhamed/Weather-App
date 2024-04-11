import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather_app/screens/home_screen.dart';

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubit(),
      child: Builder(builder: (context) {
        return BlocBuilder<GetWeatherCubit, WeatherState>(
          builder: (context, state) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                useMaterial3: false,
                primarySwatch: getColorTheme(
                  BlocProvider.of<GetWeatherCubit>(context)
                      .weatherModel
                      ?.weatherCondition,
                ),
              ),
              home: const HomeScreen(),
            );
          },
        );
      }),
    );
  }

  MaterialColor getColorTheme(String? weatherCondition) {
    if (weatherCondition == null) {
      return Colors.cyan;
    }
    switch (weatherCondition) {
      case 'Sunny':
        return Colors.amber;
      case 'Partly cloudy':
        return Colors.orange;
      case 'Fog':
      case 'Freezing fog':
        return Colors.blueGrey;
      case 'Patchy light rain':
      case 'Light rain':
      case 'Patchy light snow':
      case 'Light snow':
        return Colors.lightBlue;
      case 'Light freezing rain':
      case 'Moderate or heavy freezing rain':
      case 'Heavy rain':
      case 'Heavy snow':
        return Colors.blue;
      case 'Thundery outbreaks possible':
        return Colors.yellow;
      case 'Blizzard':
      case 'Moderate snow':
      case 'Cloudy':
        return Colors.grey;
      default:
        return Colors.cyan;
    }
  }
}
