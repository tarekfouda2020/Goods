part of 'lang_bloc.dart';

abstract class LangState extends Equatable {
  final String lang;
  const LangState(this.lang);
}

class LangInitial extends LangState {
  const LangInitial() : super("ar");
  @override
  List<Object> get props => [];
}
