// ignore_for_file: prefer_const_constructors_in_immutables

part of 'internet_cubit.dart';

abstract class InternetState {}

class InternetLoading extends InternetState {}

class InternetConnected extends InternetState {
  late final ConnectionType connectionType;

  InternetConnected({required this.connectionType});
}

class InternetDisconnected extends InternetState {}
