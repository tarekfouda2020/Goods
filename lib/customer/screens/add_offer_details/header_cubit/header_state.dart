part of 'header_cubit.dart';

abstract class HeaderState extends Equatable {
  final List<SpecificationHeaderModel> headers;
  final bool changed;

  const HeaderState({ required this.headers, required  this.changed});
}

class HeaderInitial extends HeaderState {
  HeaderInitial({ required bool changed}):super(headers: [],changed: changed);
  @override
  List<Object> get props => [changed,headers];
}

class HeaderUpdated extends HeaderState {
  const HeaderUpdated({ required bool changed, required List<SpecificationHeaderModel> headers})
      :super(headers: headers,changed: changed);
  @override
  List<Object> get props => [changed,headers];
}