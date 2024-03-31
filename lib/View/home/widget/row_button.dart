import 'package:flutter/material.dart';
import 'package:focus_time/Controller/time_controller.dart';
import 'package:get/get.dart';
import 'package:numberpicker/numberpicker.dart';

class TimeIndicatorWidget extends StatefulWidget {
  const TimeIndicatorWidget({super.key});

  @override
  State<TimeIndicatorWidget> createState() => _TimeIndicatorWidgetState();
}

class _TimeIndicatorWidgetState extends State<TimeIndicatorWidget> {
  @override
  Widget build(BuildContext context) {
    final TimerController timerController = Get.find<TimerController>();
    return Container(
        padding: const EdgeInsets.only( bottom: 10.0, top: 10.0, left: 10.0, right: 10.0),
        decoration: BoxDecoration(
          color: Colors.black87,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                const Text(
                  "Minutes",
                  style: TextStyle(color: Colors.white),
                ),
                Obx(
                  () => NumberPicker(
                    textStyle:
                        const TextStyle(color: Colors.grey, fontSize: 20),
                    selectedTextStyle:
                        const TextStyle(color: Colors.white, fontSize: 30),
                    decoration: const BoxDecoration(
                      border: Border(
                          top: BorderSide(
                            color: Colors.white,
                          ),
                          bottom: BorderSide(color: Colors.white)),
                    ),
                    itemWidth: 80,
                    itemHeight: 60,
                    zeroPad: true,
                    infiniteLoop: true,
                    value: int.parse(
                        timerController.currentTimeDisplay.split(":")[0]),
                    minValue: 0,
                    maxValue: 60,
                    step: 1,
                    onChanged: (value) {
                      timerController.currentTimeDisplay;
                    },
                  ),
                ),
              ],
            ),
            Column(
              children: [
                const Text(
                  "Seconds",
                  style: TextStyle(color: Colors.white),
                ),
                Obx(
                  () => NumberPicker(
                    textStyle:
                        const TextStyle(color: Colors.grey, fontSize: 20),
                    selectedTextStyle:
                        const TextStyle(color: Colors.white, fontSize: 30),
                    decoration: const BoxDecoration(
                      border: Border(
                          top: BorderSide(
                            color: Colors.white,
                          ),
                          bottom: BorderSide(color: Colors.white)),
                    ),
                    itemWidth: 80,
                    itemHeight: 60,
                    zeroPad: true,
                    infiniteLoop: true,
                    value: int.parse(
                        timerController.currentTimeDisplay.split(":")[1]),
                    minValue: 0,
                    maxValue: 60,
                    step: 1,
                    onChanged: (value) {
                      timerController.currentTimeDisplay;
                    },
                  ),
                ),
              ],
            ),
          ],
        ));
  }
}

class StudyBreakWidget extends StatelessWidget {
  const StudyBreakWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(height: 10.0),
        TimeModeWidget(),
      ],
    );
  }
}

class TimeModeWidget extends StatelessWidget {
  const TimeModeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final TimerController timerController = Get.find<TimerController>();
    return Obx(() => Text(
          timerController.isBreakTime ? 'RELAX' : 'STUDY',
          style: Theme.of(context)
              .textTheme
              .headline6!
              .copyWith(fontWeight: FontWeight.bold),
        ));
  }
}

class TimeWidget extends StatelessWidget {
  const TimeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final TimerController timerController = Get.find<TimerController>();
    return Obx(() => Text(
          timerController.currentTimeDisplay,
          style: Theme.of(context)
              .textTheme
              .headline4!
              .copyWith(fontWeight: FontWeight.bold),
        ));
  }
}

class ElevationsButtons extends StatelessWidget {
  const ElevationsButtons({super.key});

  @override
  Widget build(BuildContext context) {
    final TimerController timerController = Get.find<TimerController>();
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        IconButton(
          onPressed:
              timerController.isEqual ? null : timerController.resetTimer,
          icon: const Icon(Icons.replay, size: 30.0),
        ),
        Obx(
          () => IconButton(
            onPressed: () => timerController.toggleTimer(),
            icon: Icon(
              timerController.isRunning ? Icons.pause : Icons.play_arrow,
              size: 45.0,
            ),
          ),
        ),
        IconButton(
          onPressed: () => timerController.jumpNextRound(),
          icon: const Icon(Icons.fast_forward, size: 30.0),
        ),
      ],
    );
  }
}

class RoundsWidget extends StatelessWidget {
  const RoundsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final TimerController timerController = Get.find<TimerController>();
    return Obx(() => Text(
          timerController.currentRoundDisplay,
          style: Theme.of(context).textTheme.headline6,
        ));
  }
}
