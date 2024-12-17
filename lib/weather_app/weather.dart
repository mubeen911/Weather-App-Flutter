class Weather {
  final String cityName;
  final double temperature;
  final double windSpeed;
  final int humidity;
  final String description;
 final double ?tempMax;
 final double ?tempMin;
  Weather({
    required this.cityName,
    required this.temperature,
    required this.windSpeed,
    required this.humidity,
    required this.description,
    required this.tempMax,
    required this.tempMin,
  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      tempMax: json['main']['temp_min'],
      tempMin: json['main']['temp_max'],
      cityName: json['name'],
      temperature: json['main']['temp'].toDouble(),
      windSpeed: json['wind']['speed'].toDouble(),
      humidity: json['main']['humidity'],
      description: json['weather'][0]['description'],
    );}}