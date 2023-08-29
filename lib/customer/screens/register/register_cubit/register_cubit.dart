import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(const RegisterInitial());

  @override
  void onChange(Change<RegisterState> change) {
    super.onChange(change);
  }

  void onChangeTermsState(){
    emit(TermsChanged(terms: !state.terms!,loading: state.loading));
  }

  void onChangeLoadingState(){
    emit(LoadingChanged(terms: state.terms,loading: !state.loading!));
  }

  void onInitialState(){
    emit(const RegisterInitial());
  }

}
