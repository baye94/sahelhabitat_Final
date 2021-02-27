import 'package:bloc/bloc.dart';
import 'package:sahelhabitat/View/SideBarNavigation/pages/louer.dart';
import 'package:sahelhabitat/View/SideBarNavigation/pages/myorderspage.dart';
import 'package:sahelhabitat/View/SideBarNavigation/pages/terrain.dart';
import '../pages/myaccountspage.dart';

import '../pages/homepage.dart';

enum NavigationEvents {
  HomePageClickedEvent,
  MyAccountClickedEvent,
  MyOrdersClickedEvent,
  LouersClickedEvent,
  TerrainClickedEvent
}

abstract class NavigationStates {}

class NavigationBloc extends Bloc<NavigationEvents, NavigationStates> {
    NavigationBloc() : super(HomePage());
  @override
  NavigationStates get initialState => MyAccountsPage();

  @override
  Stream<NavigationStates> mapEventToState(NavigationEvents event) async* {
    switch (event) {
      case NavigationEvents.HomePageClickedEvent:
        yield HomePage();
        break;
      case NavigationEvents.MyAccountClickedEvent:
        yield MyAccountsPage();
        break;
      case NavigationEvents.MyOrdersClickedEvent:
        yield MyOrdersPage();
        break;
      case NavigationEvents.LouersClickedEvent:
        yield LouerU();
        break;
      case NavigationEvents.TerrainClickedEvent:
        yield TerrainU();
        break;
    }
  }
}
