import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:heraggoods/customer/models/OffersHeaderModel.dart';
import 'package:heraggoods/customer/resources/CustomerRepository.dart';

part 'offer_headers_state.dart';

class OfferHeadersCubit extends Cubit<OfferHeadersState> {
  OfferHeadersCubit() : super(OfferHeadersInitial());

  onHeadersUpdated(List<OffersHeaderModel> headers){
    emit(OfferHeadersUpdate(headers, !state.changed));
  }

  fetchOfferHeadersData(BuildContext context,{bool refresh =true})async{
    List<OffersHeaderModel> headers =await CustomerRepository(context).getOffersHeaderData(refresh);
    onHeadersUpdated(headers);
  }
}
