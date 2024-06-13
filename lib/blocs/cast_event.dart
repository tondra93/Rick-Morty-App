import 'package:equatable/equatable.dart';

abstract class CastEvent extends Equatable {
  const CastEvent();
  
  @override
  List<Object> get props => [];
}

class FetchCharacters extends CastEvent {
  final int page;

  const FetchCharacters(this.page);

  @override
  List<Object> get props => [page];
}
