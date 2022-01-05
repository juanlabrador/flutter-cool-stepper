import 'package:cool_stepper/cool_stepper.dart';
import 'package:flutter/material.dart';

class CoolStepperView extends StatelessWidget {
  final CoolStep step;
  final VoidCallback? onStepNext;
  final VoidCallback? onStepBack;
  final CoolStepperConfig? config;

  const CoolStepperView({
    Key? key,
    required this.step,
    this.onStepNext,
    this.onStepBack,
    required this.config,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final title = config!.isHeaderEnabled && step.isHeaderEnabled
        ? Container(
            width: double.maxFinite,
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: config!.headerColor ??
                  Theme.of(context).primaryColor.withOpacity(0.1),
            ),
            child: NotificationListener<OverscrollIndicatorNotification>(
              onNotification: (overscroll) {
                overscroll.disallowIndicator();
                return true;
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: double.maxFinite,
                    child: Text(
                      step.title,
                      style: config!.titleTextStyle ??
                          TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black38,
                          ),
                      maxLines: 2,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    step.subtitle,
                    style: config!.subtitleTextStyle ??
                        TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                  ),
                ],
              ),
            ))
        : SizedBox();

    final content = Expanded(
      child: SingleChildScrollView(
        padding: EdgeInsets.only(top: 10, bottom: 10),
        child: step.content,
      ),
    );

    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [title, content],
      ),
    );
  }
}
