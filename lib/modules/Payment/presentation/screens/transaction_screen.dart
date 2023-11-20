import 'package:kak/core/utils/enums.dart';
import 'package:sizer/sizer.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

import '../bloc/payment_bloc.dart';
import '../../../../core/global/api_keys.dart';
import '../../../../core/utils/error_dialog.dart';
import '../../../../core/resources/strings_manager.dart';
import '../../../../core/utils/loading_indicator_util.dart';

class TransactionScreen extends StatefulWidget {
  const TransactionScreen({super.key});

  @override
  State<TransactionScreen> createState() => _TransactionScreenState();
}

class _TransactionScreenState extends State<TransactionScreen> {
  late final WebViewController _controller;
  bool isLoading = false;
  int progPer = 0;

  @override
  void initState() {
    super.initState();
    final WebViewController controller = WebViewController();
    controller
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageStarted: (_) {
            if (!isLoading) {
              setState(() {
                isLoading = true;
                LoadingUtils.showLoadingDialog(
                    context, LoadingType.linear, StringsManager.loading);
              });
            }
          },
          onPageFinished: (_) {
            if (isLoading) {
              setState(() {
                isLoading = false;
                Navigator.of(context).pop();
              });
            }
          },
          onWebResourceError: (WebResourceError error) {
            showDialog(
              context: context,
              builder: (BuildContext context) => ErrorDialog(
                errorMessage: error.description,
              ),
            );
          },
        ),
      )
      ..addJavaScriptChannel(
        'Toaster',
        onMessageReceived: (JavaScriptMessage message) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(message.message)),
          );
        },
      )
      ..loadRequest(Uri.parse(
          '${ConstantKeys.paymobIframe}${context.read<PaymentBloc>().state.payWithCardToken}'));

    _controller = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
          height: 100.h,
          width: 100.w,
          child: WebViewWidget(controller: _controller)),
    );
  }
}
