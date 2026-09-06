import 'package:equatable/equatable.dart';

class BottomNavigationStates extends Equatable {
  final int currIndex;
  const BottomNavigationStates({this.currIndex = 0});

  BottomNavigationStates copyWith({int? currIndex}) =>
      BottomNavigationStates(currIndex: currIndex ?? this.currIndex);

  @override
  List<Object?> get props => [currIndex];
}
