import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:care_app/core/locator.dart';
import 'package:care_app/core/src/provider/base_provider.dart';

class BasePage<T extends BaseProvider> extends StatefulWidget {
  const BasePage({this.builder, this.onModelReady});

  final Widget Function(BuildContext context, T model, Widget child) builder;
  final Function(T) onModelReady;

  @override
  _BasePageState<T> createState() => _BasePageState<T>();
}

class _BasePageState<T extends BaseProvider> extends State<BasePage<T>> {
  T model = locator<T>();

  @override
  void initState() {
    if (widget.onModelReady != null) {
      widget.onModelReady(model);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<T>(
      create: (BuildContext context) => model,
      child: Consumer<T>(builder: widget.builder),
    );
  }
}
