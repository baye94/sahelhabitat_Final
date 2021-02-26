import 'package:bloc/bloc.dart';
import 'package:sahelhabitat/View/Admin/SideBarNavigationAdmin/pages/terrains.dart';
import '../pages/myaccountspage.dart';
import '../pages/myorderspage.dart';
import '../pages/louer.dart';
import '../pages/homepage.dart';

enum NavigationEvents {
  HomePageClickedEvent,
  MyAccountClickedEvent,
  MyOrdersClickedEvent,
  LouerClickedEvent,
  TerrainClickedEvent,
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
      case NavigationEvents.LouerClickedEvent:
        yield LouerPage();
        break;
        case NavigationEvents.TerrainClickedEvent:
        yield Terrains();
        break;
    }
  }
}
