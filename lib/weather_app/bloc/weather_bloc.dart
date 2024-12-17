import 'package:design/weather_app/bloc/weater_event.dart';
import 'package:design/weather_app/bloc/weather_state.dart';
import 'package:design/weather_app/weather_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherRepository weatherRepository;

  WeatherBloc(this.weatherRepository) : super(WeatherInitial()) {
    on<FetchWeather>((event, emit) async {
      emit(WeatherLoading());
      try {
        
        final cityId = await weatherRepository.fetchCityId(event.cityName);
        
       
        final weather = await weatherRepository.fetchWeather(cityId);
        emit(WeatherLoaded(weather));
      } catch (e) {
        emit(WeatherError('Could not fetch weather.'));
      }
    });
  }
}