import 'package:flutter/material.dart';
import 'package:movies_app/views/movies/movie_details_screen.dart';
import 'package:movies_app/views/reservations/check_out_screen.dart';
import 'package:movies_app/views/reservations/reservation_screen.dart';
import '../utils/route_names.dart';
import '../views/dashboard_screen.dart';
import '../views/movies/movie_trailer_player.dart';
import 'route_models/movie_details_route_model.dart';

class AppRoutes {
  Route? generateRoute(RouteSettings settings) {
    FocusManager.instance.primaryFocus?.unfocus();
    final args = settings.arguments;
    switch (settings.name) {

      case RouteNames.dashboardScreen:
        return MaterialPageRoute(
          builder: (context) => const DashboardScreen(),
        );

      case RouteNames.movieDetailsScreen:
        MovieDetailsRouteModel arguments = args as MovieDetailsRouteModel;
        return MaterialPageRoute(
          builder: (context) => MovieDetailsScreen(
            movieId: arguments.movieId,
          ),
        );

      case RouteNames.movieTrailerPlayerScreen:
        MovieDetailsRouteModel arguments = args as MovieDetailsRouteModel;
        return MaterialPageRoute(
          builder: (context) => TrailerPlayerScreen(
            movieId: arguments.movieId,
          ),
        );

      case RouteNames.reservationScreen:
        return MaterialPageRoute(
          builder: (context) => const ReservationScreen(),
        );

      case RouteNames.checkoutScreen:
        return MaterialPageRoute(
          builder: (context) => const CheckOutScreen(),
        );

      default:
        return MaterialPageRoute(
          builder: (context) => const DashboardScreen(),
        );
    }
  }
}
