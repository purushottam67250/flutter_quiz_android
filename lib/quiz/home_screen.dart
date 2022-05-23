import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:quiz_android/app/app_controller.dart';
import 'package:quiz_android/app/entities/base_state.dart';
import 'package:quiz_android/app_setup/firebase/auth_controller.dart';
import 'package:quiz_android/app_setup/routes/navigator_routes.dart';
import 'package:quiz_android/app_setup/routes/navigator_routes.dart'
    as app_route;
import 'package:quiz_android/authentication/entities/session.dart';
import 'package:quiz_android/common/constants/color_constants.dart';
import 'package:quiz_android/common/constants/string_constants.dart';
import 'package:quiz_android/common/widgets/app_container.dart';
import 'package:quiz_android/common/widgets/shimmer.dart';
import 'package:quiz_android/quiz/category_controller.dart';
import 'package:quiz_android/quiz/entities/quiz_entities.dart';
import 'package:quiz_android/util.dart';

final logOutController =
    StateNotifierProvider<AuthController, BaseState>(authController);

final userController =
    StateNotifierProvider.autoDispose<AuthController, BaseState>(
        authController);

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  void initState() {
    super.initState();
    final user = ref.read(userProvider.notifier).state;
    ref.read(catController.notifier).getAllCategories();
    ref.read(userController.notifier).getUser(user.userId);
  }

  Widget _quizCategoryBuilder(BuildContext context, int index) {
    return QuizCategoryWidget(
      label: '',
      image: '',
      isLoading: true,
      onPressed: (context) {
        // Navigator.pushNamed(
        //   context,
        //   quizRoute,
        // );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final crossAxisExtent = (screenSize.width) / 3;
    return Scaffold(
      backgroundColor: ColorConstants.backgroundColorWhite,
      body: Shimmer(
        linearGradient: shimmerGradient,
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                ColorConstants.primaryBlueDark,
                ColorConstants.primaryBlue,
                ColorConstants.primaryBlue50,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Column(
            children: [
              HomeHeaderWidget(),
              Expanded(
                child: Container(
                  margin: EdgeInsets.all(
                    10,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.75),
                    borderRadius: BorderRadius.circular(
                      20,
                    ),
                  ),
                  child: ref.watch(catController).maybeMap(
                    success: (success) {
                      final data = success.data as List<QuizCategoryFirebase>;
                      return GridView.builder(
                        shrinkWrap: true,
                        physics: const BouncingScrollPhysics(),
                        padding: const EdgeInsets.all(20),
                        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: crossAxisExtent,
                          // mainAxisExtent: crossAxisExtent,
                          mainAxisSpacing: 20,
                          crossAxisSpacing: 20,
                        ),
                        itemCount: data.length,
                        itemBuilder: (context, index) {
                          final item = data[index];
                          return QuizCategoryWidget(
                            label: item.name,
                            image: item.image,
                            isLoading: false,
                            onPressed: (context) {
                              Navigator.pushNamed(
                                context,
                                quizRoute,
                                arguments: {
                                  'category': item,
                                },
                              );
                            },
                          );
                        },
                      );
                    },
                    error: (error) {
                      return Center(
                        child: Text(
                          'Error Occured',
                          style: TextStyle(
                            color: Colors.red,
                          ),
                        ),
                      );
                    },
                    orElse: () {
                      return GridView.builder(
                        shrinkWrap: true,
                        physics: const BouncingScrollPhysics(),
                        padding: const EdgeInsets.all(20),
                        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: crossAxisExtent,
                          // mainAxisExtent: crossAxisExtent,
                          mainAxisSpacing: 20,
                          crossAxisSpacing: 20,
                        ),
                        itemCount: categories.length,
                        itemBuilder: _quizCategoryBuilder,
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HomeHeaderWidget extends ConsumerWidget {
  const HomeHeaderWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Session user = Session.defaultSession();
    final userState = ref.watch(userController.notifier).state;
    ref.listen<BaseState>(logOutController, (previous, next) {
      if (next is BaseSuccess) {
        Navigator.pushNamedAndRemoveUntil(
            context, app_route.loginRoute, (route) => false);
      }
    });
    if (userState is BaseSuccess) {
      user = userState.data as Session;
    }
    final greeting = getGreeting();
    final screenSize = MediaQuery.of(context).size;
    return Container(
      height: screenSize.height * 0.46,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 60,
          ),
          Row(
            children: [
              const SizedBox(
                width: 20,
              ),
              CircleAvatar(
                backgroundColor: ColorConstants.backgroundColor,
                maxRadius: 30,
                minRadius: 30,
                backgroundImage:
                    user.image.isNotEmpty ? NetworkImage(user.image) : null,
                child: Center(
                  child: Text(
                    user.displayName.initials(),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 2,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        'assets/images/${greeting.toLowerCase()}.png',
                        width: 20,
                        height: 15,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        'GOOD ${greeting.toUpperCase()}',
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.9),
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    '${user.displayName}',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
              const Expanded(child: SizedBox()),
              AppContainer(
                radius: 15,
                padding: EdgeInsets.all(
                  10,
                ),
                color: ColorConstants.purpleInpink,
                onPressed: (context) {
                  ref.read(logOutController.notifier).logOut();
                },
                child: Icon(
                  Icons.logout,
                  color: Colors.white,
                  size: 35,
                ),
              ),
              const SizedBox(
                width: 15,
              ),
            ],
          ),
          const SizedBox(
            height: 40,
          ),
          const Center(
            child: Text(
              'Play Random Quiz',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              const SizedBox(
                width: 20,
              ),
              QuizCategoryWidget(
                label: 'Random',
                image: '',
                logo: Icon(
                  FontAwesomeIcons.random,
                  size: 30,
                  color: Colors.white,
                ),
                isLoading: true,
                width: (screenSize.width - 100) / 3,
                height: (screenSize.width - 100) / 3,
                onPressed: (context) {
                  Navigator.pushNamed(
                    context,
                    quizRoute,
                    arguments: {
                      'category': QuizCategoryFirebase(
                        attribute: '',
                        name: 'Random',
                        image: '',
                      ),
                    },
                  );
                },
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          const Center(
            child: Text(
              'Choose category',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}

class QuizCategoryWidget extends StatelessWidget {
  const QuizCategoryWidget({
    Key? key,
    required this.label,
    required this.image,
    required this.onPressed,
    required this.isLoading,
    this.width,
    this.height,
    this.logo,
  }) : super(key: key);

  final String label;
  final String image;
  final Function(BuildContext) onPressed;
  final bool isLoading;
  final double? width;
  final double? height;
  final Icon? logo;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            ColorConstants.backgroundColor.withOpacity(0.6),
            ColorConstants.backgroundColor.withOpacity(0.2),
          ],
          begin: Alignment.bottomRight,
          end: Alignment.topLeft,
        ),
        borderRadius: BorderRadius.circular(5),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(.2),
            blurRadius: 1,
            spreadRadius: 1,
          )
        ],
      ),
      child: InkWell(
        onTap: () {
          onPressed.call(context);
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ShimmerLoading(
              isLoading: isLoading,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: image.isNotEmpty
                    ? Image.network(
                        image,
                        width: 50,
                        height: 50,
                      )
                    : Container(
                        width: 50,
                        height: 50,
                        color: logo == null ? Colors.grey : Colors.transparent,
                        child: Center(
                          child: logo,
                        ),
                      ),
              ),
            ),
            ShimmerLoading(
              isLoading: isLoading,
              child: label.isEmpty
                  ? Container(
                      margin: EdgeInsets.symmetric(
                        horizontal: 20,
                      ),
                      height: 15,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.red,
                      ),
                    )
                  : Text(
                      label,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
