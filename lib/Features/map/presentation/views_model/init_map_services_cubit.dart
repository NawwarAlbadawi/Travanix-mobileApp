import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:location/location.dart';
import 'package:meta/meta.dart';
import 'package:travanix/Features/map/presentation/views_model/init_map_services_cubit.dart';

part 'init_map_services_state.dart';

class InitMapCubit extends Cubit<InitMapState> {
  InitMapCubit() : super(InitMapInitial());

  static InitMapCubit get(context)=>BlocProvider.of(context);

  Location location = Location();
  late bool servicesEnabled;
  late PermissionStatus permissionStatus;
  late LocationData getLocation;

  void initMapService() async
  {
    emit(InitMapServicesLoading());
    servicesEnabled = await location.serviceEnabled();
    if (!servicesEnabled) {
      servicesEnabled = await location.requestService();

    }
    permissionStatus = await location.hasPermission();
    if (permissionStatus == PermissionStatus.denied) {
      permissionStatus = await location.requestPermission();
    }
    getLocation = await location.getLocation();
    emit(InitMapServicesSuccess());


  }

  bool isWMS=false;

  void toggleBetweenTheLayer() {

    isWMS=!isWMS;
    emit(ChangeTheLayerState());

  }
}

