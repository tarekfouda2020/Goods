import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'forget_password_state.dart';

class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  ForgetPasswordCubit() : super(const ForgetPasswordInitial());

  onUpdateLoading(bool loading){
    emit(ForgetPasswordUpdate(loading));
  }

}
