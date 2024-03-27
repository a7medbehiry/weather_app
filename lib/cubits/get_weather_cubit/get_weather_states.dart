import 'package:weatherapp/models/weather_model.dart';

class WeatherState {}

// NoWeatherState
class WeatherInitialState extends WeatherState {}

class WeatherLoadedSuccessfulState extends WeatherState {
  final WeatherModel weatherModel;

  WeatherLoadedSuccessfulState(this.weatherModel);
}

class WeatherFailureState extends WeatherState {
  final String errorMessage;

  WeatherFailureState(this.errorMessage);
}
