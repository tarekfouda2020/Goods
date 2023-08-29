part of 'offer_headers_cubit.dart';

abstract class OfferHeadersState extends Equatable {
  final List<OffersHeaderModel> headers;
  final bool changed;

  const OfferHeadersState({required this.headers, required this.changed});
}

class OfferHeadersInitial extends OfferHeadersState {
  OfferHeadersInitial():super(headers: [],changed: false);
  @override
  List<Object> get props => [headers,changed];
}

class OfferHeadersUpdate extends OfferHeadersState {
  const OfferHeadersUpdate(List<OffersHeaderModel> headers,bool changed):super(headers: headers,changed: changed);
  @override
  List<Object> get props => [headers,changed];
}
