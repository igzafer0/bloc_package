import 'package:bloc_package/bloc/counterBloc.dart';
import 'package:bloc_package/bloc/counterEvent.dart';
import 'package:bloc_package/bloc/counterState.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const app());
}

class app extends StatelessWidget {
  const app({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
          create: (context) => CounterBloc(), child: const MyApp()),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      floatingActionButton: MyFabs(),
      body: MyCenter(),
    );
  }
}

class MyCenter extends StatelessWidget {
  const MyCenter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(child: BlocBuilder<CounterBloc, CounterState>(
      builder: (context, counterState) {
        return Text(
          counterState.sayac.toString(),
          style: TextStyle(fontSize: 48),
        );
      },
    ));
  }
}

class MyFabs extends StatelessWidget {
  const MyFabs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        FloatingActionButton(
          heroTag: "arttır",
          onPressed: () {
            context.read<CounterBloc>().add(counterArttir());
          },
          child: const Icon(Icons.add),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 5.0),
          child: FloatingActionButton(
            heroTag: "azalt",
            onPressed: () {
              context.read<CounterBloc>().add(counterAzalt());
            },
            child: const Icon(Icons.remove),
          ),
        )
      ],
    );
  }
}
