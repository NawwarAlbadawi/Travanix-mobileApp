import 'package:bloc/bloc.dart';
import 'package:either_dart/either.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:travanix/Features/trip/data/model/BookTripModel.dart';
import 'package:travanix/Features/trip/data/repositories/book_trip_repo.dart';
import 'package:travanix/Features/trip/presentation/views_model/cubits/get_trips_cubit/get_trips_cubit.dart';

part 'book_trip_state.dart';

class BookTripCubit extends Cubit<BookTripState> {
  BookTripCubit(this._bookTripRepo) : super(BookTripInitial());

  static BookTripCubit get(context)=>BlocProvider.of(context);


  final BookTripRepo _bookTripRepo;
  BookTripModel ? model;

int personCount=1;
  void addPerson()
  {
    personCount++;
    emit(AddPerson());
  }
  void removePerson ()
  {
    if(personCount>0) {
      personCount--;
      emit(RemovePerson());
    }
  }


  Future<void>bookTrip({
    required int  tripId,
    required String phoneNumber,
    required String paymentMethod,
    required  List<Details>details
}) async
  {


    model=BookTripModel(
      tripId: tripId,
      numberOfSeat: personCount,
      phoneNumber: phoneNumber,
      paymentStatus: paymentMethod,
      details: details
    );

  await  _bookTripRepo.bookTrips(model!.toJson()).fold(
        (error)
            {
             emit(PostBookingDetailsFails());
            },
        (status)
        {
          emit(PostBookingDetailsSuccess());
        }

    );


  }




}
