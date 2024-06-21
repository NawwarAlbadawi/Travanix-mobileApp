
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


part 'select_room_state.dart';

class SelectRoomCubit extends Cubit<SelectRoomState> {
  SelectRoomCubit() : super(SelectRoomInitial());
  static SelectRoomCubit get(context)=>BlocProvider.of(context);


  TextEditingController checkInController=TextEditingController();
  TextEditingController checkOutController=TextEditingController();

  setCheckInDate(String date)
  {
    checkInController.text=date;
    emit(SetCheckInDateState());

  }

  setCheckOutDate(String date)
  {
    checkOutController.text=date;
    emit(SetCheckInDateState());

  }

  int roomCount=1;
  int personCount=1;

  void addRoom()
  {
    roomCount++;
    emit(AddRoomState());
  }
  void removeRoom ()
  {
    if(roomCount>0) {
      roomCount--;
      emit(RemoveRoomState());
    }
  }


  void addPerson()
  {
    personCount++;
    emit(AddPersonState());
  }
  void removePerson ()
  {
    if(personCount>0) {
      personCount--;
      emit(RemovePersonState());
    }
  }



}
