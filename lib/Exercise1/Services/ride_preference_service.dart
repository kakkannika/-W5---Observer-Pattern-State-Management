import 'package:flutter_full/Exercise1/Listener/ride_preferences_listener.dart';
import 'package:flutter_full/Exercise1/model/ride_pref/ride_pref.dart';

class RidePreferencesService {
  RidePreference?  _currentPref;
  final List<RidePreferencesListener> _listeners = [];

  // Getter for current preference
  RidePreference? get currentPreference => _currentPref;


  // Add a listener to the list
  void addListener(RidePreferencesListener listener) {
    _listeners.add(listener);
  }

  // Remove a listener from the list
  void removeListener(RidePreferencesListener listener) {
    _listeners.remove(listener);
  }

 // Notify all listeners about the change
  void notifyListeners(RidePreference preference) {
    _listeners.forEach((listener) {
      listener.onPreferenceSelected(preference);
    });
  }

   // Method to set a new preference and notify listeners
  void selectPreference(RidePreference preference) {
    _currentPref = preference;
    notifyListeners(preference);
  }
}