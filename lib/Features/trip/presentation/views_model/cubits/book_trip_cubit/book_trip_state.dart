part of 'book_trip_cubit.dart';

@immutable
sealed class BookTripState {}

final class BookTripInitial extends BookTripState {}

final class AddPerson extends BookTripState {}
final class RemovePerson extends BookTripState {}


final class PostBookingDetailsLoading extends BookTripState {}

final class PostBookingDetailsSuccess  extends BookTripState {}
final class PostBookingDetailsFails extends BookTripState {}
