import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flame/parallax.dart';
import 'package:gameflutter/component/backgroud_com.dart';
import 'package:gameflutter/game/assets_game.dart';
import 'package:gameflutter/game/configuratoin.dart';
import 'package:gameflutter/game/flappy_bird_game.dart';

class GroundCom extends ParallaxComponent<FlappyBirdGame> with HasGameRef<FlappyBirdGame>{
  GroundCom();
  @override
  Future<void> onLoad()async {
    final ground=await Flame.images.load(AssetsGame.ground);
  parallax=Parallax([
    ParallaxLayer(
      ParallaxImage(
        ground,fill: LayerFill.none
      )
    )
  ]);
  add(RectangleHitbox(
    position: Vector2(0,gameRef.size.y-Configuratoin.groundHeight),
    size: Vector2(gameRef.size.x, Configuratoin.groundHeight)
  ));
  }
  @override
  void update(double dt) {
    // TODO: implement update
    super.update(dt);
    parallax?.baseVelocity.x=Configuratoin.gameSpeed;
  }

}