
import 'package:flutter_full/Exercise1/Listener/ride_preferences_listener.dart';
import 'package:flutter_full/Exercise1/model/ride_pref/ride_pref.dart';


class ConsoleLogger implements RidePreferencesListener {
  void onPreferenceSelected(RidePreference selectedPreference) {
  print('Preference changed: $selectedPreference');

}
}