part of 'navigation_bloc_bloc.dart';

@immutable
abstract class NavigationState {
  List<BottomNavigationDestination> get destinations;
}

class NavigationDefault extends NavigationState {
  @override
  List<BottomNavigationDestination> get destinations => [
        BottomNavigationDestination(
          icon: Icons.home_outlined,
          label: 'Home',
          route: '/home',
          destination: (context) => const Home(),
          action: (context) => const InfoButton(),
        ),
        BottomNavigationDestination(
          icon: Icons.bike_scooter_outlined,
          label: 'Fahren',
          route: '/drive',
          destination: (context) => const Drive(),
        ),
        BottomNavigationDestination(
          icon: Icons.map_outlined,
          label: 'Kartenansicht',
          route: '/map',
          destination: (context) => const Map(),
          action: (context) => const ProfileIconButton(),
        ),
        BottomNavigationDestination(
            icon: Icons.list,
            label: 'Archiv',
            route: '/archive',
            destination: (context) =>
                const ActiveDriveScreen() // const Archive(),
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
