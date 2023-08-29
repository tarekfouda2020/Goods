part of 'desc_cubit.dart';

abstract class DescState extends Equatable {
  final List<CatPropertyModel>? descriptions;
  final bool? changed;
  const DescState({this.descriptions, this.changed});
}

class DescInitial extends DescState {
  DescInitial({bool? changed}) : super(changed: false,descriptions: []);

  @override
  List<Object> get props => [descriptions!,changed!];
}

class DescUpdated extends DescState {
  const DescUpdated({bool? changed, List<CatPropertyModel>? descriptions}) : super(changed: changed,descriptions: descriptions);

  @override
  List<Object> get props => [descriptions!,changed!];
}
