import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
              color: vm.setMeterColor(),
              height: Provider.of<TimerViewModel>(context)
                  .setHeight(MediaQuery.of(context).size.height),
            ),
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Consumer<TimerViewModel>(builder: (context, value, child) {
              return Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: FittedBox(
                      child: Text(
                          Provider.of<TimerViewModel>(context, listen: false)
                              .calcCount(),
                          style: GoogleFonts.openSans(
                            fontSize: 300,
                            fontWeight: FontWeight.w700,
                          ))));
            }),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  width: 100, //横幅
                  height: 50, //高さ
                  child: ElevatedButton(
                    onPressed: vm.conf.count == 0
                        ? null
                        : vm.doingFlg
                            ? () => vm.stop()
                            : () => vm.start(),
                    child: vm.doingFlg ? Text("Stop") : Text("Start"),
                    style: ElevatedButton.styleFrom(
                        primary: vm.doingFlg ? Colors.red : Colors.green),
                  ),
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
                    child: Text(
                      "25 minutes",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )),
                DefaultButton(
                    onPressed: () => vm.setTime(300, 1),
                    child: Text(
                      "5 minutes",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )),
              ],
            )
          ],
        )
      ],
    );
  }
}
