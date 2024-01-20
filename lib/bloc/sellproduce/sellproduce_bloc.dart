import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:cropapp/presentation/utils/image_picker_utils.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';
import 'package:rxdart/rxdart.dart';

part 'sellproduce_event.dart';
part 'sellproduce_state.dart';

class SellproduceBloc extends Bloc<SellproduceEvent, SellproduceState> {
  List<String> dropdownNames = [
    'Select Crop',
    'Wheat',
    'Rabi Crops',
    'Corn',
    "Rice",
    "Zaid Crops"
  ];
  List<String> dropdownQuantity = ["kg", "g"];
  final _dropdownValue = BehaviorSubject<String>.seeded("Select Crop");
  Stream<String> get outDropdown => _dropdownValue.stream;
  Function(String) get inDropdown => _dropdownValue.sink.add;
  String get getDropdown => _dropdownValue.value;
  void setDropdown(String name) {
    _dropdownValue.value = name;
  }

  final _dropdownQuantity = BehaviorSubject<String>.seeded("kg");
  Stream<String> get outDropdownQuantity => _dropdownQuantity.stream;
  Function(String) get inDropdownQuantity => _dropdownQuantity.sink.add;
  String get getDropdownQuantity => _dropdownQuantity.value;
  void setDropdownQuantity(String name) {
    _dropdownQuantity.value = name;
  }

  ImagePickerUtils imagePickerUtils = ImagePickerUtils();
  SellproduceBloc() : super(SellproduceInitial()) {
    on<PickImageEvent>(pickImage);
  }

  void pickImage(PickImageEvent event, Emitter<SellproduceState> emit) async {

    if (event.count > 2) {
      return;
    }
    XFile? file = await imagePickerUtils.getImageFromGallery();

    emit(SellproduceInitial().copyWith(
        event.count == 0 ? file : null, event.count == 1 ? file : null));
  }
}
