import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stacked/stacked.dart';

class ReactiveScaffold<T extends BaseViewModel> extends StatelessWidget {
  final Key? scaffoldKey;
  final AppBar? appBar;
  final Drawer? drawer;
  final Drawer? endDrawer;
  final BottomNavigationBar? bottomNavigationBar;
  final BottomSheet? bottomSheet;
  final FloatingActionButton? floatingActionButton;
  final Widget Function(
    BuildContext context,
    T viewModel,
    Widget? child,
  ) body;
  final T Function()? viewModelBuilder;

  const ReactiveScaffold({
    Key? key,
    this.appBar,
    this.drawer,
    this.bottomNavigationBar,
    this.bottomSheet,
    this.floatingActionButton,
    required this.body,
    this.viewModelBuilder,
    this.scaffoldKey,
    this.endDrawer,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: appBar,
      drawer: drawer,
      endDrawer: endDrawer,
      bottomNavigationBar: bottomNavigationBar,
      bottomSheet: bottomSheet,
      floatingActionButton: floatingActionButton,
      body: Column(
        children: [
          Expanded(
            child: Builder(
              builder: (context) {
                if (viewModelBuilder != null) {
                  return _ReactiveViewModelBuilderScaffoldBody<T>(
                    viewModelBuilder!,
                    body: body,
                  );
                } else {
                  return ReactiveViewModelListenerScaffoldBody<T>(
                    body: body,
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _ReactiveViewModelBuilderScaffoldBody<T extends BaseViewModel>
    extends ViewModelBuilderWidget<T> {
  final Widget Function(
    BuildContext context,
    T viewModel,
    Widget? child,
  ) body;
  final T Function() _viewModelBuilder;

  const _ReactiveViewModelBuilderScaffoldBody(
    this._viewModelBuilder, {
    Key? key,
    required this.body,
  }) : super(key: key);

  @override
  Widget builder(BuildContext context, T viewModel, Widget? child) {
    if (viewModel.hasError) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.error_outline),
            SizedBox(height: 12),
            Text(viewModel.modelError.toString()),
          ],
        ),
      );
    } else {
      return Stack(
        children: [
          body(
            context,
            viewModel,
            child,
          ),
          if (viewModel.isBusy)
            Column(
              children: [
                Expanded(
                  child: Container(
                    color: Colors.black.withOpacity(.1),
                    alignment: Alignment.center,
                    child: Container(
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const CupertinoActivityIndicator(
                        radius: 12,
                      ),
                    ),
                  ),
                ),
              ],
            ),
        ],
      );
    }
  }

  @override
  T viewModelBuilder(BuildContext context) => _viewModelBuilder();
}

class ReactiveViewModelListenerScaffoldBody<T extends BaseViewModel>
    extends StatelessWidget {
  final Widget Function(
    BuildContext context,
    T viewModel,
    Widget? child,
  ) body;

  const ReactiveViewModelListenerScaffoldBody({
    Key? key,
    required this.body,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<T>();
    if (viewModel.hasError) {
      return Center(
        child: Column(
          children: [
            Icon(Icons.error_outline),
            SizedBox(height: 12),
            Text(viewModel.modelError.toString()),
          ],
        ),
      );
    } else {
      return Stack(
        children: [
          body(context, viewModel, null),
          if (viewModel.isBusy)
            Container(
              color: Colors.black.withOpacity(.1),
              alignment: Alignment.center,
              child: Container(
                height: 48,
                width: 48,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const CupertinoActivityIndicator(
                  radius: 16,
                ),
              ),
            ),
        ],
      );
    }
  }
}
