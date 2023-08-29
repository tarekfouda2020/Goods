// ignore_for_file: file_names
// // ignore_for_file: implementation_imports, file_names

// import 'package:flutter/material.dart';
//  import 'package:google_fonts/google_fonts.dart';

// import '../../widgets/MyText.dart';
// import '../MyColors.dart';

// class AutoCompleteField<DataType> extends StatelessWidget {
//   final Function(DataType model) onSubmit;
//   final dynamic onSearch;
//   final String label;
//   final TextEditingController controller;

//   const AutoCompleteField(
//       {super.key,
//       required this.onSubmit,
//       required this.onSearch,
//       required this.label,
//       required this.controller});

//   @override
//   Widget build(BuildContext context) {
//     return TypeAheadField<DataType>(
//       textFieldConfiguration: TextFieldConfiguration(
//         autofocus: false,
//         style: GoogleFonts.cairo(fontSize: 10),
//         decoration: InputDecoration(
//             enabledBorder: OutlineInputBorder(
//                 borderSide:
//                     BorderSide(color: MyColors.grey.withOpacity(.8), width: 1),
//                 borderRadius: BorderRadius.circular(10)),
//             focusedBorder: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(10),
//                 borderSide: BorderSide(color: MyColors.primary, width: 2)),
//             focusedErrorBorder: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(10),
//                 borderSide: const BorderSide(color: Colors.red, width: 2)),
//             hintText: "  $label  ",
//             hintStyle: GoogleFonts.cairo(fontSize: 14),
//             contentPadding:
//                 const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
//             filled: true,
//             fillColor: MyColors.white,
//             suffixIcon: Icon(
//               Icons.search,
//               size: 20,
//               color: MyColors.grey,
//             )),
//       ),
//       suggestionsCallback: onSearch,
//       itemBuilder: (context, suggestion) {
//         return Container(
//           height: 45,
//           padding: const EdgeInsets.symmetric(horizontal: 10),
//           decoration: BoxDecoration(
//               border: Border(
//                   bottom: BorderSide(color: MyColors.greyWhite, width: 1))),
//           child: Row(
//             children: [
//               MyText(
//                 title: suggestion.toString(),
//                 size: 10,
//                 color: MyColors.blackOpacity,
//               ),
//             ],
//           ),
//         );
//       },
//       noItemsFoundBuilder: (context) {
//         return Container(
//             height: 40,
//             alignment: Alignment.center,
//             child: MyText(
//               title: "لايوجد بيانات للبحث",
//               size: 10,
//               color: MyColors.blackOpacity,
//             ));
//       },
//       onSuggestionSelected: onSubmit,
//       hideOnEmpty: true,
//       // hideOnError: true,
//     );
//   }
// }
