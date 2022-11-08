part of 'navigation_bloc_bloc.dart';

@immutable
abstract class NavigationState {
  List<BottomNavigationDestination> get destinations;
}

class NavigationDefault extends NavigationState {
  @override
  List<BottomNavigationDestination> get destinations => const [
        BottomNavigationDestination(
          icon: Icons.home_outlined,
          label: 'Home',
          route: '/home',
        ),
        BottomNavigationDestination(
          icon: Icons.bike_scooter_outlined,
          label: 'Fahren',
          route: '/drive',
        ),
        BottomNavigationDestination(
          icon: Icons.map_outlined,
          label: 'Karte',
          route: '/map',
        ),
        BottomNavigationDestination(
          icon: Icons.list,
          label: 'Archiv',
          route: '/archive',
        ),
      ];
}

class BottomNavigationState extends NavigationState {
  BottomNavigationState(this.index, this.destinations);

  @override
  final List<BottomNavigationDestination> destinations;
  final int index;

  BottomNavigationDestination get currentDestination =>
      destinations.elementAt(index);
}
