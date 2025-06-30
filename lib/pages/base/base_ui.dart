import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../locator.dart';
import '../../utils/constants.dart';
import '../../utils/pallet.dart';
import '../../utils/widget_extensions.dart';
import 'base.vm.dart';



// the base view controls all the states of all the UIs
class BaseView<T extends BaseViewModel> extends StatefulWidget {
  final bool notDefaultLoading;
  final Widget Function(BuildContext context, T model,  Widget? child)? builder;
  final Function(T)? onModelReady;
  final Function(T)? onModelDispose;
  final Color color;
  const BaseView({super.key, this.builder, this.onModelReady, this.color = AppColor.white, this.onModelDispose,this.notDefaultLoading=false});

  @override
  _BaseViewState<T> createState() => _BaseViewState<T>();
}

class _BaseViewState<T extends BaseViewModel> extends State<BaseView<T>> {
  T model = getIt<T>();

  @override
  void initState() {
    super.initState();
    if (widget.onModelReady != null) {
      widget.onModelReady!(model);
    }
  }

  @override
  void dispose() {
    super.dispose();
    if (widget.onModelDispose != null) {
      widget.onModelDispose!(model);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<T>(
        create: (_) => model,
        child: Consumer<T>(
          builder: (_,model, __) => Stack(
            children: [
              widget.builder!.call(context, model, __),
              widget.notDefaultLoading? 0.0.sbH :model.isLoading?
              Stack(children: [
                ModalBarrier(color: Colors.black12.withOpacity(.5),
                  dismissible:false,
                ),
                Center(
                    child: customProgressIndicator())
              ])
                  : const SizedBox(),
              // ShimmerUser()
            ],
          ),
        )
    );
  }
}
