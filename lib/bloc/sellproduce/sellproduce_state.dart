part of 'sellproduce_bloc.dart';

@immutable
abstract class SellproduceState {}

class SellproduceInitial extends SellproduceState {
  final XFile? file1;
  final XFile? file2;

  SellproduceInitial({this.file1, this.file2});
  SellproduceInitial copyWith(XFile? file1, XFile? file2) {
    return SellproduceInitial(
        file1: file1 ?? this.file1, file2: file2 ?? this.file2);
  }
}
