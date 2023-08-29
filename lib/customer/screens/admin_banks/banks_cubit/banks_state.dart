part of 'banks_cubit.dart';

abstract class BanksState extends Equatable {
  final List<BankModel> banks;
  final bool changed;
  const BanksState(this.banks, this.changed);
}

class BanksInitial extends BanksState {
  BanksInitial() : super([], false);

  @override
  List<Object> get props => [banks,changed];
}


class BanksUpdateState extends BanksState {
  const BanksUpdateState(List<BankModel> banks, bool changed) : super(banks, changed);

  @override
  List<Object> get props => [banks,changed];
}
