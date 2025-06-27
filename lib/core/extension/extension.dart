import 'package:flutter/material.dart';
import 'package:soand/core/config/app_constants.dart';
import 'package:soand/core/config/colors.dart';
import 'package:soand/core/config/fonts.dart';
import 'package:soand/core/config/icons.dart';
import 'package:soand/core/config/images.dart';
import 'package:soand/core/config/theme.dart';
import 'package:soand/core/routing/route_nemas/route_names.dart';

extension BuildContextGeneral on BuildContext {
  AppColors get colors {
    return AppColors();
  }

  AppTheme get theme {
    return AppTheme();
  }

  AppFonts get style {
    return theme.darkTheme().extension<AppFonts>()!;
  }

  AppIcons get icon {
    return AppIcons();
  }

  AppImages get image {
    return AppImages();
  }

  AppRouteName get route {
    return AppRouteName();
  }

  AppSharedKeys get sharedKey {
    return AppSharedKeys();
  }
}
