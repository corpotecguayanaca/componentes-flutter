import 'package:componentes_flutter/src/pages/alert_page.dart';
import 'package:componentes_flutter/src/pages/animated_container_page.dart';
import 'package:componentes_flutter/src/pages/avatar_page.dart';
import 'package:componentes_flutter/src/pages/cards_page.dart';
import 'package:componentes_flutter/src/pages/home_page.dart';
import 'package:componentes_flutter/src/pages/inputs_page.dart';
import 'package:componentes_flutter/src/pages/listview_page.dart';
import 'package:componentes_flutter/src/pages/slider_page.dart';
import 'package:flutter/material.dart';

Map<String, WidgetBuilder> getApplicationRoutes() {
  return <String, WidgetBuilder>{
    '/': (context) => HomePage(),
    'alert':(context) => AlertPage(),
    'avatar': (context) => AvatarPage(),
    'card': (context) => CardPage(),
    'animatedContainer': (context) => AnimatedContainerPage(),
    'inputs': (context) => InputsPage(),
    'slider': (context) => SliderPage(),
    'list':(context) => ListPage(),
  };
}

