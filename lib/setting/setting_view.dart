import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pomodoro_timer/Component/default_button.dart';
import 'package:pomodoro_timer/Timer/timer_view_model.dart';
import 'package:provider/provider.dart';

import '../Config/config.dart';
import 'setting_view_model.dart';

class SettingView extends StatelessWidget {
  const SettingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => SettingViewModel())
      ],
      child: SettingViewBody(),
    ));
  }
}

class SettingViewBody extends StatelessWidget {
  @override
  var conf = Config();
  late TextEditingController _workTimeController;
  late TextEditingController _restTimeController;
  Widget build(BuildContext context) {
    var vm = Provider.of<SettingViewModel>(context, listen: false);
    _workTimeController = new TextEditingController(
        text: (conf.workTime / 60).round().toString());
    _restTimeController = new TextEditingController(
        text: (conf.restTime / 60).round().toString());
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          children: [
            Text("Work Time"),
            Expanded(
                child: TextFormField(
                    controller: _workTimeController,
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly]))
          ],
        ),
        Row(
          children: [
            Text("Rest Time"),
            Expanded(
                child: TextFormField(
                    controller: _restTimeController,
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly]))
          ],
        ),
        ElevatedButton(
            onPressed: () => {
                  conf.workTime = int.parse(_workTimeController.text) * 60,
                  conf.restTime = int.parse(_restTimeController.text) * 60,
                  Navigator.pop(context)
                },
            child: Text("Save"))
      ],
    ));
  }
}
