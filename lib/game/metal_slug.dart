import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:metal_slug/game/sprites/player.dart';

class MetalSlug extends FlameGame with HasKeyboardHandlerComponents {
  final _world = World();

  late Player player;
  late final CameraComponent cameraComponent;

  @override
  FutureOr<void> onLoad() async {
    await images.loadAll([
      'game/player/sprites.png',
    ]);

    await add(_world);

    // cameraComponent = CameraComponent(world: _world);
    // cameraComponent.viewfinder.anchor = Anchor.bottomLeft;

    player = Player(position: Vector2(100, 0));

    await addAll([player]);
  }
}
