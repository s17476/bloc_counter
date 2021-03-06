import 'package:bloc_counter/constants/enums.dart';
import 'package:bloc_counter/logic/cubit/counter_cubit.dart';
import 'package:bloc_counter/logic/cubit/internet_cubit.dart';
import 'package:bloc_counter/presentation/screens/second_screen.dart';
import 'package:bloc_counter/presentation/screens/settings_screen.dart';
import 'package:bloc_counter/presentation/screens/third_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static const routeName = '/';

  final String title = 'Home screen';
  final Color color = Colors.blueAccent;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(SettingsScreen.routeName);
            },
            icon: const Icon(Icons.settings),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<InternetCubit, InternetState>(
                builder: (context, state) {
              final textStyle = Theme.of(context).textTheme.headline2;
              if (state is InternetConnected &&
                  state.connectionType == ConnectionType.wifi) {
                return Text(
                  'WiFi',
                  style: textStyle?.copyWith(color: Colors.blueAccent),
                );
              } else if (state is InternetConnected &&
                  state.connectionType == ConnectionType.mobile) {
                return Text(
                  'Mobile',
                  style: textStyle?.copyWith(color: Colors.greenAccent),
                );
              } else if (state is InternetDisconnected) {
                return Text(
                  'Disconnected',
                  style: textStyle?.copyWith(color: Colors.redAccent),
                );
              }
              return const CircularProgressIndicator();
            }),
            const Text('You have pushed the button this many times:'),
            const SizedBox(
              height: 16,
            ),
            BlocConsumer<CounterCubit, CounterState>(
              listener: (context, state) {
                if (state.wasIncremented) {
                  ScaffoldMessenger.of(context)
                    ..removeCurrentSnackBar()
                    ..showSnackBar(
                      const SnackBar(
                        content: Text('Incremented'),
                      ),
                    );
                } else if (!state.wasIncremented) {
                  ScaffoldMessenger.of(context)
                    ..removeCurrentSnackBar()
                    ..showSnackBar(
                      const SnackBar(
                        content: Text('Decremented'),
                      ),
                    );
                }
              },
              builder: (context, state) {
                return Text(
                  state.counterValue.toString(),
                  style: Theme.of(context).textTheme.headline4,
                );
              },
            ),
            const SizedBox(
              height: 24,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FloatingActionButton(
                  heroTag: '-',
                  onPressed: () {
                    BlocProvider.of<CounterCubit>(context).decrement();
                  },
                  tooltip: 'Decrement',
                  child: const Icon(Icons.remove),
                ),
                FloatingActionButton(
                  heroTag: '+',
                  onPressed: () {
                    BlocProvider.of<CounterCubit>(context).increment();
                  },
                  tooltip: 'Increment',
                  child: const Icon(Icons.add),
                ),
              ],
            ),
            const SizedBox(
              height: 24,
            ),
            Builder(builder: (context) {
              final counterValue = context.select((CounterCubit counterCubit) =>
                  counterCubit.state.counterValue);
              return Text(
                'Counter: $counterValue',
                style: Theme.of(context).textTheme.headline6,
              );
            }),
            const SizedBox(
              height: 24,
            ),
            Builder(builder: (context) {
              final counterState = context.watch<CounterCubit>().state;
              final internetState = context.watch<InternetCubit>().state;
              if (internetState is InternetConnected &&
                  internetState.connectionType == ConnectionType.wifi) {
                return Text(
                  'Counter: ${counterState.counterValue.toString()} Internet: WiFi',
                  style: Theme.of(context).textTheme.headline6,
                );
              } else if (internetState is InternetConnected &&
                  internetState.connectionType == ConnectionType.mobile) {
                return Text(
                  'Counter: ${counterState.counterValue.toString()} Internet: Mobile',
                  style: Theme.of(context).textTheme.headline6,
                );
              } else {
                return Text(
                  'Counter: ${counterState.counterValue.toString()} Internet: Disconnected',
                  style: Theme.of(context).textTheme.headline6,
                );
              }
            }),
            const SizedBox(
              height: 24,
            ),
            MaterialButton(
              color: Colors.redAccent,
              onPressed: () {
                Navigator.of(context).pushNamed(SecondScreen.routeName);
              },
              child: const Text(
                'Go to SecondScreen',
                style: TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            MaterialButton(
              color: Colors.greenAccent,
              onPressed: () {
                Navigator.of(context).pushNamed(ThirdScreen.routeName);
              },
              child: const Text(
                'Go to thirdScreen',
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}
