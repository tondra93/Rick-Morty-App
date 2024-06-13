import 'package:equatable/equatable.dart';
import '../models/character.dart';

abstract class CastState extends Equatable {
  const CastState();
  
  @override
  List<Object> get props => [];
}

class CastInitial extends CastState {}

class CastLoading extends CastState {}

class CastLoaded extends CastState {
  final List<Character> characters;

  const CastLoaded({required this.characters});

  @override
  List<Object> get props => [characters];
}

class CastError extends CastState {
  final String message;

  const CastError({required this.message});

  @override
  List<Object> get props => [message];
}
