part of 'select_room_cubit.dart';

@immutable
sealed class SelectRoomState {}

final class SelectRoomInitial extends SelectRoomState {}
final class SetCheckInDateState extends SelectRoomState {}

final class AddRoomState extends SelectRoomState {}
final class RemoveRoomState extends SelectRoomState {}
final class AddPersonState extends SelectRoomState {}
final class RemovePersonState extends SelectRoomState {}