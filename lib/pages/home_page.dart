import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:pomodoro_timer/Network/wifi_info.dart';
import 'package:pomodoro_timer/bloc/unix_time_cubit.dart';
import 'package:pomodoro_timer/utils/convert_time.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Winfo();

    Future<void> requestLocationPermission() async {
      PermissionStatus status = await Permission.location.request();
      if (status.isGranted) {
        print('Permiso de ubicación concedido');
      } else if (status.isDenied) {
        print('Permiso de ubicación denegado');
      } else if (status.isPermanentlyDenied) {
        print('Permiso de ubicación denegado permanentemente');
        openAppSettings();
      }
    }

    return BlocProvider(
      create: (_) => UnixtimeCubit(),
      child: Scaffold(
        body: Center(
          child: Center(child: BlocBuilder<UnixtimeCubit, int>(
            builder: (context, timer) {
              String timerString = convertTime(timer);
              return Column(
                children: [
                  Expanded(
                    flex: 2,
                    child: Center(
                        child: Text(
                      timerString,
                      style: const TextStyle(
                          fontSize: 60, color: Colors.deepPurple),
                    )),
                  ),
                  Expanded(
                    flex: 1,
                    child: Column(
                      children: [
                        const Spacer(),
                        TextButton(
                            onPressed: () {
                              requestLocationPermission();
                              context.read<UnixtimeCubit>().start();
                            },
                            child: const Text('Start')),
                        const Spacer(),
                      ],
                    ),
                  ),
                ],
              );
            },
          )),
        ),
      ),
    );
  }
}
