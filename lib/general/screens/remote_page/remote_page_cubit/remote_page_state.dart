part of 'remote_page_cubit.dart';

abstract class RemotePageState extends Equatable {
  final String content;
  const RemotePageState(this.content);
}

class RemotePageInitial extends RemotePageState {
  const RemotePageInitial() : super("");

  @override
  List<Object> get props => [content];
}

class RemotePageUpdated extends RemotePageState {
  const RemotePageUpdated(String content) : super(content);

  @override
  List<Object> get props => [content];
}
