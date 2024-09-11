import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'dashboard_event.dart';
part 'dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  DashboardBloc() : super(const DashboardInitial(0)) {
    on<DashboardEvent>((event, emit) {
      if (event is ChangeTabEvent) {
        emit(DashboardInitial(event.tabIndex));
      }
    });
  }
}
