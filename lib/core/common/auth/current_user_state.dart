import 'package:flutter_blog_app/core/platform/domain/usecases/current_user_usecase.dart';
import 'package:flutter_blog_app/core/platform/domain/usecases/signout_usecase.dart';
import 'package:flutter_blog_app/core/platform/entities/user.dart';
import 'package:get/get.dart';

class CurrentUserState extends GetxController {
  CurrentUserState(
      {required CurrentUserUsecase currentUserUsecase,
      required SignoutUsecase signoutUsecase})
      : _currentUserUsecase = currentUserUsecase,
        _signoutUsecase = signoutUsecase;

  final CurrentUserUsecase _currentUserUsecase;
  final SignoutUsecase _signoutUsecase;

  final currentUser = Rx<User?>(null);

  final isUserLoggedIn = false.obs;

  @override
  void onInit() {
    getCurrentUser();
    super.onInit();
  }

  Future<void> getCurrentUser() async {
    final response = await _currentUserUsecase();

    response.fold(
      (l) {
        currentUser.value = null;
        isUserLoggedIn.value = false;
      },
      (user) {
        currentUser.value = user;
        isUserLoggedIn.value = true;
      },
    );
  }

  Future<void> signout({void Function()? navigateTo}) async {
    final response = await _signoutUsecase();

    response.fold(
      (l) => null,
      (r) {
        isUserLoggedIn.value = false;
        currentUser.value = null;
        navigateTo?.call();
      },
    );
  }
}
