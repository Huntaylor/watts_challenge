import 'package:environment_hackaton/game/watts_challenge.dart';
import 'package:flame/components.dart';
import 'package:flutter/material.dart';

class InteractionTimerBar extends PositionComponent
    with HasGameRef<WattsChallenge> {
  InteractionTimerBar({
    required this.interactionTime,
    this.onInteractionComplete,
    super.position,
    super.scale,
    super.angle,
    super.anchor,
    super.children,
    super.priority,
  }) : super(
          size: Vector2(66, 20),
        );
  int interactionTime;
  final VoidCallback? onInteractionComplete;
  Timer? _timer;
  double _progress = 0;
  double accumulatedTime = 0;
  double fixedDeltaTime = 1 / 60;

  @override
  void update(double dt) {
    super.update(dt);
    accumulatedTime += dt;
    while (accumulatedTime >= fixedDeltaTime) {
      if (_timer != null && _progress < interactionTime.toDouble()) {
        _progress += fixedDeltaTime *
            (interactionTime / 2); // Update progress based on time
        if (_progress >= interactionTime.toDouble()) {
          _progress = interactionTime.toDouble();
          _timer?.stop();
          if (onInteractionComplete != null) {
            onInteractionComplete?.call();
          }
        }
      }
      accumulatedTime -= fixedDeltaTime;
    }
  }

  @override
  void render(Canvas canvas) {
    // Draw border rectangle
    canvas.drawRect(
      Rect.fromLTWH(0, 0, size.x, size.y),
      Paint()..color = Colors.grey, // Example border color (you can change it)
    );

    // Calculate the ratio of progress to total interaction time
    final progressRatio = _progress / interactionTime.toDouble();

    // Draw filled progress bar up to the calculated ratio
    canvas.drawRect(
      Rect.fromLTWH(
        0,
        0,
        size.x * progressRatio,
        size.y,
      ), // Use size.x * progressRatio
      Paint()..color = Colors.yellowAccent,
    );

    super.render(canvas);
  }

  void startInteraction() {
    _progress = 0.0;
    final interactionDuration = interactionTime.toDouble();
    _timer = Timer(
      interactionDuration,
      onTick: () {
        if (_progress >= interactionDuration) {
          _progress = interactionDuration;
          _timer?.stop();
          onInteractionComplete?.call();
        }
      },
    );
  }

  void cancelInteraction() {
    _timer?.stop();
    _progress = 0.0;
  }
}
