import 'package:bloc/bloc.dart';
import 'package:sidebar_navigation_animation/pages/home_page.dart';

// class SubjectBloc extends Bloc<SubjectEvent, SubjectState> {
//   SubjectBloc() : super(SubjectInitial()) {
//     on<SubjectEvent>((event, emit) {
//       // TODO: implement event handler
//     });
//   }
// }

// events
class NavigationEvent {}
class HomePageClickedEvent extends NavigationEvent{}
class MyAccountClickedEvent extends NavigationEvent{}
class MyOrdersClickedEvent extends NavigationEvent{}

abstract class NavigationState {}
class HomePageNavigationState extends NavigationState {}
class MyAccountNavigationState extends NavigationState {}
class MyOrdersNavigationState extends NavigationState {}

class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {
  NavigationBloc() : super(HomePageNavigationState()){
    on<HomePageClickedEvent>((event, emit) {
      emit(HomePageNavigationState());
    });

    on<MyAccountClickedEvent>((event, emit) {
      emit(MyAccountNavigationState());
    });

    on<MyOrdersClickedEvent>((event, emit) {
      emit(MyOrdersNavigationState());
    });
  }
}