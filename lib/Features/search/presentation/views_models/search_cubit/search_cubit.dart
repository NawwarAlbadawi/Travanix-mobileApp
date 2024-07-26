import 'package:bloc/bloc.dart';
import 'package:either_dart/either.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:travanix/Features/search/data/Repositories/search_repo.dart';
import 'package:travanix/Features/search/data/models/SearchModel.dart';
part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this._searchRepo) : super(SearchInitial());

  static SearchCubit get(context)=>BlocProvider.of(context);

  final SearchRepo _searchRepo;
  SearchModel ?  searchModel;
   String   countryValue="" ;
   String ? stateValue = "";
   String ? cityValue="";
   double avgRate=0;
   int categoriesIndex=0;
   late List<dynamic>data=[
     [],
     [],
     [],
     []
   ];
  final TextEditingController controller =TextEditingController();
  Future<void>searchSomeThing() async
  {
    print(cityValue);
    print(controller.text);
    print(avgRate);
    emit(SearchLoading());
   await _searchRepo.getSearchResult(
      name: controller.text,
      address: cityValue,
      nationName: countryValue,
      avgRate: avgRate
    ).fold(
       (error){
         emit(SearchFail(
           error: error.errMessage
         ));
       },
       (model){


         searchModel=model;
         data=[model.trips,model.hotels,model.restaurants,model.attractionActivities];

         print(model.trips);
         print(data.length);
         emit(SearchSuccess());
       }
   );
  }

  void changeCountry(String  country)
  {
    countryValue=country;
    emit(ChangeCountryState());
  }

  void changeCity(String ?  city)
  {
    cityValue = city ?? '';
    emit(ChangeCityState());
  }

  void changeSlider(double value)
  {
    avgRate=value;
    emit(ChangeSliderState());
  }


  void changeCategoryIndex(int index)
  {
     categoriesIndex=index;
    emit(ChangeCategoryIndexState());

  }

  dynamic getModel()
  {
    if(categoriesIndex==0)
    {
      return searchModel!.trips;
    }
    else if(categoriesIndex==1)
    {
      return searchModel!.hotels;
    }
    else if(categoriesIndex==2){
      return searchModel!.restaurants;}
    return searchModel!.attractionActivities;
  }
}
