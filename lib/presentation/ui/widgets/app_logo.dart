import 'package:flutter/cupertino.dart';

import '../utility/asses_path.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({ super.key, this.width, this.height });

  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Image.asset(AssetsPath.logo, width: 120,height: height,);
  }
}