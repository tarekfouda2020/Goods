import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'reset_password_state.dart';

class ResetPasswordCubit extends Cubit<ResetPasswordState> {
  ResetPasswordCubit() : super(const ResetPasswordInitial());

  onUpdateLoadingState(bool showLoading){
    emit(ResetPasswordUpdated(showLoading));
  }

}
