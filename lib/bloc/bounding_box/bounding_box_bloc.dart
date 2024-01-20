
import 'package:bloc/bloc.dart';
import 'package:cropapp/data/repositories/my_crop_repo.dart';
import 'package:meta/meta.dart';

import '../../data/models/my_crop_model.dart';

part 'bounding_box_event.dart';
part 'bounding_box_state.dart';

class BoundingBoxBloc extends Bloc<BoundingBoxEvent, BoundingBoxState> {
  MyCropRepo _cropRepo = MyCropRepo();
  BoundingBoxBloc() : super(BoundingBoxInitial()) {
    on<FetchImage>(_fetchImage);
  }

  _fetchImage(FetchImage event, Emitter<BoundingBoxState> emit) async {
    emit(ImageFetchingLoading());
    try{
      MyCropModel myCropModel = await _cropRepo.getMyCrop();
      emit(ImageFetched(image: myCropModel.image!));
    }catch(e){
      emit(ImageFetchFailure(message: e.toString()));
    }
   
  }
}
