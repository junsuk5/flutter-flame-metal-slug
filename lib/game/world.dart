import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame/parallax.dart';
import 'package:flutter/material.dart';
import 'package:metal_slug/game/metal_slug.dart';

class World extends ParallaxComponent<MetalSlug> {
  @override
  FutureOr<void> onLoad() async {
    parallax = await gameRef.loadParallax(
      [
        ParallaxImageData('game/background/bg01.png'),
      ],
      fill: LayerFill.height,
      repeat: ImageRepeat.noRepeat,
    );
  }
}
