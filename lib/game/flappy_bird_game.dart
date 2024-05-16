import 'dart:async';

import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:gameflutter/component/backgroud_com.dart';
import 'package:gameflutter/component/bird_com.dart';
import 'package:flame/components.dart';

import 'package:gameflutter/game/configuratoin.dart';

import 'package:gameflutter/game/pipe_group.dart';

import '../component/ground_com.dart';

class FlappyBirdGame extends FlameGame with TapDetector, HasCollisionDetection{
  late BirdCom birdCom;
  Timer timerInterval = Timer(Configuratoin.pipeInterval, repeat: true);
  @override
  Future<void> onLoad() async {
    addAll([BackgroudCom(), GroundCom(), birdCom = BirdCom(),
      ]);
    timerInterval.onTick=()=>add(PipeGroup());
  }
@override
  void onTap() {
    // TODO: implement onTap
    super.onTap();
    birdCom.fly();
  }
  @override
  void updateTree(double dt) {
    // TODO: implement updateTree
    super.updateTree(dt);
    timerInterval.update(dt);
  }

}
