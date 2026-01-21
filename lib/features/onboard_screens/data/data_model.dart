import 'package:fintech/core/constants/image_string.dart';
import 'package:fintech/core/constants/string_text.dart';
import 'package:fintech/features/onboard_screens/model/model.dart';

final List<OnBoardModel> onBoardData = [
  OnBoardModel(
    title: Texts.onBoardText1,
    subtitle: Texts.onBoardText2,
    image: AppAssets.onBoardImageSvg,
  ),
  OnBoardModel(
    title: Texts.onBoardText3,
    subtitle: Texts.onBoardText4,
    image: AppAssets.onBoardImageSvg,
    isLast: true,
  ),
];
