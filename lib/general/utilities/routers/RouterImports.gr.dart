// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i39;
import 'package:flutter/material.dart' as _i40;

import '../../../customer/models/AdsDataModel.dart' as _i46;
import '../../../customer/models/AdsModel.dart' as _i45;
import '../../../customer/models/Dtos/AddAdsModel.dart' as _i44;
import '../../../customer/models/Dtos/RegisterModel.dart' as _i41;
import '../../../customer/models/Dtos/UpdateAdModel.dart' as _i47;
import '../../../customer/models/ImageModel.dart' as _i49;
import '../../../customer/models/OffersHeaderModel.dart' as _i43;
import '../../../customer/screens/add_car_followers/AddCarFollower.dart'
    as _i30;
import '../../../customer/screens/add_offer_details/OfferDetailsImports.dart'
    as _i16;
import '../../../customer/screens/add_offer_images/AddOfferImagesImports.dart'
    as _i17;
import '../../../customer/screens/add_offer_location/AddOfferLocImports.dart'
    as _i14;
import '../../../customer/screens/add_offer_success/OfferSuccessImports.dart'
    as _i18;
import '../../../customer/screens/add_offers/AddOfferImports.dart' as _i12;
import '../../../customer/screens/admin_banks/AdminBanksImports.dart' as _i35;
import '../../../customer/screens/bank_payment/BankPaymentImports.dart' as _i36;
import '../../../customer/screens/call_us/CallUsImports.dart' as _i37;
import '../../../customer/screens/change_password/ChangePasswordImports.dart'
    as _i33;
import '../../../customer/screens/chat/ChatImports.dart' as _i23;
import '../../../customer/screens/edit_offer_details/EditDetailsImports.dart'
    as _i27;
import '../../../customer/screens/edit_offer_images/EditOfferImagesImports.dart'
    as _i25;
import '../../../customer/screens/edit_offer_location/EditOfferLocImports.dart'
    as _i26;
import '../../../customer/screens/edit_offer_success/EditOfferSuccessImports.dart'
    as _i28;
import '../../../customer/screens/edit_profile/EditProfileImports.dart' as _i32;
import '../../../customer/screens/filter_location/FilterLocationImports.dart'
    as _i38;
import '../../../customer/screens/followers/FollowerImports.dart' as _i29;
import '../../../customer/screens/home/HomeImports.dart' as _i11;
import '../../../customer/screens/location_address/LocationAddressImports.dart'
    as _i15;
import '../../../customer/screens/my_products/MyProductsImports.dart' as _i24;
import '../../../customer/screens/offer_swearing/OfferSwearingImports.dart'
    as _i13;
import '../../../customer/screens/product_comments/ProCommentsImports.dart'
    as _i20;
import '../../../customer/screens/product_details/ProDetailsImports.dart'
    as _i19;
import '../../../customer/screens/profile/ProfileImports.dart' as _i31;
import '../../../customer/screens/register/Register.dart' as _i3;
import '../../../customer/screens/register/register_complete/RegisterComplete.dart'
    as _i4;
import '../../../customer/screens/user_comments/UserCommentsImports.dart'
    as _i22;
import '../../../customer/screens/user_products/UserProductsImports.dart'
    as _i21;
import '../../models/PageModel.dart' as _i42;
import '../../models/UserModel.dart' as _i48;
import '../../screens/active_account/ActiveAccount.dart' as _i6;
import '../../screens/ContactUs.dart' as _i10;
import '../../screens/forget_password/ForgetPasswordImports.dart' as _i5;
import '../../screens/ImageZoom.dart' as _i34;
import '../../screens/login/LoginImports.dart' as _i2;
import '../../screens/remote_page/RemotePage.dart' as _i8;
import '../../screens/reset_password/ResetPasswordImports.dart' as _i7;
import '../../screens/splash/Splash.dart' as _i1;
import '../../screens/Terms.dart' as _i9;

class AppRouter extends _i39.RootStackRouter {
  AppRouter([_i40.GlobalKey<_i40.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i39.PageFactory> pagesMap = {
    SplashRoute.name: (routeData) {
      return _i39.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.Splash(),
      );
    },
    LoginRoute.name: (routeData) {
      return _i39.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i2.Login(),
        transitionsBuilder: _i39.TransitionsBuilders.slideRightWithFade,
        opaque: true,
        barrierDismissible: false,
      );
    },
    RegisterRoute.name: (routeData) {
      return _i39.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i3.Register(),
        transitionsBuilder: _i39.TransitionsBuilders.slideRightWithFade,
        opaque: true,
        barrierDismissible: false,
      );
    },
    RegisterCompleteRoute.name: (routeData) {
      final args = routeData.argsAs<RegisterCompleteRouteArgs>();
      return _i39.CustomPage<dynamic>(
        routeData: routeData,
        child: _i4.RegisterComplete(
          key: args.key,
          model: args.model,
        ),
        transitionsBuilder: _i39.TransitionsBuilders.slideRightWithFade,
        opaque: true,
        barrierDismissible: false,
      );
    },
    ForgetPasswordRoute.name: (routeData) {
      return _i39.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i5.ForgetPassword(),
        transitionsBuilder: _i39.TransitionsBuilders.slideRightWithFade,
        opaque: true,
        barrierDismissible: false,
      );
    },
    ActiveAccountRoute.name: (routeData) {
      final args = routeData.argsAs<ActiveAccountRouteArgs>();
      return _i39.CustomPage<dynamic>(
        routeData: routeData,
        child: _i6.ActiveAccount(
          key: args.key,
          model: args.model,
        ),
        transitionsBuilder: _i39.TransitionsBuilders.slideRightWithFade,
        opaque: true,
        barrierDismissible: false,
      );
    },
    ResetPasswordRoute.name: (routeData) {
      final args = routeData.argsAs<ResetPasswordRouteArgs>();
      return _i39.CustomPage<dynamic>(
        routeData: routeData,
        child: _i7.ResetPassword(
          key: args.key,
          userId: args.userId,
        ),
        transitionsBuilder: _i39.TransitionsBuilders.slideRightWithFade,
        opaque: true,
        barrierDismissible: false,
      );
    },
    RemotePageRoute.name: (routeData) {
      final args = routeData.argsAs<RemotePageRouteArgs>();
      return _i39.CustomPage<dynamic>(
        routeData: routeData,
        child: _i8.RemotePage(
          key: args.key,
          page: args.page,
        ),
        transitionsBuilder: _i39.TransitionsBuilders.slideRightWithFade,
        opaque: true,
        barrierDismissible: false,
      );
    },
    TermsRoute.name: (routeData) {
      return _i39.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i9.Terms(),
        transitionsBuilder: _i39.TransitionsBuilders.slideRightWithFade,
        opaque: true,
        barrierDismissible: false,
      );
    },
    ContactUsRoute.name: (routeData) {
      return _i39.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i10.ContactUs(),
        transitionsBuilder: _i39.TransitionsBuilders.slideRightWithFade,
        opaque: true,
        barrierDismissible: false,
      );
    },
    HomeRoute.name: (routeData) {
      final args = routeData.argsAs<HomeRouteArgs>();
      return _i39.CustomPage<dynamic>(
        routeData: routeData,
        child: _i11.Home(
          key: args.key,
          parentCount: args.parentCount,
          tab: args.tab,
        ),
        transitionsBuilder: _i39.TransitionsBuilders.slideRightWithFade,
        opaque: true,
        barrierDismissible: false,
      );
    },
    AddOffersRoute.name: (routeData) {
      return _i39.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i12.AddOffers(),
        transitionsBuilder: _i39.TransitionsBuilders.slideRightWithFade,
        opaque: true,
        barrierDismissible: false,
      );
    },
    OfferSwearingRoute.name: (routeData) {
      final args = routeData.argsAs<OfferSwearingRouteArgs>();
      return _i39.CustomPage<dynamic>(
        routeData: routeData,
        child: _i13.OfferSwearing(
          key: args.key,
          model: args.model,
        ),
        transitionsBuilder: _i39.TransitionsBuilders.slideRightWithFade,
        opaque: true,
        barrierDismissible: false,
      );
    },
    AddOfferLocationRoute.name: (routeData) {
      final args = routeData.argsAs<AddOfferLocationRouteArgs>();
      return _i39.CustomPage<dynamic>(
        routeData: routeData,
        child: _i14.AddOfferLocation(
          key: args.key,
          model: args.model,
        ),
        transitionsBuilder: _i39.TransitionsBuilders.slideRightWithFade,
        opaque: true,
        barrierDismissible: false,
      );
    },
    LocationAddressRoute.name: (routeData) {
      final args = routeData.argsAs<LocationAddressRouteArgs>();
      return _i39.CustomPage<dynamic>(
        routeData: routeData,
        child: _i15.LocationAddress(
          key: args.key,
          lat: args.lat,
          lng: args.lng,
        ),
        transitionsBuilder: _i39.TransitionsBuilders.slideRightWithFade,
        opaque: true,
        barrierDismissible: false,
      );
    },
    AddOfferDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<AddOfferDetailsRouteArgs>();
      return _i39.CustomPage<dynamic>(
        routeData: routeData,
        child: _i16.AddOfferDetails(
          key: args.key,
          model: args.model,
        ),
        transitionsBuilder: _i39.TransitionsBuilders.slideRightWithFade,
        opaque: true,
        barrierDismissible: false,
      );
    },
    AddOfferImagesRoute.name: (routeData) {
      final args = routeData.argsAs<AddOfferImagesRouteArgs>();
      return _i39.CustomPage<dynamic>(
        routeData: routeData,
        child: _i17.AddOfferImages(
          key: args.key,
          model: args.model,
        ),
        transitionsBuilder: _i39.TransitionsBuilders.slideRightWithFade,
        opaque: true,
        barrierDismissible: false,
      );
    },
    AddOfferSuccessRoute.name: (routeData) {
      return _i39.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i18.AddOfferSuccess(),
        transitionsBuilder: _i39.TransitionsBuilders.slideRightWithFade,
        opaque: true,
        barrierDismissible: false,
      );
    },
    ProductDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<ProductDetailsRouteArgs>();
      return _i39.CustomPage<dynamic>(
        routeData: routeData,
        child: _i19.ProductDetails(
          key: args.key,
          model: args.model,
          info: args.info,
        ),
        transitionsBuilder: _i39.TransitionsBuilders.slideRightWithFade,
        opaque: true,
        barrierDismissible: false,
      );
    },
    ProductCommentsRoute.name: (routeData) {
      final args = routeData.argsAs<ProductCommentsRouteArgs>();
      return _i39.CustomPage<dynamic>(
        routeData: routeData,
        child: _i20.ProductComments(
          key: args.key,
          adsId: args.adsId,
          hideReply: args.hideReply,
        ),
        transitionsBuilder: _i39.TransitionsBuilders.slideRightWithFade,
        opaque: true,
        barrierDismissible: false,
      );
    },
    UserProductsRoute.name: (routeData) {
      final args = routeData.argsAs<UserProductsRouteArgs>();
      return _i39.CustomPage<dynamic>(
        routeData: routeData,
        child: _i21.UserProducts(
          key: args.key,
          userId: args.userId,
          userName: args.userName,
        ),
        transitionsBuilder: _i39.TransitionsBuilders.slideRightWithFade,
        opaque: true,
        barrierDismissible: false,
      );
    },
    UserCommentsRoute.name: (routeData) {
      final args = routeData.argsAs<UserCommentsRouteArgs>();
      return _i39.CustomPage<dynamic>(
        routeData: routeData,
        child: _i22.UserComments(
          key: args.key,
          userId: args.userId,
        ),
        transitionsBuilder: _i39.TransitionsBuilders.slideRightWithFade,
        opaque: true,
        barrierDismissible: false,
      );
    },
    ChatRoute.name: (routeData) {
      final args = routeData.argsAs<ChatRouteArgs>();
      return _i39.CustomPage<dynamic>(
        routeData: routeData,
        child: _i23.Chat(
          key: args.key,
          senderId: args.senderId,
          receiverId: args.receiverId,
          userName: args.userName,
        ),
        transitionsBuilder: _i39.TransitionsBuilders.slideRightWithFade,
        opaque: true,
        barrierDismissible: false,
      );
    },
    MyProductsRoute.name: (routeData) {
      return _i39.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i24.MyProducts(),
        transitionsBuilder: _i39.TransitionsBuilders.slideRightWithFade,
        opaque: true,
        barrierDismissible: false,
      );
    },
    EditOfferImagesRoute.name: (routeData) {
      final args = routeData.argsAs<EditOfferImagesRouteArgs>();
      return _i39.CustomPage<dynamic>(
        routeData: routeData,
        child: _i25.EditOfferImages(
          key: args.key,
          model: args.model,
        ),
        transitionsBuilder: _i39.TransitionsBuilders.slideRightWithFade,
        opaque: true,
        barrierDismissible: false,
      );
    },
    EditOfferLocationRoute.name: (routeData) {
      final args = routeData.argsAs<EditOfferLocationRouteArgs>();
      return _i39.CustomPage<dynamic>(
        routeData: routeData,
        child: _i26.EditOfferLocation(
          key: args.key,
          model: args.model,
          adModel: args.adModel,
        ),
        transitionsBuilder: _i39.TransitionsBuilders.slideRightWithFade,
        opaque: true,
        barrierDismissible: false,
      );
    },
    EditOfferDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<EditOfferDetailsRouteArgs>();
      return _i39.CustomPage<dynamic>(
        routeData: routeData,
        child: _i27.EditOfferDetails(
          key: args.key,
          model: args.model,
          adModel: args.adModel,
        ),
        transitionsBuilder: _i39.TransitionsBuilders.slideRightWithFade,
        opaque: true,
        barrierDismissible: false,
      );
    },
    EditOfferSuccessRoute.name: (routeData) {
      return _i39.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i28.EditOfferSuccess(),
        transitionsBuilder: _i39.TransitionsBuilders.slideRightWithFade,
        opaque: true,
        barrierDismissible: false,
      );
    },
    FollowersRoute.name: (routeData) {
      return _i39.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i29.Followers(),
        transitionsBuilder: _i39.TransitionsBuilders.slideRightWithFade,
        opaque: true,
        barrierDismissible: false,
      );
    },
    AddCarFollowerRoute.name: (routeData) {
      final args = routeData.argsAs<AddCarFollowerRouteArgs>(
          orElse: () => const AddCarFollowerRouteArgs());
      return _i39.CustomPage<dynamic>(
        routeData: routeData,
        child: _i30.AddCarFollower(key: args.key),
        transitionsBuilder: _i39.TransitionsBuilders.slideRightWithFade,
        opaque: true,
        barrierDismissible: false,
      );
    },
    ProfileRoute.name: (routeData) {
      final args = routeData.argsAs<ProfileRouteArgs>(
          orElse: () => const ProfileRouteArgs());
      return _i39.CustomPage<dynamic>(
        routeData: routeData,
        child: _i31.Profile(
          key: args.key,
          name: args.name,
        ),
        transitionsBuilder: _i39.TransitionsBuilders.slideRightWithFade,
        opaque: true,
        barrierDismissible: false,
      );
    },
    EditProfileRoute.name: (routeData) {
      final args = routeData.argsAs<EditProfileRouteArgs>();
      return _i39.CustomPage<dynamic>(
        routeData: routeData,
        child: _i32.EditProfile(
          key: args.key,
          user: args.user,
        ),
        transitionsBuilder: _i39.TransitionsBuilders.slideRightWithFade,
        opaque: true,
        barrierDismissible: false,
      );
    },
    ChangePasswordRoute.name: (routeData) {
      return _i39.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i33.ChangePassword(),
        transitionsBuilder: _i39.TransitionsBuilders.slideRightWithFade,
        opaque: true,
        barrierDismissible: false,
      );
    },
    ImageZoomRoute.name: (routeData) {
      final args = routeData.argsAs<ImageZoomRouteArgs>();
      return _i39.CustomPage<dynamic>(
        routeData: routeData,
        child: _i34.ImageZoom(
          args.images,
          args.index,
          key: args.key,
        ),
        transitionsBuilder: _i39.TransitionsBuilders.slideRightWithFade,
        opaque: true,
        barrierDismissible: false,
      );
    },
    AdminBanksRoute.name: (routeData) {
      return _i39.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i35.AdminBanks(),
        transitionsBuilder: _i39.TransitionsBuilders.slideRightWithFade,
        opaque: true,
        barrierDismissible: false,
      );
    },
    BankPaymentRoute.name: (routeData) {
      return _i39.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i36.BankPayment(),
        transitionsBuilder: _i39.TransitionsBuilders.slideRightWithFade,
        opaque: true,
        barrierDismissible: false,
      );
    },
    CallUsRoute.name: (routeData) {
      return _i39.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i37.CallUs(),
        transitionsBuilder: _i39.TransitionsBuilders.slideRightWithFade,
        opaque: true,
        barrierDismissible: false,
      );
    },
    FilterLocationRoute.name: (routeData) {
      final args = routeData.argsAs<FilterLocationRouteArgs>();
      return _i39.CustomPage<dynamic>(
        routeData: routeData,
        child: _i38.FilterLocation(
          key: args.key,
          lat: args.lat,
          lng: args.lng,
        ),
        transitionsBuilder: _i39.TransitionsBuilders.slideRightWithFade,
        opaque: true,
        barrierDismissible: false,
      );
    },
  };

  @override
  List<_i39.RouteConfig> get routes => [
        _i39.RouteConfig(
          SplashRoute.name,
          path: '/',
        ),
        _i39.RouteConfig(
          LoginRoute.name,
          path: '/Login',
        ),
        _i39.RouteConfig(
          RegisterRoute.name,
          path: '/Register',
        ),
        _i39.RouteConfig(
          RegisterCompleteRoute.name,
          path: '/register-complete',
        ),
        _i39.RouteConfig(
          ForgetPasswordRoute.name,
          path: '/forget-password',
        ),
        _i39.RouteConfig(
          ActiveAccountRoute.name,
          path: '/active-account',
        ),
        _i39.RouteConfig(
          ResetPasswordRoute.name,
          path: '/reset-password',
        ),
        _i39.RouteConfig(
          RemotePageRoute.name,
          path: '/remote-page',
        ),
        _i39.RouteConfig(
          TermsRoute.name,
          path: '/Terms',
        ),
        _i39.RouteConfig(
          ContactUsRoute.name,
          path: '/contact-us',
        ),
        _i39.RouteConfig(
          HomeRoute.name,
          path: '/Home',
        ),
        _i39.RouteConfig(
          AddOffersRoute.name,
          path: '/add-offers',
        ),
        _i39.RouteConfig(
          OfferSwearingRoute.name,
          path: '/offer-swearing',
        ),
        _i39.RouteConfig(
          AddOfferLocationRoute.name,
          path: '/add-offer-location',
        ),
        _i39.RouteConfig(
          LocationAddressRoute.name,
          path: '/location-address',
        ),
        _i39.RouteConfig(
          AddOfferDetailsRoute.name,
          path: '/add-offer-details',
        ),
        _i39.RouteConfig(
          AddOfferImagesRoute.name,
          path: '/add-offer-images',
        ),
        _i39.RouteConfig(
          AddOfferSuccessRoute.name,
          path: '/add-offer-success',
        ),
        _i39.RouteConfig(
          ProductDetailsRoute.name,
          path: '/product-details',
        ),
        _i39.RouteConfig(
          ProductCommentsRoute.name,
          path: '/product-comments',
        ),
        _i39.RouteConfig(
          UserProductsRoute.name,
          path: '/user-products',
        ),
        _i39.RouteConfig(
          UserCommentsRoute.name,
          path: '/user-comments',
        ),
        _i39.RouteConfig(
          ChatRoute.name,
          path: '/Chat',
        ),
        _i39.RouteConfig(
          MyProductsRoute.name,
          path: '/my-products',
        ),
        _i39.RouteConfig(
          EditOfferImagesRoute.name,
          path: '/edit-offer-images',
        ),
        _i39.RouteConfig(
          EditOfferLocationRoute.name,
          path: '/edit-offer-location',
        ),
        _i39.RouteConfig(
          EditOfferDetailsRoute.name,
          path: '/edit-offer-details',
        ),
        _i39.RouteConfig(
          EditOfferSuccessRoute.name,
          path: '/edit-offer-success',
        ),
        _i39.RouteConfig(
          FollowersRoute.name,
          path: '/Followers',
        ),
        _i39.RouteConfig(
          AddCarFollowerRoute.name,
          path: '/add-car-follower',
        ),
        _i39.RouteConfig(
          ProfileRoute.name,
          path: '/Profile',
        ),
        _i39.RouteConfig(
          EditProfileRoute.name,
          path: '/edit-profile',
        ),
        _i39.RouteConfig(
          ChangePasswordRoute.name,
          path: '/change-password',
        ),
        _i39.RouteConfig(
          ImageZoomRoute.name,
          path: '/image-zoom',
        ),
        _i39.RouteConfig(
          AdminBanksRoute.name,
          path: '/admin-banks',
        ),
        _i39.RouteConfig(
          BankPaymentRoute.name,
          path: '/bank-payment',
        ),
        _i39.RouteConfig(
          CallUsRoute.name,
          path: '/call-us',
        ),
        _i39.RouteConfig(
          FilterLocationRoute.name,
          path: '/filter-location',
        ),
      ];
}

/// generated route for
/// [_i1.Splash]
class SplashRoute extends _i39.PageRouteInfo<void> {
  const SplashRoute()
      : super(
          SplashRoute.name,
          path: '/',
        );

  static const String name = 'SplashRoute';
}

/// generated route for
/// [_i2.Login]
class LoginRoute extends _i39.PageRouteInfo<void> {
  const LoginRoute()
      : super(
          LoginRoute.name,
          path: '/Login',
        );

  static const String name = 'LoginRoute';
}

/// generated route for
/// [_i3.Register]
class RegisterRoute extends _i39.PageRouteInfo<void> {
  const RegisterRoute()
      : super(
          RegisterRoute.name,
          path: '/Register',
        );

  static const String name = 'RegisterRoute';
}

/// generated route for
/// [_i4.RegisterComplete]
class RegisterCompleteRoute
    extends _i39.PageRouteInfo<RegisterCompleteRouteArgs> {
  RegisterCompleteRoute({
    _i40.Key? key,
    required _i41.RegisterModel model,
  }) : super(
          RegisterCompleteRoute.name,
          path: '/register-complete',
          args: RegisterCompleteRouteArgs(
            key: key,
            model: model,
          ),
        );

  static const String name = 'RegisterCompleteRoute';
}

class RegisterCompleteRouteArgs {
  const RegisterCompleteRouteArgs({
    this.key,
    required this.model,
  });

  final _i40.Key? key;

  final _i41.RegisterModel model;

  @override
  String toString() {
    return 'RegisterCompleteRouteArgs{key: $key, model: $model}';
  }
}

/// generated route for
/// [_i5.ForgetPassword]
class ForgetPasswordRoute extends _i39.PageRouteInfo<void> {
  const ForgetPasswordRoute()
      : super(
          ForgetPasswordRoute.name,
          path: '/forget-password',
        );

  static const String name = 'ForgetPasswordRoute';
}

/// generated route for
/// [_i6.ActiveAccount]
class ActiveAccountRoute extends _i39.PageRouteInfo<ActiveAccountRouteArgs> {
  ActiveAccountRoute({
    _i40.Key? key,
    required _i41.RegisterModel model,
  }) : super(
          ActiveAccountRoute.name,
          path: '/active-account',
          args: ActiveAccountRouteArgs(
            key: key,
            model: model,
          ),
        );

  static const String name = 'ActiveAccountRoute';
}

class ActiveAccountRouteArgs {
  const ActiveAccountRouteArgs({
    this.key,
    required this.model,
  });

  final _i40.Key? key;

  final _i41.RegisterModel model;

  @override
  String toString() {
    return 'ActiveAccountRouteArgs{key: $key, model: $model}';
  }
}

/// generated route for
/// [_i7.ResetPassword]
class ResetPasswordRoute extends _i39.PageRouteInfo<ResetPasswordRouteArgs> {
  ResetPasswordRoute({
    _i40.Key? key,
    required String userId,
  }) : super(
          ResetPasswordRoute.name,
          path: '/reset-password',
          args: ResetPasswordRouteArgs(
            key: key,
            userId: userId,
          ),
        );

  static const String name = 'ResetPasswordRoute';
}

class ResetPasswordRouteArgs {
  const ResetPasswordRouteArgs({
    this.key,
    required this.userId,
  });

  final _i40.Key? key;

  final String userId;

  @override
  String toString() {
    return 'ResetPasswordRouteArgs{key: $key, userId: $userId}';
  }
}

/// generated route for
/// [_i8.RemotePage]
class RemotePageRoute extends _i39.PageRouteInfo<RemotePageRouteArgs> {
  RemotePageRoute({
    _i40.Key? key,
    required _i42.PageModel page,
  }) : super(
          RemotePageRoute.name,
          path: '/remote-page',
          args: RemotePageRouteArgs(
            key: key,
            page: page,
          ),
        );

  static const String name = 'RemotePageRoute';
}

class RemotePageRouteArgs {
  const RemotePageRouteArgs({
    this.key,
    required this.page,
  });

  final _i40.Key? key;

  final _i42.PageModel page;

  @override
  String toString() {
    return 'RemotePageRouteArgs{key: $key, page: $page}';
  }
}

/// generated route for
/// [_i9.Terms]
class TermsRoute extends _i39.PageRouteInfo<void> {
  const TermsRoute()
      : super(
          TermsRoute.name,
          path: '/Terms',
        );

  static const String name = 'TermsRoute';
}

/// generated route for
/// [_i10.ContactUs]
class ContactUsRoute extends _i39.PageRouteInfo<void> {
  const ContactUsRoute()
      : super(
          ContactUsRoute.name,
          path: '/contact-us',
        );

  static const String name = 'ContactUsRoute';
}

/// generated route for
/// [_i11.Home]
class HomeRoute extends _i39.PageRouteInfo<HomeRouteArgs> {
  HomeRoute({
    _i40.Key? key,
    required int parentCount,
    int tab = 0,
  }) : super(
          HomeRoute.name,
          path: '/Home',
          args: HomeRouteArgs(
            key: key,
            parentCount: parentCount,
            tab: tab,
          ),
        );

  static const String name = 'HomeRoute';
}

class HomeRouteArgs {
  const HomeRouteArgs({
    this.key,
    required this.parentCount,
    this.tab = 0,
  });

  final _i40.Key? key;

  final int parentCount;

  final int tab;

  @override
  String toString() {
    return 'HomeRouteArgs{key: $key, parentCount: $parentCount, tab: $tab}';
  }
}

/// generated route for
/// [_i12.AddOffers]
class AddOffersRoute extends _i39.PageRouteInfo<void> {
  const AddOffersRoute()
      : super(
          AddOffersRoute.name,
          path: '/add-offers',
        );

  static const String name = 'AddOffersRoute';
}

/// generated route for
/// [_i13.OfferSwearing]
class OfferSwearingRoute extends _i39.PageRouteInfo<OfferSwearingRouteArgs> {
  OfferSwearingRoute({
    _i40.Key? key,
    required _i43.OffersHeaderModel model,
  }) : super(
          OfferSwearingRoute.name,
          path: '/offer-swearing',
          args: OfferSwearingRouteArgs(
            key: key,
            model: model,
          ),
        );

  static const String name = 'OfferSwearingRoute';
}

class OfferSwearingRouteArgs {
  const OfferSwearingRouteArgs({
    this.key,
    required this.model,
  });

  final _i40.Key? key;

  final _i43.OffersHeaderModel model;

  @override
  String toString() {
    return 'OfferSwearingRouteArgs{key: $key, model: $model}';
  }
}

/// generated route for
/// [_i14.AddOfferLocation]
class AddOfferLocationRoute
    extends _i39.PageRouteInfo<AddOfferLocationRouteArgs> {
  AddOfferLocationRoute({
    _i40.Key? key,
    required _i44.AddAdsModel model,
  }) : super(
          AddOfferLocationRoute.name,
          path: '/add-offer-location',
          args: AddOfferLocationRouteArgs(
            key: key,
            model: model,
          ),
        );

  static const String name = 'AddOfferLocationRoute';
}

class AddOfferLocationRouteArgs {
  const AddOfferLocationRouteArgs({
    this.key,
    required this.model,
  });

  final _i40.Key? key;

  final _i44.AddAdsModel model;

  @override
  String toString() {
    return 'AddOfferLocationRouteArgs{key: $key, model: $model}';
  }
}

/// generated route for
/// [_i15.LocationAddress]
class LocationAddressRoute
    extends _i39.PageRouteInfo<LocationAddressRouteArgs> {
  LocationAddressRoute({
    _i40.Key? key,
    required double lat,
    required double lng,
  }) : super(
          LocationAddressRoute.name,
          path: '/location-address',
          args: LocationAddressRouteArgs(
            key: key,
            lat: lat,
            lng: lng,
          ),
        );

  static const String name = 'LocationAddressRoute';
}

class LocationAddressRouteArgs {
  const LocationAddressRouteArgs({
    this.key,
    required this.lat,
    required this.lng,
  });

  final _i40.Key? key;

  final double lat;

  final double lng;

  @override
  String toString() {
    return 'LocationAddressRouteArgs{key: $key, lat: $lat, lng: $lng}';
  }
}

/// generated route for
/// [_i16.AddOfferDetails]
class AddOfferDetailsRoute
    extends _i39.PageRouteInfo<AddOfferDetailsRouteArgs> {
  AddOfferDetailsRoute({
    _i40.Key? key,
    required _i44.AddAdsModel model,
  }) : super(
          AddOfferDetailsRoute.name,
          path: '/add-offer-details',
          args: AddOfferDetailsRouteArgs(
            key: key,
            model: model,
          ),
        );

  static const String name = 'AddOfferDetailsRoute';
}

class AddOfferDetailsRouteArgs {
  const AddOfferDetailsRouteArgs({
    this.key,
    required this.model,
  });

  final _i40.Key? key;

  final _i44.AddAdsModel model;

  @override
  String toString() {
    return 'AddOfferDetailsRouteArgs{key: $key, model: $model}';
  }
}

/// generated route for
/// [_i17.AddOfferImages]
class AddOfferImagesRoute extends _i39.PageRouteInfo<AddOfferImagesRouteArgs> {
  AddOfferImagesRoute({
    _i40.Key? key,
    required _i43.OffersHeaderModel model,
  }) : super(
          AddOfferImagesRoute.name,
          path: '/add-offer-images',
          args: AddOfferImagesRouteArgs(
            key: key,
            model: model,
          ),
        );

  static const String name = 'AddOfferImagesRoute';
}

class AddOfferImagesRouteArgs {
  const AddOfferImagesRouteArgs({
    this.key,
    required this.model,
  });

  final _i40.Key? key;

  final _i43.OffersHeaderModel model;

  @override
  String toString() {
    return 'AddOfferImagesRouteArgs{key: $key, model: $model}';
  }
}

/// generated route for
/// [_i18.AddOfferSuccess]
class AddOfferSuccessRoute extends _i39.PageRouteInfo<void> {
  const AddOfferSuccessRoute()
      : super(
          AddOfferSuccessRoute.name,
          path: '/add-offer-success',
        );

  static const String name = 'AddOfferSuccessRoute';
}

/// generated route for
/// [_i19.ProductDetails]
class ProductDetailsRoute extends _i39.PageRouteInfo<ProductDetailsRouteArgs> {
  ProductDetailsRoute({
    _i40.Key? key,
    required _i45.AdsModel model,
    _i46.AdsDataModel? info,
  }) : super(
          ProductDetailsRoute.name,
          path: '/product-details',
          args: ProductDetailsRouteArgs(
            key: key,
            model: model,
            info: info,
          ),
        );

  static const String name = 'ProductDetailsRoute';
}

class ProductDetailsRouteArgs {
  const ProductDetailsRouteArgs({
    this.key,
    required this.model,
    this.info,
  });

  final _i40.Key? key;

  final _i45.AdsModel model;

  final _i46.AdsDataModel? info;

  @override
  String toString() {
    return 'ProductDetailsRouteArgs{key: $key, model: $model, info: $info}';
  }
}

/// generated route for
/// [_i20.ProductComments]
class ProductCommentsRoute
    extends _i39.PageRouteInfo<ProductCommentsRouteArgs> {
  ProductCommentsRoute({
    _i40.Key? key,
    required int adsId,
    required bool hideReply,
  }) : super(
          ProductCommentsRoute.name,
          path: '/product-comments',
          args: ProductCommentsRouteArgs(
            key: key,
            adsId: adsId,
            hideReply: hideReply,
          ),
        );

  static const String name = 'ProductCommentsRoute';
}

class ProductCommentsRouteArgs {
  const ProductCommentsRouteArgs({
    this.key,
    required this.adsId,
    required this.hideReply,
  });

  final _i40.Key? key;

  final int adsId;

  final bool hideReply;

  @override
  String toString() {
    return 'ProductCommentsRouteArgs{key: $key, adsId: $adsId, hideReply: $hideReply}';
  }
}

/// generated route for
/// [_i21.UserProducts]
class UserProductsRoute extends _i39.PageRouteInfo<UserProductsRouteArgs> {
  UserProductsRoute({
    _i40.Key? key,
    required String userId,
    required String userName,
  }) : super(
          UserProductsRoute.name,
          path: '/user-products',
          args: UserProductsRouteArgs(
            key: key,
            userId: userId,
            userName: userName,
          ),
        );

  static const String name = 'UserProductsRoute';
}

class UserProductsRouteArgs {
  const UserProductsRouteArgs({
    this.key,
    required this.userId,
    required this.userName,
  });

  final _i40.Key? key;

  final String userId;

  final String userName;

  @override
  String toString() {
    return 'UserProductsRouteArgs{key: $key, userId: $userId, userName: $userName}';
  }
}

/// generated route for
/// [_i22.UserComments]
class UserCommentsRoute extends _i39.PageRouteInfo<UserCommentsRouteArgs> {
  UserCommentsRoute({
    _i40.Key? key,
    required String userId,
  }) : super(
          UserCommentsRoute.name,
          path: '/user-comments',
          args: UserCommentsRouteArgs(
            key: key,
            userId: userId,
          ),
        );

  static const String name = 'UserCommentsRoute';
}

class UserCommentsRouteArgs {
  const UserCommentsRouteArgs({
    this.key,
    required this.userId,
  });

  final _i40.Key? key;

  final String userId;

  @override
  String toString() {
    return 'UserCommentsRouteArgs{key: $key, userId: $userId}';
  }
}

/// generated route for
/// [_i23.Chat]
class ChatRoute extends _i39.PageRouteInfo<ChatRouteArgs> {
  ChatRoute({
    _i40.Key? key,
    required String senderId,
    required String receiverId,
    required String userName,
  }) : super(
          ChatRoute.name,
          path: '/Chat',
          args: ChatRouteArgs(
            key: key,
            senderId: senderId,
            receiverId: receiverId,
            userName: userName,
          ),
        );

  static const String name = 'ChatRoute';
}

class ChatRouteArgs {
  const ChatRouteArgs({
    this.key,
    required this.senderId,
    required this.receiverId,
    required this.userName,
  });

  final _i40.Key? key;

  final String senderId;

  final String receiverId;

  final String userName;

  @override
  String toString() {
    return 'ChatRouteArgs{key: $key, senderId: $senderId, receiverId: $receiverId, userName: $userName}';
  }
}

/// generated route for
/// [_i24.MyProducts]
class MyProductsRoute extends _i39.PageRouteInfo<void> {
  const MyProductsRoute()
      : super(
          MyProductsRoute.name,
          path: '/my-products',
        );

  static const String name = 'MyProductsRoute';
}

/// generated route for
/// [_i25.EditOfferImages]
class EditOfferImagesRoute
    extends _i39.PageRouteInfo<EditOfferImagesRouteArgs> {
  EditOfferImagesRoute({
    _i40.Key? key,
    required _i46.AdsDataModel model,
  }) : super(
          EditOfferImagesRoute.name,
          path: '/edit-offer-images',
          args: EditOfferImagesRouteArgs(
            key: key,
            model: model,
          ),
        );

  static const String name = 'EditOfferImagesRoute';
}

class EditOfferImagesRouteArgs {
  const EditOfferImagesRouteArgs({
    this.key,
    required this.model,
  });

  final _i40.Key? key;

  final _i46.AdsDataModel model;

  @override
  String toString() {
    return 'EditOfferImagesRouteArgs{key: $key, model: $model}';
  }
}

/// generated route for
/// [_i26.EditOfferLocation]
class EditOfferLocationRoute
    extends _i39.PageRouteInfo<EditOfferLocationRouteArgs> {
  EditOfferLocationRoute({
    _i40.Key? key,
    required _i47.UpdateAdModel model,
    required _i46.AdsDataModel adModel,
  }) : super(
          EditOfferLocationRoute.name,
          path: '/edit-offer-location',
          args: EditOfferLocationRouteArgs(
            key: key,
            model: model,
            adModel: adModel,
          ),
        );

  static const String name = 'EditOfferLocationRoute';
}

class EditOfferLocationRouteArgs {
  const EditOfferLocationRouteArgs({
    this.key,
    required this.model,
    required this.adModel,
  });

  final _i40.Key? key;

  final _i47.UpdateAdModel model;

  final _i46.AdsDataModel adModel;

  @override
  String toString() {
    return 'EditOfferLocationRouteArgs{key: $key, model: $model, adModel: $adModel}';
  }
}

/// generated route for
/// [_i27.EditOfferDetails]
class EditOfferDetailsRoute
    extends _i39.PageRouteInfo<EditOfferDetailsRouteArgs> {
  EditOfferDetailsRoute({
    _i40.Key? key,
    required _i47.UpdateAdModel model,
    required _i46.AdsDataModel adModel,
  }) : super(
          EditOfferDetailsRoute.name,
          path: '/edit-offer-details',
          args: EditOfferDetailsRouteArgs(
            key: key,
            model: model,
            adModel: adModel,
          ),
        );

  static const String name = 'EditOfferDetailsRoute';
}

class EditOfferDetailsRouteArgs {
  const EditOfferDetailsRouteArgs({
    this.key,
    required this.model,
    required this.adModel,
  });

  final _i40.Key? key;

  final _i47.UpdateAdModel model;

  final _i46.AdsDataModel adModel;

  @override
  String toString() {
    return 'EditOfferDetailsRouteArgs{key: $key, model: $model, adModel: $adModel}';
  }
}

/// generated route for
/// [_i28.EditOfferSuccess]
class EditOfferSuccessRoute extends _i39.PageRouteInfo<void> {
  const EditOfferSuccessRoute()
      : super(
          EditOfferSuccessRoute.name,
          path: '/edit-offer-success',
        );

  static const String name = 'EditOfferSuccessRoute';
}

/// generated route for
/// [_i29.Followers]
class FollowersRoute extends _i39.PageRouteInfo<void> {
  const FollowersRoute()
      : super(
          FollowersRoute.name,
          path: '/Followers',
        );

  static const String name = 'FollowersRoute';
}

/// generated route for
/// [_i30.AddCarFollower]
class AddCarFollowerRoute extends _i39.PageRouteInfo<AddCarFollowerRouteArgs> {
  AddCarFollowerRoute({_i40.Key? key})
      : super(
          AddCarFollowerRoute.name,
          path: '/add-car-follower',
          args: AddCarFollowerRouteArgs(key: key),
        );

  static const String name = 'AddCarFollowerRoute';
}

class AddCarFollowerRouteArgs {
  const AddCarFollowerRouteArgs({this.key});

  final _i40.Key? key;

  @override
  String toString() {
    return 'AddCarFollowerRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i31.Profile]
class ProfileRoute extends _i39.PageRouteInfo<ProfileRouteArgs> {
  ProfileRoute({
    _i40.Key? key,
    String? name,
  }) : super(
          ProfileRoute.name,
          path: '/Profile',
          args: ProfileRouteArgs(
            key: key,
            name: name,
          ),
        );

  static const String name = 'ProfileRoute';
}

class ProfileRouteArgs {
  const ProfileRouteArgs({
    this.key,
    this.name,
  });

  final _i40.Key? key;

  final String? name;

  @override
  String toString() {
    return 'ProfileRouteArgs{key: $key, name: $name}';
  }
}

/// generated route for
/// [_i32.EditProfile]
class EditProfileRoute extends _i39.PageRouteInfo<EditProfileRouteArgs> {
  EditProfileRoute({
    _i40.Key? key,
    required _i48.UserModel user,
  }) : super(
          EditProfileRoute.name,
          path: '/edit-profile',
          args: EditProfileRouteArgs(
            key: key,
            user: user,
          ),
        );

  static const String name = 'EditProfileRoute';
}

class EditProfileRouteArgs {
  const EditProfileRouteArgs({
    this.key,
    required this.user,
  });

  final _i40.Key? key;

  final _i48.UserModel user;

  @override
  String toString() {
    return 'EditProfileRouteArgs{key: $key, user: $user}';
  }
}

/// generated route for
/// [_i33.ChangePassword]
class ChangePasswordRoute extends _i39.PageRouteInfo<void> {
  const ChangePasswordRoute()
      : super(
          ChangePasswordRoute.name,
          path: '/change-password',
        );

  static const String name = 'ChangePasswordRoute';
}

/// generated route for
/// [_i34.ImageZoom]
class ImageZoomRoute extends _i39.PageRouteInfo<ImageZoomRouteArgs> {
  ImageZoomRoute({
    required List<_i49.ImageModel> images,
    required int index,
    _i40.Key? key,
  }) : super(
          ImageZoomRoute.name,
          path: '/image-zoom',
          args: ImageZoomRouteArgs(
            images: images,
            index: index,
            key: key,
          ),
        );

  static const String name = 'ImageZoomRoute';
}

class ImageZoomRouteArgs {
  const ImageZoomRouteArgs({
    required this.images,
    required this.index,
    this.key,
  });

  final List<_i49.ImageModel> images;

  final int index;

  final _i40.Key? key;

  @override
  String toString() {
    return 'ImageZoomRouteArgs{images: $images, index: $index, key: $key}';
  }
}

/// generated route for
/// [_i35.AdminBanks]
class AdminBanksRoute extends _i39.PageRouteInfo<void> {
  const AdminBanksRoute()
      : super(
          AdminBanksRoute.name,
          path: '/admin-banks',
        );

  static const String name = 'AdminBanksRoute';
}

/// generated route for
/// [_i36.BankPayment]
class BankPaymentRoute extends _i39.PageRouteInfo<void> {
  const BankPaymentRoute()
      : super(
          BankPaymentRoute.name,
          path: '/bank-payment',
        );

  static const String name = 'BankPaymentRoute';
}

/// generated route for
/// [_i37.CallUs]
class CallUsRoute extends _i39.PageRouteInfo<void> {
  const CallUsRoute()
      : super(
          CallUsRoute.name,
          path: '/call-us',
        );

  static const String name = 'CallUsRoute';
}

/// generated route for
/// [_i38.FilterLocation]
class FilterLocationRoute extends _i39.PageRouteInfo<FilterLocationRouteArgs> {
  FilterLocationRoute({
    _i40.Key? key,
    required double lat,
    required double lng,
  }) : super(
          FilterLocationRoute.name,
          path: '/filter-location',
          args: FilterLocationRouteArgs(
            key: key,
            lat: lat,
            lng: lng,
          ),
        );

  static const String name = 'FilterLocationRoute';
}

class FilterLocationRouteArgs {
  const FilterLocationRouteArgs({
    this.key,
    required this.lat,
    required this.lng,
  });

  final _i40.Key? key;

  final double lat;

  final double lng;

  @override
  String toString() {
    return 'FilterLocationRouteArgs{key: $key, lat: $lat, lng: $lng}';
  }
}
