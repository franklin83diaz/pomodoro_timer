import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pomodoro_timer/bloc/unix_time_cubit.dart';
import 'package:pomodoro_timer/utils/convert_time.dart';

class HomePsge extends StatelessWidget {
  const HomePsge({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => UnixtimeCubit(),
      child: Scaffold(
        body: Center(
          child: Center(
              child: Column(
            children: [
              BlocBuilder<UnixtimeCubit, int>(
                builder: (context, timer) {
                  String timerString = convertTime(timer);
                  return Column(
                    children: [
                      Text(
                        timerString,
                        style: const TextStyle(
                            fontSize: 60, color: Colors.deepPurple),
                      ),
                      TextButton(
                          onPressed: () {
                            context.read<UnixtimeCubit>().start();
                          },
                          child: const Text('Start')),
                    ],
                  );
                },
              ),
            ],
          )),
        ),
      ),
    );
  }
}
