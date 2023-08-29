// ignore_for_file: file_names

part of 'RouterImports.dart';


@MaterialAutoRouter(
  routes: <AutoRoute>[
    //general routes
    MaterialRoute(page: Splash, initial: true,),
    CustomRoute(page: Login, transitionsBuilder: TransitionsBuilders.slideRightWithFade),
    CustomRoute(page: Register, transitionsBuilder: TransitionsBuilders.slideRightWithFade),
    CustomRoute(page: RegisterComplete, transitionsBuilder: TransitionsBuilders.slideRightWithFade),
    CustomRoute(page: ForgetPassword, transitionsBuilder: TransitionsBuilders.slideRightWithFade),
    CustomRoute(page: ActiveAccount, transitionsBuilder: TransitionsBuilders.slideRightWithFade),
    CustomRoute(page: ResetPassword, transitionsBuilder: TransitionsBuilders.slideRightWithFade),
    CustomRoute(page: RemotePage, transitionsBuilder: TransitionsBuilders.slideRightWithFade),
    CustomRoute(page: Terms, transitionsBuilder: TransitionsBuilders.slideRightWithFade),
    CustomRoute(page: ContactUs, transitionsBuilder: TransitionsBuilders.slideRightWithFade),

    //customer routes
    CustomRoute(page: Home, transitionsBuilder: TransitionsBuilders.slideRightWithFade),
    CustomRoute(page: AddOffers, transitionsBuilder: TransitionsBuilders.slideRightWithFade),
    CustomRoute(page: OfferSwearing, transitionsBuilder: TransitionsBuilders.slideRightWithFade),
    CustomRoute(page: AddOfferLocation, transitionsBuilder: TransitionsBuilders.slideRightWithFade),
    CustomRoute(page: LocationAddress, transitionsBuilder: TransitionsBuilders.slideRightWithFade),
    CustomRoute(page: AddOfferDetails, transitionsBuilder: TransitionsBuilders.slideRightWithFade),
    CustomRoute(page: AddOfferImages, transitionsBuilder: TransitionsBuilders.slideRightWithFade),
    CustomRoute(page: AddOfferSuccess, transitionsBuilder: TransitionsBuilders.slideRightWithFade),
    CustomRoute(page: ProductDetails, transitionsBuilder: TransitionsBuilders.slideRightWithFade),
    CustomRoute(page: ProductComments, transitionsBuilder: TransitionsBuilders.slideRightWithFade),
    CustomRoute(page: UserProducts, transitionsBuilder: TransitionsBuilders.slideRightWithFade),
    CustomRoute(page: UserComments, transitionsBuilder: TransitionsBuilders.slideRightWithFade),
    CustomRoute(page: Chat, transitionsBuilder: TransitionsBuilders.slideRightWithFade),
    CustomRoute(page: MyProducts, transitionsBuilder: TransitionsBuilders.slideRightWithFade),
    CustomRoute(page: EditOfferImages, transitionsBuilder: TransitionsBuilders.slideRightWithFade),
    CustomRoute(page: EditOfferLocation, transitionsBuilder: TransitionsBuilders.slideRightWithFade),
    CustomRoute(page: EditOfferDetails, transitionsBuilder: TransitionsBuilders.slideRightWithFade),
    CustomRoute(page: EditOfferSuccess, transitionsBuilder: TransitionsBuilders.slideRightWithFade),
    CustomRoute(page: Followers, transitionsBuilder: TransitionsBuilders.slideRightWithFade),
    CustomRoute(page: AddCarFollower, transitionsBuilder: TransitionsBuilders.slideRightWithFade),
    CustomRoute(page: Profile, transitionsBuilder: TransitionsBuilders.slideRightWithFade),
    CustomRoute(page: EditProfile, transitionsBuilder: TransitionsBuilders.slideRightWithFade),
    CustomRoute(page: ChangePassword, transitionsBuilder: TransitionsBuilders.slideRightWithFade),
    CustomRoute(page: ImageZoom, transitionsBuilder: TransitionsBuilders.slideRightWithFade),
    CustomRoute(page: AdminBanks, transitionsBuilder: TransitionsBuilders.slideRightWithFade),
    CustomRoute(page: BankPayment, transitionsBuilder: TransitionsBuilders.slideRightWithFade),
    CustomRoute(page: CallUs, transitionsBuilder: TransitionsBuilders.slideRightWithFade),
    CustomRoute(page: FilterLocation, transitionsBuilder: TransitionsBuilders.slideRightWithFade),


  ],
)
class $AppRouter {}