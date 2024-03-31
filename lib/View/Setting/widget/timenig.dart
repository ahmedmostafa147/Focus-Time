import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:focus_time/Controller/slider_controller.dart';
import 'package:focus_time/Controller/time_controller.dart';
import 'package:get/get.dart';

class TimeAndRoundWidget extends StatelessWidget {
  const TimeAndRoundWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final SliderController sliderController = Get.put(SliderController());
    return Column(
      children: [
        Obx(() => DurationWidget(
              divisions: 12,
              title: 'Study Duration',
              sliderValue: SliderController.studyDurationSliderValue,
              max: 60,
              min: 1,
              updateValue: (newValue) {
                sliderController.updateWorkDurationSliderValue(newValue);
              },
              minText: 'min',
            )),
        Obx(() => DurationWidget(
              divisions: 6,
              title: 'Short break duration',
              sliderValue: SliderController.shortBreakDurationSliderValue,
              max: 30,
              min: 1,
              updateValue: (newValue) {
                sliderController.updateShortBreakDurationSliderValue(newValue);
              },
              minText: 'min',
            )),
        Obx(() => DurationWidget(
              divisions: 8,
              title: 'Long break duration',
              sliderValue: SliderController.longBreakDurationSliderValue,
              max: 45,
              min: 1,
              updateValue: (newValue) {
                sliderController.updateLongBreakDurationSliderValue(newValue);
              },
              minText: 'min',
            )),
        Obx(() => DurationWidget(
              divisions: 8,
              title: 'Rounds',
              sliderValue: SliderController.roundSliderValue,
              max: 10,
              min: 2,
              updateValue: (newValue) {
                sliderController.updateRoundSliderValue(newValue);
              },
              minText: '',
            )),
      ],
    );
  }
}

class DurationWidget extends StatelessWidget {
  const DurationWidget({
    super.key,
    required this.title,
    required this.sliderValue,
    required this.max,
    required this.min,
    required this.updateValue,
    required this.minText,
    required this.divisions,
  });

  final String title;
  final double max;
  final double min;
  final int sliderValue;
  final String minText;
  final int divisions;
  final void Function(int newValue) updateValue;

  @override
  Widget build(BuildContext context) {
    final TimerController timerController = Get.find<TimerController>();

    // Define a variable to hold the slider label
    String sliderLabel = "$sliderValue";

    return Column(
      children: [
        SizedBox(
          height: 70.h,
          child: Stack(
            children: [
              TextWithPadding(text: title),
              SizedBox(height: 20.0.h),
              Slider(
                divisions: divisions,
                label: sliderLabel, // Use the sliderLabel variable here
                max: max,
                min: min,
                value: sliderValue.toDouble(),
                onChanged: (value) {
                  // Update the slider value and label
                  updateValue(value.toInt());
                  sliderLabel = "${value.toInt()} $minText";
                  timerController.resetTimer();
                },
              ),
              Align(
                alignment: AlignmentDirectional.topEnd,
                child: Text(
                  sliderLabel, // Display the slider label here
                ),
              ),
              Align(
                alignment: AlignmentDirectional.bottomStart,
                child: Text('${min.toInt()} $minText'),
              ),
              Align(
                alignment: AlignmentDirectional.bottomEnd,
                child: Text('${max.toInt()} $minText'),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class TextWithPadding extends StatelessWidget {
  const TextWithPadding({
    required this.text,
    super.key,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Text(text, style: Theme.of(context).textTheme.headline6),
    );
  }
}
