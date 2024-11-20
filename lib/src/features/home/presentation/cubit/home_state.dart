part of 'home_cubit.dart';

enum HomeStatus { mapPage, passbookPage }

class HomeState extends Equatable {
  final HomeStatus status;

  const HomeState({
    required this.status,
  });

  factory HomeState.initial() => const HomeState(
        status: HomeStatus.mapPage,
      );

  HomeState copyWith({
    HomeStatus? status,
  }) {
    return HomeState(
      status: status ?? this.status,
    );
  }

  @override
  List<Object> get props => [
        status,
      ];
}
