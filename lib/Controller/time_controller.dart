import 'dart:async';
import 'package:focus_time/Controller/slider_controller.dart';
import 'package:get/get.dart';

class TimerController extends GetxController {
  late Timer _timer;
  int _currentRound = 1;

  late final RxInt _currentTimeInSeconds = 0.obs;

  final RxBool _isRunning = false.obs;
  final RxBool _isBreakTime = false.obs;

  @override
  void onInit() {
    resetTimer();
    super.onInit();
  }

  bool get isRunning => _isRunning.value;

  bool get isBreakTime => _isBreakTime.value;

  int get currentTimeInSeconds => _currentTimeInSeconds.value;

  int get maxTimeInSeconds =>
      (_isBreakTime.value
          ? (_currentRound == SliderController.roundSliderValue
              ? SliderController.longBreakDurationSliderValue
              : SliderController.shortBreakDurationSliderValue)
          : SliderController.studyDurationSliderValue) *
      60;

  bool get isEqual => currentTimeInSeconds == maxTimeInSeconds;

  String get currentTimeDisplay {
    int minutes = _currentTimeInSeconds.value ~/ 60;
    int seconds = _currentTimeInSeconds.value % 60;
    return '$minutes:${seconds.toString().padLeft(2, '0')}';
  }

  String get currentRoundDisplay {
    return 'Round $_currentRound of ${SliderController.roundSliderValue}';
  }

  void toggleTimer() {
    if (!_isRunning.value) {
      _isRunning.value = true;
      _timer = Timer.periodic(const Duration(seconds: 1), _updateTimer);
    } else {
      _timer.cancel();
      _isRunning.value = false;
    }
  }

  void jumpNextRound() {
    if (_isRunning.value) {
      _timer.cancel();
      _isRunning.value = false;
    }

    _timeControl();
  }

  void _timeControl() {
    if (_isBreakTime.value) {
      _currentTimeInSeconds.value =
          SliderController.studyDurationSliderValue * 60;
      _addRound();
    } else {
      if (_currentRound == SliderController.roundSliderValue) {
        _currentTimeInSeconds.value =
            SliderController.longBreakDurationSliderValue * 60;
      } else {
        _currentTimeInSeconds.value =
            SliderController.shortBreakDurationSliderValue * 60;
      }
    }

    toggleTimer();
    _isBreakTime.value = !_isBreakTime.value;
  }

  void _updateTimer(Timer timer) {
    if (_currentTimeInSeconds.value > 0) {
      _currentTimeInSeconds.value--;
    } else {
      _timer.cancel(); // previous timer
      _isRunning.value = false;

      _timeControl();
    }
  }

  void _addRound() {
    _currentRound < SliderController.roundSliderValue
        ? _currentRound++
        : _currentRound = 1;
  }

  void resetTimer() {
    _currentTimeInSeconds.value = maxTimeInSeconds;
  }

  @override
  void onClose() {
    _timer.cancel();
    super.onClose();
  }
}
