enum CanvasPixelDensity {
  low(pixelDensity: 24),
  medium(pixelDensity: 36),
  high(pixelDensity: 48);

  const CanvasPixelDensity({
    required this.pixelDensity,
  });

  final int pixelDensity;
}
