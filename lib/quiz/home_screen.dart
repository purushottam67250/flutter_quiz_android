import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz_android/app/entities/base_state.dart';
import 'package:quiz_android/app_setup/firebase/auth_controller.dart';
import 'package:quiz_android/app_setup/routes/navigator_routes.dart';
import 'package:quiz_android/common/constants/color_constants.dart';
import 'package:quiz_android/common/constants/string_constants.dart';
import 'package:quiz_android/common/widgets/app_container.dart';
import 'package:quiz_android/util.dart';

final logOutController =
    StateNotifierProvider<AuthController, BaseState>(authController);

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  void initState() {
    super.initState();
    // ref.read(catController.notifier).getAllCategories();
  }

  Widget _quizCategoryBuilder(BuildContext context, int index) {
    return QuizCategoryWidget(
      label: categories[index],
      image: 'https://picsum.photos/250?image=$index',
      onPressed: (context) {
        Navigator.pushNamed(
          context,
          quizRoute,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final crossAxisExtent = (screenSize.width) / 3;
    return Scaffold(
      backgroundColor: ColorConstants.backgroundColor,
      body: SafeArea(
        child: CustomScrollView(
          physics: const NeverScrollableScrollPhysics(),
          slivers: [
            const SliverAppBar(
              elevation: 0,
              backgroundColor: ColorConstants.backgroundColor,
              pinned: true,
              expandedHeight: 165,
              collapsedHeight: 165,
              flexibleSpace: HomeHeaderWidget(),
            ),
            SliverFillRemaining(
              child: Container(
                color: Colors.white,
                child: GridView.builder(
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
                ),
              ),
            ),
          ],
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
    final greeting = getGreeting();
    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        Row(
          children: [
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
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'Madelyn Dias',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
            const Expanded(child: SizedBox()),
            const SizedBox(
              width: 20,
            ),
            InkWell(
              onTap: () {
                ref.read(logOutController.notifier).logOut();
              },
              child: const CircleAvatar(
                maxRadius: 25,
                minRadius: 25,
              ),
            ),
            const SizedBox(
              width: 20,
            ),
          ],
        ),
        const SizedBox(
          height: 40,
        ),
        Container(
          height: 54,
          width: double.infinity,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40),
              topRight: Radius.circular(40),
            ),
            color: Colors.white,
          ),
          child: const Center(
            child: Text(
              'Select quiz category',
              style: TextStyle(
                color: Colors.black87,
                fontSize: 24,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class QuizCategoryWidget extends StatelessWidget {
  const QuizCategoryWidget({
    Key? key,
    required this.label,
    required this.image,
    required this.onPressed,
  }) : super(key: key);

  final String label;
  final String image;
  final Function(BuildContext) onPressed;

  @override
  Widget build(BuildContext context) {
    return AppContainer(
      // transparentBackground: true,
      color: ColorConstants.backgroundColor.withOpacity(0.5),
      spreadRadius: 1,
      blurRadius: 1,
      onPressed: onPressed,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.network(
            image,
            width: 50,
            height: 50,
          ),
          Text(
            label,
            style: const TextStyle(
              color: Colors.white60,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
