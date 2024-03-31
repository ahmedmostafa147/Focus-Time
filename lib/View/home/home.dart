import 'package:flutter/material.dart';
import 'package:focus_time/View/Setting/widget/timenig.dart';
import 'package:focus_time/View/home/widget/row_button.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Focus Time'),
      ),
      body: const SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Column(
              children: [
                TimeIndicatorWidget(),
                SizedBox(height: 20),
                TimeAndRoundWidget(),
                ElevationsButtons(),
                RoundsWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
