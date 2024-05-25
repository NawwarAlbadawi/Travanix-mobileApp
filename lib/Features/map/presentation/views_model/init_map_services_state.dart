part of 'init_map_services_cubit.dart';

@immutable
sealed class InitMapState {}

final class InitMapInitial extends InitMapState {}
final class InitMapServicesSuccess extends InitMapState {}
final class InitMapServicesLoading extends InitMapState {}

final class InitMapDataLoading extends InitMapState {}
final class InitMapDataSuccess extends InitMapState {}

