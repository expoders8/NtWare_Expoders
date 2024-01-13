import 'package:flutter/material.dart';

class LoadingContainer extends StatefulWidget {
  const LoadingContainer(
      {Key? key, required this.child, required this.isLoading, this.color})
      : super(key: key);

  final Widget child;

  final bool isLoading;

  final Color? color;

  @override
  State<LoadingContainer> createState() => _LoadingContainerState();
}

class _LoadingContainerState extends State<LoadingContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: Stack(
        children: <Widget>[
          widget.child,
          Offstage(
            offstage: !widget.isLoading,
            child: Container(
              color: widget.color ?? Colors.white.withOpacity(0.5),
              child: const Center(child: CircularProgressIndicator()),
            ),
          )
        ],
      ),
    );
  }
}
