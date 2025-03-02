import 'package:angadiapp/core/constants/colors.dart';
import 'package:angadiapp/core/utils/shared_pref.dart';
import 'package:angadiapp/src/features/home_shops/presentation/bloc/bloc/home_bloc.dart';
import 'package:angadiapp/src/features/home_shops/presentation/provider/home_state.dart';
import 'package:angadiapp/src/features/home_shops/presentation/view/home_screen.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:angadiapp/core/constants/assets.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  // Track initialization state to prevent multiple navigations
  bool _isNavigating = false;

  @override
  void initState() {
    super.initState();
    _initializeApp();
  }

  void _initializeApp() {
    // Start the initialization flow by fetching location data
    context.read<HomeBloc>().add(const HomeEvent.getLocationData());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.themeMagenta,
      body: BlocListener<HomeBloc, HomeBlocState>(
        listener: _blocListener,
        child: _buildSplashContent(),
      ),
    );
  }

  Widget _buildSplashContent() {
    return Center(
      child: Image.asset(
        ImageAssets.logo,
        width: 120,
        height: 120,
      ),
    );
  }

  void _blocListener(BuildContext context, HomeBlocState state) {
    // Prevent multiple navigations
    if (_isNavigating) return;

    final notifier = ref.read(homeStateProviderProvider.notifier);
    final homeState = ref.read(homeStateProviderProvider);

    state.maybeWhen(
      // Handle location data loading
      loadedLocationData: (response) async {
        if (response == null) {
          _navigateToErrorScreen('No locations available');
          return;
        }

        notifier.setAvailableLocations(response);
        await _handleLocationSelection();
      },

      // Handle categories loading
      loadedCategories: (response) {
        notifier.setAvailableCategories(response);
        _fetchShops(homeState.selectedLocation?.id ?? '');
      },

      // Handle shops loading
      loadedShops: (response) {
        notifier.setAvailableShops(response.shops);
        _fetchBanners(homeState.selectedLocation?.id ?? '');
      },

      // Handle banners loading - final step before navigation
      loadedBanners: (response) {
        final bannerImages = response
            .map((banner) =>
                banner.images.isNotEmpty ? banner.images.first ?? "" : "")
            .where((image) => image.isNotEmpty)
            .toList();

        notifier.setAdvertisementBanners(bannerImages);
        _navigateToHomeScreen();
      },

      // Handle various error states
      errorLocationData: (error) {
        _navigateToErrorScreen('Failed to load locations: $error');
      },
      errorCategories: (error) {
        _navigateToErrorScreen('Failed to load categories: $error');
      },
      errorShops: (error) {
        _navigateToErrorScreen('Failed to load shops: $error');
      },
      errorBanners: (error) {
        // Even if banners fail, we can still show the home screen
        _navigateToHomeScreen();
      },
      orElse: () {},
    );
  }

  Future<void> _handleLocationSelection() async {
    final locations = ref.read(homeStateProviderProvider).availableLocations;
    final savedLocationId = await SharedPrefUtils.getLocationId();

    if (savedLocationId != null && savedLocationId.isNotEmpty) {
      // Try to find the saved location
      final selectedLocation = locations
          .firstWhereOrNull((location) => location.id == savedLocationId);

      if (selectedLocation != null) {
        ref
            .read(homeStateProviderProvider.notifier)
            .setSelectedLocation(selectedLocation);
        _fetchCategories();
      } else {
        // If saved location no longer exists, proceed to home screen for manual selection
        _navigateToHomeScreen();
      }
    } else {
      // No saved location, proceed to home screen for manual selection
      _navigateToHomeScreen();
    }
  }

  void _fetchCategories() {
    context.read<HomeBloc>().add(HomeEvent.getCategories());
  }

  void _fetchShops(String locationId) {
    context.read<HomeBloc>().add(HomeEvent.getShops(locationId));
  }

  void _fetchBanners(String locationId) {
    context.read<HomeBloc>().add(HomeEvent.getBanners(locationId));
  }

  void _navigateToHomeScreen() {
    if (_isNavigating) return;
    _isNavigating = true;

    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const HomeScreen()));
  }

  void _navigateToErrorScreen(String errorMessage) {
    if (_isNavigating) return;
    _isNavigating = true;

    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => ErrorHomeScreen(errorMessage: errorMessage)));
  }
}

class ErrorHomeScreen extends StatelessWidget {
  final String errorMessage;

  const ErrorHomeScreen(
      {super.key,
      this.errorMessage = 'An error occurred while loading the app'});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.error_outline, size: 64.sp, color: Colors.red),
              SizedBox(height: 16.h),
              Text(
                'Oops! Something went wrong',
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 8.h),
              Text(
                errorMessage,
                style: TextStyle(fontSize: 16.sp),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 24.h),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SplashScreen()),
                  );
                },
                child: const Text('Try Again'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
