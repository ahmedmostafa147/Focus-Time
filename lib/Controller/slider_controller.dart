import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SliderController extends GetxController {
  late SharedPreferences _sharedPreferences;
  static late RxInt _studyDurationSliderValue;
  static late RxInt _shortBreakDurationSliderValue;
  static late RxInt _longBreakDurationSliderValue;
  static late RxInt _roundSliderValue;

  @override
  void onInit() {
    super.onInit();
    _studyDurationSliderValue = 25.obs;
    _shortBreakDurationSliderValue = 5.obs;
    _longBreakDurationSliderValue = 15.obs;
    _roundSliderValue = 4.obs;
    loadSliderFromSharedPref();
  }

  static int get studyDurationSliderValue => _studyDurationSliderValue.value;
  static int get shortBreakDurationSliderValue =>
      _shortBreakDurationSliderValue.value;
  static int get longBreakDurationSliderValue =>
      _longBreakDurationSliderValue.value;
  static int get roundSliderValue => _roundSliderValue.value;

  void updateWorkDurationSliderValue(int newValue) {
    _studyDurationSliderValue.value = newValue;
    saveSliderToSharedPref('studyDurationSliderValue', newValue);
  }

  void updateShortBreakDurationSliderValue(int newValue) {
    _shortBreakDurationSliderValue.value = newValue;
    saveSliderToSharedPref('shortBreakDurationSliderValue', newValue);
  }

  void updateLongBreakDurationSliderValue(int newValue) {
    _longBreakDurationSliderValue.value = newValue;
    saveSliderToSharedPref('longBreakDurationSliderValue', newValue);
  }

  void updateRoundSliderValue(int newValue) {
    _roundSliderValue.value = newValue;
    saveSliderToSharedPref('roundSliderValue', newValue);
  }

  Future<void> createSharedPrefObject() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  void saveSliderToSharedPref(String key, int value) {
    _sharedPreferences.setInt(key, value);
  }

  Future<void> loadSliderFromSharedPref() async {
    await createSharedPrefObject();
    _studyDurationSliderValue.value =
        _sharedPreferences.getInt('studyDurationSliderValue') ?? 25;
    _shortBreakDurationSliderValue.value =
        _sharedPreferences.getInt('shortBreakDurationSliderValue') ?? 5;
    _longBreakDurationSliderValue.value =
        _sharedPreferences.getInt('longBreakDurationSliderValue') ?? 15;
    _roundSliderValue.value = _sharedPreferences.getInt('roundSliderValue') ?? 4;
  }
}
