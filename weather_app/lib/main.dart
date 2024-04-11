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
    if (weatherCondition == null) return Colors.cyan;
    switch (weatherCondition) {
      case 'Sunny':
        return Colors.amber;
      case 'Partly cloudy':
        return Colors.orange;
      case 'Mist':
      case 'Fog':
      case 'Freezing fog':
        return Colors.blueGrey;
      case 'Patchy rain possible':
      case 'Patchy light drizzle':
      case 'Light drizzle':
      case 'Patchy light rain':
      case 'Light rain':
      case 'Patchy snow possible':
      case 'Patchy light snow':
      case 'Light snow':
        return Colors.lightBlue;
      case 'Patchy sleet possible':
      case 'Patchy freezing drizzle possible':
      case 'Freezing drizzle':
      case 'Heavy freezing drizzle':
      case 'Light freezing rain':
      case 'Moderate or heavy freezing rain':
      case 'Light sleet':
      case 'Moderate or heavy sleet':
      case 'Ice pellets':
      case 'Patchy light rain with thunder':
      case 'Moderate or heavy rain with thunder':
      case 'Patchy light snow with thunder':
      case 'Moderate or heavy snow with thunder':
      case 'Heavy rain at times':
      case 'Heavy rain':
      case 'Torrential rain shower':
      case 'Heavy snow':
      case 'Light rain shower':
      case 'Light sleet showers':
      case 'Light snow showers':
      case 'Light showers of ice pellets':
        return Colors.blue;
      case 'Thundery outbreaks possible':
        return Colors.yellow;
      case 'Blowing snow':
      case 'Blizzard':
      case 'Patchy moderate snow':
      case 'Moderate snow':
      case 'Patchy heavy snow':
      case 'Moderate or heavy snow showers':
      case 'Moderate or heavy showers of ice pellets':
      case 'Cloudy':
      case 'Overcast':
        return Colors.grey;
      default:
        return Colors.cyan;
    }
  }
}
