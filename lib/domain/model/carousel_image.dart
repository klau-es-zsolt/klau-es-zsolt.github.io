import 'package:freezed_annotation/freezed_annotation.dart';

part 'carousel_image.freezed.dart';

@freezed
class CarouselImage with _$CarouselImage {
  const factory CarouselImage({
    required String file,
  }) = _CarouselImage;
}
