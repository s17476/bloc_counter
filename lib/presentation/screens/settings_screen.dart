import 'package:bloc_counter/logic/cubit/settings_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  static const routeName = '/settings';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        backgroundColor: Colors.grey.shade700,
      ),
      body: BlocListener<SettingsCubit, SettingsState>(
        listener: ((context, state) {
          final notificationSnackBar = SnackBar(
            content: Text(
              'App ${state.appNotifications.toString().toUpperCase()}' +
                  ', Email ${state.emailNotifications.toString().toUpperCase()}',
            ),
          );
          ScaffoldMessenger.of(context)
            ..removeCurrentSnackBar()
            ..showSnackBar(notificationSnackBar);
        }),
        child: BlocBuilder<SettingsCubit, SettingsState>(
          builder: (context, state) {
            return Column(children: [
              SwitchListTile(
                value: state.appNotifications,
                onChanged: (newValue) {
                  context
                      .read<SettingsCubit>()
                      .toggleAppNotifications(newValue);
                },
                title: const Text('App notifications'),
              ),
              SwitchListTile(
                value: state.emailNotifications,
                onChanged: (newValue) {
                  context
                      .read<SettingsCubit>()
                      .toggleEmailNotifications(newValue);
                },
                title: const Text('Email notifications'),
              )
            ]);
          },
        ),
      ),
    );
  }
}
