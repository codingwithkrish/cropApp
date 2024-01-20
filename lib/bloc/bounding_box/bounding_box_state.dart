part of 'bounding_box_bloc.dart';

@immutable
abstract class BoundingBoxState {}

class BoundingBoxInitial extends BoundingBoxState {

}
class ImageFetched extends BoundingBoxState{
  final String image;

  ImageFetched({required this.image});
}
class ImageFetchingLoading extends BoundingBoxState{}
class ImageFetchFailure extends BoundingBoxState{
  final String message;

  ImageFetchFailure({required this.message});
}