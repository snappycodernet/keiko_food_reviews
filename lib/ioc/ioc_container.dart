import 'package:get_it/get_it.dart';
import 'package:keiko_food_reviews/logic/login_register_logic.dart';
import 'package:keiko_food_reviews/services/authentication_service_base.dart';
import 'package:keiko_food_reviews/services/database_service.dart';
import 'package:keiko_food_reviews/services/firebase_authentication_service.dart';

class IocContainer {
  static GetIt get = GetIt.instance;

  static void configure() {
    final authSvc = FirebaseAuthenticationService();
    final dbSvc = DatabaseService();

    get.registerSingleton<AuthenticationServiceBase>(authSvc);
    get.registerSingleton(dbSvc);
    get.registerSingleton(LoginRegisterLogic(authService: authSvc, dbService: dbSvc));
  }
}