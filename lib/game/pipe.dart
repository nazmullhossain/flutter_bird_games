import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:gameflutter/game/assets_game.dart';
import 'package:gameflutter/game/configuratoin.dart';
import 'package:gameflutter/game/flappy_bird_game.dart';
import 'package:gameflutter/game/pipe_postioned.dart';

class Pipe extends SpriteComponent with HasGameRef<FlappyBirdGame>{
  Pipe({
    required this.pipePostioned,
    required this.height
});
  final double height;
  final PipePostioned pipePostioned;
  
  
  @override
  Future<void> onLoad()async {
  final pipe= await Flame.images.load(AssetsGame.pipe);
  final pipeRotated=await Flame.images.load(AssetsGame.pipeRotated);
  size=Vector2(50, height);
  switch(pipePostioned){
    case PipePostioned.top:
      position.y=0;
      sprite=Sprite(pipeRotated);
      break;
    case PipePostioned.bottom:
      position.y=gameRef.size.y -size.y-Configuratoin.groundHeight;
      sprite=Sprite(pipe);
      break;
  }
  add(RectangleHitbox());
  
  }


}