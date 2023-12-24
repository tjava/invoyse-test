part of 'create_business_cubit.dart';

sealed class CreateBusinessState extends Equatable {
  const CreateBusinessState();

  @override
  List<Object> get props => [];
}

final class CreateBusinessInitial extends CreateBusinessState {}

class CreatingBusinesses extends CreateBusinessState {
  const CreatingBusinesses();
}

class CreatedBusinesses extends CreateBusinessState {
  const CreatedBusinesses();
}

class CreatingBusinessesError extends CreateBusinessState {
  final String message;

  const CreatingBusinessesError(this.message);

  @override
  List<Object> get props => [message];
}
