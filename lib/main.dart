import 'package:design/bloc/counter_block.dart';
import 'package:design/bloc/counter_event.dart';
import 'package:design/bloc/counter_state.dart';
import 'package:design/chats.dart';
import 'package:design/weather_app/bloc/weather_bloc.dart';
import 'package:design/weather_app/home_screen.dart';
import 'package:design/weather_app/weather_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
         home: MultiBlocProvider(
         providers: [
          BlocProvider<WeatherBloc>(
         create: (context) => WeatherBloc(WeatherRepository())),
           BlocProvider(
            create: (context) => CounterBlock(),
           ),
         ],
          child:  const HomeScreen(),
        )
        );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.data});

  final String data;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.data),
          centerTitle: true,
        ),
        body: Center(child: BlocBuilder<CounterBlock, CounterState>(
          builder: (context, state) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'You have pushed the button this many times:',
                ),
                Text(
                  state.value.toString(),
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ],
            );
          },
        )),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              onPressed: () =>
                  context.read<CounterBlock>().add(CounterIncrement()),
              tooltip: 'Increment',
              child: const Icon(Icons.add),
            ),
            const SizedBox(
              width: 10,
            ),
            FloatingActionButton(
              onPressed: () =>
                  context.read<CounterBlock>().add(CounterDecrement()),
              tooltip: 'Decrement',
              child: const Icon(Icons.remove),
            ),
          ],
        ));
  }
}
