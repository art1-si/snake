enum CanvasPixelDensity {
  low(pixelDensity: 12),
  medium(pixelDensity: 36),
  high(pixelDensity: 48);

  const CanvasPixelDensity({
    required this.pixelDensity,
  });

  final int pixelDensity;
}
