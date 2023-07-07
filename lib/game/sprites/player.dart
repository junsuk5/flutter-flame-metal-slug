import 'dart:async';

import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:metal_slug/game/metal_slug.dart';

enum PlayerState {
  idleRight,
  idleLeft,
  left,
  right,
  jump,
  attack,
}

class Player extends SpriteAnimationGroupComponent<PlayerState>
    with HasGameRef<MetalSlug>, KeyboardHandler {
  Vector2 _velocity = Vector2.zero();
  final double _gravity = 9;
  bool isJumping = false;

  Player({
    super.position,
  }) : super(
          size: Vector2(50, 50),
          scale: Vector2(2, 2),
          anchor: Anchor.topLeft,
          priority: 1,
        );

  @override
  FutureOr<void> onLoad() async {
    final idleRight = SpriteAnimation.fromFrameData(
      game.images.fromCache('game/player/sprites.png'),
      SpriteAnimationData.sequenced(
        amount: 3,
        stepTime: 0.15,
        textureSize: Vector2(29.48, 40),
      ),
    );

    animations = {
      PlayerState.idleRight: idleRight,
    };

    // sprites = <PlayerState, Sprite>{
    //   PlayerState.right: right,
    // };

    current = PlayerState.idleRight;
  }

  @override
  void update(double dt) {
    if (position.y <= 300) {
      _velocity.y += _gravity;
      position += _velocity * dt;
    }
    super.update(dt);
  }

  @override
  bool onKeyEvent(RawKeyEvent event, Set<LogicalKeyboardKey> keysPressed) {
    if (keysPressed.contains(LogicalKeyboardKey.space)) {
      jump();
      print('jump');
    }
    return true;
  }

  void jump() {
    _velocity.y = -300;
  }
}
