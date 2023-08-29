// ignore_for_file: file_names
// import 'package:bloc/bloc.dart';
// import 'package:flutter/foundation.dart';

// class MyBlocObserver extends BlocObserver {
//   @override
//   void onCreate(Cubit cubit) {
//     super.onCreate(cubit);
//     if (kDebugMode) {
//       debugPrint('onCreate -- bloc: ${cubit.runtimeType}');
//     }
//   }

//   @override
//   void onChange(Cubit cubit, Change change) {
//     super.onChange(cubit, change);
//     if (kDebugMode) {
//       debugPrint('onChange -- bloc: ${cubit.runtimeType}, change: $change');
//     }
//   }

//   @override
//   void onError(Cubit cubit, Object error, StackTrace stackTrace) {
//     if (kDebugMode) {
//       debugPrint('onError -- bloc: ${cubit.runtimeType}, error: $error');
//     }
//     super.onError(cubit, error, stackTrace);
//   }

//   @override
//   void onClose(Cubit cubit) {
//     super.onClose(cubit);
//     if (kDebugMode) {
//       debugPrint('onClose -- bloc: ${cubit.runtimeType}');
//     }
//   }
// }
