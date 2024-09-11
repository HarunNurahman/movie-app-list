part of 'dashboard_bloc.dart';

sealed class DashboardState extends Equatable {
  final int tabIndex;
  const DashboardState(this.tabIndex);

  @override
  List<Object> get props => [tabIndex];
}

final class DashboardInitial extends DashboardState {
  const DashboardInitial(super.tabIndex);
}
