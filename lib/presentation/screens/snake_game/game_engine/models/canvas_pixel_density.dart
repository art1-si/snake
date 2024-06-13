/// Enum to represent the pixel density of the canvas.
/// Low means low resolution, medium means medium resolution,
/// and high means high resolution.
enum CanvasPixelDensity {
  low(pixelDensity: 24),
  medium(pixelDensity: 36),
  high(pixelDensity: 54);

  const CanvasPixelDensity({
    required this.pixelDensity,
  });

  final int pixelDensity;
}
