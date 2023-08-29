// ignore_for_file: overridden_fields, annotate_overrides

part of 'register_cubit.dart';

abstract class RegisterState extends Equatable {
  final bool? terms;
  final bool? loading;
  const RegisterState({this.terms, this.loading});
}

class RegisterInitial extends RegisterState {
  const RegisterInitial() : super(terms: false,loading: false);

  @override
  List<Object> get props => [];
}

class TermsChanged extends RegisterState {
  final bool? terms;
  final bool? loading;
  const TermsChanged({this.terms, this.loading}) : super(terms: terms,loading: loading);

  @override
  List<Object> get props => [terms!,loading!];
}
class LoadingChanged extends RegisterState {
  final bool? loading;
  final bool? terms;
  const LoadingChanged({this.loading, this.terms}) : super(terms: terms,loading: loading);
  @override
  List<Object> get props => [loading!,terms!];
}
