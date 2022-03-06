import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:social_battery/record.widget.dart';

void main() async {
  await Hive.initFlutter();
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO battery level history - as graph
    // TODO battery level history - as list view
    return Scaffold(
      appBar: AppBar(
        title: Text('Hello'),
      ),
      body: Body(),
    );
  }
}

final StateProvider<int> pageProvider = StateProvider((_) => 0);

class Body extends ConsumerWidget {
  List<Widget> pages(WidgetRef ref) {
    return [
      Container(
        child: Center(
          child: Column(
            children: [
              Spacer(),
              ElevatedButton(
                onPressed: () {
                  ref.read(pageProvider.state).state = 1;
                },
                child: Text('Record battery level'),
              ),
              Spacer(),
            ],
          ),
        ),
      ),
      Record(),
    ];
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int pageNumber = ref.watch(pageProvider);

    return pages(ref)[pageNumber];
  }
}
