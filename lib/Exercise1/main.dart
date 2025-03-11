import 'package:flutter_full/Exercise1/Services/ride_preference_service.dart';
import 'package:flutter_full/Exercise1/console_logger.dart';
import 'package:flutter_full/Exercise1/model/ride/locations.dart';
import 'package:flutter_full/Exercise1/model/ride_pref/ride_pref.dart';


void main() {
  // Create the service
  final RidePreferencesService service = RidePreferencesService();
  
  // Create and add the console logger
  final ConsoleLogger logger = ConsoleLogger();
  service.addListener(logger);
  
  
  // Create and select a preference
  final RidePreference preference = RidePreference(
    departure: const Location(name: "Siem Reab", country: Country.cambodia),
    departureDate: DateTime.now(),
    arrival: const Location(name: "Battambang", country: Country.cambodia),
    requestedSeats: 2
  );
  
  // This will trigger the notification
  service.selectPreference(preference);
  
  
}