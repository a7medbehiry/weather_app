import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weatherapp/models/weather_model.dart';
import 'package:weatherapp/services/weather_service.dart';

class GetWeatherCubit extends Cubit<WeatherState> {
  GetWeatherCubit() : super(WeatherInitialState());
  WeatherModel? weatherModel;
  getWeather({required String cityName}) async {
    try {
      weatherModel = await WeatherService(Dio()).getWeather(
        cityName: cityName,
      );
      emit(
        WeatherLoadedSuccessfulState(
          weatherModel!,
        ),
      );
    } catch (e) {
      emit(
        WeatherFailureState(
          e.toString(),
        ),
      );
    }
  }
}
