import 'package:design/weather_app/weather.dart';
import 'package:flutter/material.dart';

class WeatherInfo extends StatelessWidget {
  final Weather weather;

  const WeatherInfo({super.key, required this.weather});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        width: double.infinity,
        child: Card(
          elevation: 8,
          margin: const EdgeInsets.symmetric(horizontal: 26.0, vertical: 10.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          color: Colors.blue[50],
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    weather.cityName,
                    style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                ),
                const Divider(thickness: 1, color: Colors.grey),
                const SizedBox(height: 10),
                _buildWeatherDetailRow(
                  icon: Icons.thermostat,
                  label: 'Temperature',
                  value: '${weather.temperature}°C',
                ),
                _buildWeatherDetailRow(
                  icon: Icons.water_drop,
                  label: 'Humidity',
                  value: '${weather.humidity}%',
                ),
                _buildWeatherDetailRow(
                  icon: Icons.air,
                  label: 'Wind Speed',
                  value: '${weather.windSpeed} m/s',
                ),
                _buildWeatherDetailRow(
                  icon: Icons.description,
                  label: 'Description',
                  value: weather.description,
                ),
                _buildWeatherDetailRow(
                  icon: Icons.sunny,
                  label: 'Max Temperature',
                  value: weather.tempMax.toString(),
                ),
                _buildWeatherDetailRow(
                  icon: Icons.thermostat,
                  label: 'Min Temperature',
                  value: weather.tempMin.toString(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildWeatherDetailRow({
    required IconData icon,
    required String label,
    required String value,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Row(
        children: [
          Icon(icon, color: Colors.blue, size: 24),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              label,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Text(
            value,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }
}
