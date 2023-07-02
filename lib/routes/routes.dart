import 'package:busmate/view/getstarted.dart';
import 'package:busmate/view/home.dart';
import 'package:busmate/view/bookingPage.dart';
import 'package:busmate/view/createProfile.dart';
import 'package:busmate/view/ConfirmSelection.dart';
import 'package:busmate/view/editProfile.dart';
import 'package:busmate/view/ErrorPage.dart';
import 'package:busmate/view/signUp.dart';
import 'package:busmate/view/ticketConfirmation.dart';
import 'package:busmate/view/ticketHistory.dart';
import 'package:busmate/view/verification page.dart';
import 'package:get/get.dart';

class AppRoutes {
  static const String home = '/';
  static const String booking = '/booking';
  static const String starting = '/getStarted';
  static const String createProfile = '/createProfile';
  static const String login = '/login';
  static const String signup = '/signUp';
  static const String editProfile = '/editProfile';
  static const String confirmDetails = '/confirmDetails';
  static const String confirmTicket = '/ConfirmTicket';
  static const String error = '/error';
  static const String history = '/history';
  static const String verification = '/OTPverification';

  // Add other route names for your app's screens

  static final routes = [
    GetPage(
      name: home,
      page: () => HomePage(),
    ),
    GetPage(
        name: booking,
        page: () => BookingPage(),
        transition: Transition.downToUp,
        transitionDuration: Duration(microseconds: 0)),
    GetPage(
      name: starting,
      page: () => GetStarted(),
    ),
    GetPage(
      name: createProfile,
      page: () => CreateProfile(),
    ),
    GetPage(
      name: signup,
      page: () => SignUp(),
    ),
    GetPage(
        name: editProfile,
        page: () => EditProfile(),
        transition: Transition.downToUp,
        transitionDuration: const Duration(microseconds: 0)),
    GetPage(
      name: confirmTicket,
      page: () => TicketConfirmation(),
    ),
    GetPage(
      name: error,
      page: () => ErrorPage(),
    ),
    GetPage(
      name: createProfile,
      page: () => CreateProfile(),
    ),
    GetPage(
        name: history,
        page: () => History(),
        transition: Transition.downToUp,
        transitionDuration: Duration(microseconds: 0)),
    GetPage(
        name: verification,
        page: () => Verification(),
        transition: Transition.downToUp,
        transitionDuration: Duration(microseconds: 0)),
    // Add other routes
  ];
}
