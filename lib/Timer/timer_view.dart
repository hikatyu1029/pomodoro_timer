import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pomodoro_timer/Component/default_button.dart';
import 'package:pomodoro_timer/Timer/timer_view_model.dart';
import 'package:provider/provider.dart';

class TimerView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => TimerViewModel())
      ],
      child: TimerViewBody(),
    ));
  }
}

class TimerViewBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var vm = Provider.of<TimerViewModel>(context, listen: false);
    return Stack(
      fit: StackFit.expand,
      children: [
        Column(
          children: [
            Expanded(child:
                Consumer<TimerViewModel>(builder: (context, value, child) {
              return Container(
                color: vm.setColor(),
              );
            })),
            AnimatedContainer(
              duration: const Duration(milliseconds: 1000),
              color: Colors.yellow[400],
              height: Provider.of<TimerViewModel>(context)
                  .setHeight(MediaQuery.of(context).size.height),
            ),
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Consumer<TimerViewModel>(builder: (context, value, child) {
              return Text(
                Provider.of<TimerViewModel>(context, listen: false).calcCount(),
                style: TextStyle(fontSize: 52),
              );
            }),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  width: 100, //横幅
                  height: 50, //高さ
                  child: DefaultButton(
                    onPressed: () => vm.start(),
                    child: Text("Start"),
                  ),
                ),
                SizedBox(
                  width: 100, //横幅
                  height: 50, //高さ
                  child: DefaultButton(
                      onPressed: () => vm.stop(), child: Text("Stop")),
                ),
                SizedBox(
                    width: 100, //横幅
                    height: 50, //高さ
                    child: DefaultButton(
                        onPressed: () => vm.reset(), child: Text("Reset")))
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                DefaultButton(
                    onPressed: () => vm.setTime(1500, 0),
                    child: Text("25 minutes")),
                DefaultButton(
                    onPressed: () => vm.setTime(300, 1),
                    child: Text("5 minutes")),
              ],
            )
          ],
        )
      ],
    );
  }
}
