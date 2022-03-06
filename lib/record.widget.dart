import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:social_battery/main.dart';

enum BatteryLevels {
  one,
  two,
  three,
  four,
  five,
}

class Record extends ConsumerWidget {
  final StateProvider<BatteryLevels> levelProvider = StateProvider((_) => BatteryLevels.five);
  final StateProvider<String> reasonProvider = StateProvider((_) => '');

  @override
  Widget build(BuildContext context, ref) {
    ref.watch(levelProvider);
    // TODO choose battery level icon
    // TODO text input "what do you think caused this to go up/down?"
    return Column(
      children: <Widget>[
        ListTile(
          title: RotatedBox(quarterTurns: 1, child: Icon(Icons.battery_full)),
          leading: Radio<BatteryLevels>(
            value: BatteryLevels.five,
            groupValue: ref.read(levelProvider.state).state,
            onChanged: onChange(ref),
          ),
        ),
        ListTile(
          title: Text(BatteryLevels.four.name),
          // title: RotatedBox(quarterTurns: 1, child: Icon(Icons.battery_4_bar_outlined)),
          leading: Radio<BatteryLevels>(
            value: BatteryLevels.four,
            groupValue: ref.read(levelProvider.state).state,
            onChanged: onChange(ref),
          ),
        ),
        ListTile(
          title: Text(BatteryLevels.three.name),
          leading: Radio<BatteryLevels>(
            value: BatteryLevels.three,
            groupValue: ref.read(levelProvider.state).state,
            onChanged: onChange(ref),
          ),
        ),
        ListTile(
          title: Text(BatteryLevels.two.name),
          leading: Radio<BatteryLevels>(
            value: BatteryLevels.two,
            groupValue: ref.read(levelProvider.state).state,
            onChanged: onChange(ref),
          ),
        ),
        ListTile(
          title: Text(BatteryLevels.one.name),
          leading: Radio<BatteryLevels>(
            value: BatteryLevels.one,
            groupValue: ref.read(levelProvider.state).state,
            onChanged: onChange(ref),
          ),
        ),
        ListTile(
          title: TextField(maxLines: 2,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Why do you think that is? Did it go up or down? Why?', // TODO
            ),
            onChanged: (val) {
              ref.read(reasonProvider.state).state = val;
            },
          ),
        ),
        ElevatedButton(
          onPressed: () {
            print('${ref.read(levelProvider.state).state}, ${ref.read(reasonProvider.state).state}');
            ref.read(pageProvider.state).state = 0;
          },
          child: Text('Done'),
        )
      ],
    );
  }

  onChange(WidgetRef ref) {
    return (BatteryLevels? val) {
      print(val);
      if (val != null) {
        ref.read(levelProvider.state).state = val;
      }
    };
  }
}
