// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../ui/view/home/home_view.dart';
import '../ui/view/home/plant_entry/plant_edit_view.dart';
import '../ui/view/login/create_account/create_account_view.dart';
import '../ui/view/login/login_view.dart';
import '../ui/view/startup/startup_view.dart';

class Routes {
  static const String startupView = '/';
  static const String homeView = '/home-view';
  static const String createAccountView = '/create-account-view';
  static const String loginView = '/login-view';
  static const String plantEditView = '/plant-edit-view';
  static const all = <String>{
    startupView,
    homeView,
    createAccountView,
    loginView,
    plantEditView,
  };
}

class Router extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.startupView, page: StartupView),
    RouteDef(Routes.homeView, page: HomeView),
    RouteDef(Routes.createAccountView, page: CreateAccountView),
    RouteDef(Routes.loginView, page: LoginView),
    RouteDef(Routes.plantEditView, page: PlantEditView),
  ];
  @override
  Map<Type, AutoRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, AutoRouteFactory>{
    StartupView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => StartupView(),
        settings: data,
      );
    },
    HomeView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => HomeView(),
        settings: data,
      );
    },
    CreateAccountView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => CreateAccountView(),
        settings: data,
      );
    },
    LoginView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => LoginView(),
        settings: data,
      );
    },
    PlantEditView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => PlantEditView(),
        settings: data,
      );
    },
  };
}
