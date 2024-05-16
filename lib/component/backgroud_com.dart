import 'package:flame/components.dart';

import 'package:flame/flame.dart';
import 'package:gameflutter/game/assets_game.dart';
import 'package:gameflutter/game/flappy_bird_game.dart';

class BackgroudCom extends SpriteComponent with HasGameRef<FlappyBirdGame>{
  BackgroudCom();


  @override
  Future<void> onLoad() async{
  final backgroud=await Flame.images.load(AssetsGame.backgroud);
  size=gameRef.size;
  sprite=Sprite(backgroud);
  }
}

