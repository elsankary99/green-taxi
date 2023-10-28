part of 'map_provider.dart';

abstract class MapState {
  const MapState();
}

class MapInitial extends MapState {}

class MapLoading extends MapState {}

class MapDataFetched extends MapState {}

class MapError extends MapState {
  final String message;
  const MapError(this.message);
}

class MoveToMyLocation extends MapState {}

class MarkerAdded extends MapState {}

class ShowRoad extends MapState {}

//*==Place Details==
class PlaceDetailsLoading extends MapState {}

class PlaceDetailsSuccess extends MapState {}

class PlaceDetailsError extends MapState {
  final String message;
  const PlaceDetailsError(this.message);
}
