import 'package:easy_localization/easy_localization.dart';
import 'package:ushop/blocs/blocs.dart';
import 'package:connectivity_wrapper/connectivity_wrapper.dart';
import 'package:ushop/data/data.dart';
import 'package:ushop/presentation/global_widgets/global_widgets.dart';
import 'package:ushop/presentation/pages/login/views/login_page.dart';
import 'package:ushop/presentation/pages/splash/view/splash_page.dart';
import "package:flutter/material.dart";
import 'package:ushop/utils/utils.dart';

class App extends StatelessWidget {
  const App({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => NangApi(),
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => SettingsBloc()),
          BlocProvider(create: (context) => AppBottomNavigationBarBloc()),
          BlocProvider(create: (context) => AuthenticationBloc()),
          BlocProvider(create: (context) => UserImageBloc()),
          BlocProvider(create: (context) => CartBloc()),
          BlocProvider(create: (context) => WishListBloc()),
          BlocProvider(create: (context) => LoginBloc()),
        ],
        child: const AppView(),
      ),
    );
  }
}

class AppView extends StatefulWidget {
  const AppView({Key? key}) : super(key: key);

  @override
  _AppViewState createState() => _AppViewState();
}

class _AppViewState extends State<AppView> {
  final _navigatorKey = GlobalKey<NavigatorState>();

  NavigatorState get _navigator => _navigatorKey.currentState!;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return ConnectivityAppWrapper(
          app: BlocBuilder<SettingsBloc, SettingsState>(
            buildWhen: (previous, current) {
              setState(() {});
              return true;
            },
            builder: (context, state) {
              return MaterialApp(
                locale: state.locale,
                supportedLocales: context.supportedLocales,
                localizationsDelegates: context.localizationDelegates,
                debugShowCheckedModeBanner: false,
                navigatorKey: _navigatorKey,
                theme: appTheme(context),
                builder: (context, child) {
                  return InternetConnectivityWidgetWrapper(
                    child: GlobalScaffold(
                      child:
                          BlocListener<AuthenticationBloc, AuthenticationState>(
                        listener: (context, state) {
                          Future.delayed(const Duration(seconds: 1), () {
                            _navigator.pushAndRemoveUntil<void>(
                              LoginPage.route(),
                              (route) => false,
                            );
                          });
                        },
                        child: child,
                      ),
                    ),
                  );
                },
                onGenerateRoute: (_) {
                  final state = context.read<AuthenticationBloc>().state;
                  context
                      .read<AuthenticationBloc>()
                      .add(AuthenticationChecker(check: !(state.checker)));
                  return SplashPage.route();
                },
              );
            },
          ),
        );
      },
    );
  }
}
