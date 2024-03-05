import 'package:flame/components.dart';
import 'package:flutter/material.dart';

class InteractionTimerBar extends PositionComponent {
  InteractionTimerBar({
    required this.interactionTime,
    required this.onInteractionComplete,
    super.position,
    super.size,
    super.scale,
    super.angle,
    super.anchor,
    super.children,
    super.priority,
  });
  final int interactionTime;
  final VoidCallback onInteractionComplete;
  Timer? _timer;
  double _progress = 0;

  @override
  void update(double dt) {
    super.update(dt);
    if (_timer != null && _progress < interactionTime.toDouble()) {
      _progress += dt * 1000; // Update progress based on time
      if (_progress >= interactionTime.toDouble()) {
        _progress = interactionTime.toDouble();
        _timer?.stop();
        onInteractionComplete(); // Callback when interaction is complete
      }
    }
  }

  @override
  void render(Canvas canvas) {
    canvas.drawRect(
      Rect.fromLTWH(0, 0, _progress, 20),
      Paint()..color = Colors.blue,
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
          onInteractionComplete();
        }
      },
    );
  }

  void cancelInteraction() {
    _timer?.stop();
    _progress = 0.0;
  }
}
