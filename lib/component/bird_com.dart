import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:gameflutter/component/bird_movement.dart';
import 'package:gameflutter/game/assets_game.dart';
import 'package:gameflutter/game/configuratoin.dart';
import 'package:gameflutter/game/flappy_bird_game.dart';

class BirdCom extends SpriteGroupComponent<BirdMovement>
    with HasGameRef<FlappyBirdGame>, CollisionCallbacks {
  BirdCom();

  @override
  Future<void> onLoad() async {
    final birdMidFlap = await gameRef.loadSprite(AssetsGame.birdMidFlap);
    final birdUPFlap = await gameRef.loadSprite(AssetsGame.birdUPFlap);
    final birdDownFlap = await gameRef.loadSprite(AssetsGame.birdDownFlap);

    size = Vector2(50, 40);
    position = Vector2(50, gameRef.size.y / 2 - size.y / 2);
    current = BirdMovement.middle;

    sprites = {
      BirdMovement.middle: birdMidFlap,
      BirdMovement.down: birdDownFlap,
      BirdMovement.up: birdUPFlap
    };
    add(CircleHitbox());
  }

  void fly() {
    add(MoveByEffect(Vector2(0, Configuratoin.gravity),
        EffectController(duration: 0.2, curve: Curves.decelerate),
        onComplete: () => current = BirdMovement.down));
    current = BirdMovement.up;
  }

  @override
  void onCollisionStart(
      Set<Vector2> intersectionPoints, PositionComponent other) {
    // TODO: implement onCollisionStart
    super.onCollisionStart(intersectionPoints, other);
    debugPrint("collision detected");
    gameOver();
  }
void gameOver(){
    gameRef.pauseEngine();
}
  @override
  void update(double dt) {
    // TODO: implement update
    super.update(dt);
    position.y += Configuratoin.birdVelocity * dt;
  }
}
