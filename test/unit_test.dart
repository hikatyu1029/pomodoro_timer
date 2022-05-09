import 'dart:math';

import 'package:flutter_test/flutter_test.dart';
import 'package:pomodoro_timer/Timer/timer_view_model.dart';

void main() {
  test("timer_view_model", () {
    var vm = TimerViewModel();
    vm.start();
    expect(vm.doingFlg, true);

    vm.stop();
    expect(vm.doingFlg, false);

    int c = vm.count;
    vm.countDownStart();
    expect(vm.count, c - 1);

    vm.reset();
    expect(vm.doingFlg, false);

    vm.setTime(500, 1);
    expect(vm.setCount, 500);
    expect(vm.mode, 1);

    expect(vm.calcCount(), vm.addZero(500 ~/ 60) + ":" + vm.addZero(500 % 60));

    expect(vm.addZero(1), "01");
    expect(vm.addZero(10), "10");
  });
}
