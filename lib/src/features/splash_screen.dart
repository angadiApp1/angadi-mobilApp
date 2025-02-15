import 'package:angadiapp/src/features/home_shops/presentation/bloc/bloc/home_bloc.dart';
import 'package:angadiapp/src/features/home_shops/presentation/view/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:angadiapp/core/constants/assets.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    context.read<HomeBloc>().add(const HomeEvent.getLocationData());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocListener<HomeBloc, HomeBlocState>(
        listener: (context, state) {
          state.maybeWhen(
            loadedLocationData: (response) {
              Navigator.pushReplacement(
                context, 
                MaterialPageRoute(builder: (context) => const HomeScreen())
              );
            },
            errorLocationData: (error) {
              Navigator.pushReplacement(
                context, 
                MaterialPageRoute(builder: (context) => const ErrorHomeScreen())
              );
            },
            orElse: () {
              return const SizedBox.shrink();
            },
          );
        },
        child: Center(
          child: Image.asset(ImageAssets.logo, width: 200.w, height: 200.h),
        ),
      ),
    );
  }
}

class ErrorHomeScreen extends StatelessWidget {
  const ErrorHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: Text('Error')));
  }
}
