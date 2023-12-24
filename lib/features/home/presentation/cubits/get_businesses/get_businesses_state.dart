part of 'get_businesses_cubit.dart';

sealed class GetBusinessesState extends Equatable {
  const GetBusinessesState();

  @override
  List<Object> get props => [];
}

final class GetBusinessesInitial extends GetBusinessesState {}

class LoadingBusinesses extends GetBusinessesState {
  const LoadingBusinesses();
}

class LoadedBusinesses extends GetBusinessesState {
  final List<BusinessInfoEntity> businesses;
  const LoadedBusinesses(this.businesses);

  @override
  List<Object> get props => [businesses];
}

class LoadingBusinessesError extends GetBusinessesState {
  final String message;

  const LoadingBusinessesError(this.message);

  @override
  List<Object> get props => [message];
}
