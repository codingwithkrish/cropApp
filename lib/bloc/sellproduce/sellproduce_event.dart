part of 'sellproduce_bloc.dart';

@immutable
abstract class SellproduceEvent {}
class PickImageEvent extends SellproduceEvent{
final int count;

  PickImageEvent({required this.count});

}