enum CanvasPixelDensity {
  low(pixelDensity: 24),
  medium(pixelDensity: 36),
  high(pixelDensity: 54);

  const CanvasPixelDensity({
    required this.pixelDensity,
  });

  final int pixelDensity;
}
