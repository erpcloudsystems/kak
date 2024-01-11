import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

import '../../bloc/user_profile_bloc.dart';
import '../../../../../core/network/api_constance.dart';
import '../../../../../core/resources/values_manager.dart';

class UserPhotoWidget extends StatelessWidget {
  const UserPhotoWidget({
    super.key,
    this.sideWidget,
    this.radius,
    this.image,
    this.child,
  });

  final Widget? sideWidget;
  final double? radius;
  final ImageProvider? image;
  final Widget? child;
  @override
  Widget build(BuildContext context) {
    final bloc = context.watch<UserProfileBloc>();
    final currentUser = bloc.state.getUserProfileData;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        CircleAvatar(
          radius: radius ?? DoubleManager.d_40,
          backgroundImage: image ??
              (currentUser.image != null
                  ? NetworkImage('${ApiConstance.kakUrl}${currentUser.image}')
                  : null),
          child: child,
        ),
        if (sideWidget != null) (sideWidget!),
      ],
    );
  }
}
