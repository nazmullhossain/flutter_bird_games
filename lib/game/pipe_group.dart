import 'dart:math';

import 'package:flame/components.dart';
import 'package:flame/extensions.dart';
import 'package:flutter/widgets.dart';
import 'package:gameflutter/game/configuratoin.dart';
import 'package:gameflutter/game/flappy_bird_game.dart';
import 'package:gameflutter/game/pipe.dart';
import 'package:gameflutter/game/pipe_postioned.dart';

class PipeGroup extends PositionComponent with HasGameRef<FlappyBirdGame>{
  PipeGroup();
  final _random =Random();
  @override
  Future<void> onLoad()async {

    position.x=gameRef.size.x;
    final heightMinusGroud= gameRef.size.y-Configuratoin.groundHeight;
    final spacing=100+_random.nextDouble() *(heightMinusGroud/4);
    final centerY= spacing +_random.nextDouble() *(heightMinusGroud-spacing);
   addAll([
     Pipe(pipePostioned: PipePostioned.top, height:
     centerY-spacing/2),

     Pipe(pipePostioned: PipePostioned.bottom, height:
     heightMinusGroud-(centerY+spacing/2)),
   ]);
  }
@override
  void update(double dt) {
    // TODO: implement update
    super.update(dt);
    position.x -=Configuratoin.gameSpeed *dt;
    if(position.x <-10){
      removeFromParent();
      debugPrint("remove");
    }
  }
}