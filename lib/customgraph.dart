import 'package:flutter/material.dart';

class GraphPainter extends CustomPainter {
  final double minValue;
  final double maxValue;
  final List<double> dataPoints;

  GraphPainter(this.minValue, this.maxValue, this.dataPoints);

  @override
  void paint(Canvas canvas, Size size) {
    final double graphWidth = size.width - 40;
    final double graphHeight = size.height - 40;
    const double startX = 20;
    final double startY = size.height + 30;

    final double xInterval = graphWidth / (dataPoints.length - 1);
    final double yInterval = graphHeight / (maxValue - minValue);

    final Paint axisPaint = Paint()
      ..color = Colors.black
      ..strokeWidth = 1
      ..style = PaintingStyle.stroke;

    final Paint linePaint = Paint()
      ..color = Colors.blue
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    final Paint circlePaint = Paint()
      ..color = Colors.blue
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    final Paint filledCirclePaint = Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.fill;

    final TextPainter textPainter = TextPainter(
      textDirection: TextDirection.ltr,
    );

    const TextStyle textStyle = TextStyle(
      color: Colors.black,
      fontSize: 12,
    );

    // Draw x-axis
    canvas.drawLine(
        Offset(startX, startY), Offset(startX + graphWidth, startY), axisPaint);

    // Draw y-axis
    canvas.drawLine(Offset(startX, startY),
        Offset(startX, startY - graphHeight), axisPaint);

    // Draw x-axis labels
    textPainter.text = const TextSpan(text: 'JAN 27', style: textStyle);
    textPainter.layout();
    textPainter.paint(canvas, Offset(startX, startY + 4));

    textPainter.text = const TextSpan(text: 'APR 25', style: textStyle);
    textPainter.layout();
    textPainter.paint(
        canvas, Offset(startX + graphWidth - textPainter.width, startY + 4));

    // Draw y-axis labels and horizontal lines
    for (int i = 0; i <= 5; i++) {
      final double y = startY - (yInterval * i * 5);
      final double value = minValue + (i * 5);
      final String label = value.toStringAsFixed(0);

      // Draw horizontal line
      canvas.drawLine(
          Offset(startX, y), Offset(startX + graphWidth, y), axisPaint);

      // Draw y-axis label
      textPainter.text = TextSpan(text: label, style: textStyle);
      textPainter.layout();
      textPainter.paint(canvas,
          Offset(startX - textPainter.width - 4, y - textPainter.height / 2));
    }

    final Path graphPath = Path();
    final Path circlePath = Path();

    graphPath.moveTo(startX, startY - ((dataPoints[0] - minValue) * yInterval));
    circlePath.moveTo(
        startX, startY - ((dataPoints[0] - minValue) * yInterval));

    for (int i = 1; i < dataPoints.length; i++) {
      final double x = startX + (xInterval * i);
      final double y = startY - ((dataPoints[i] - minValue) * yInterval);
      graphPath.lineTo(x, y);

      // Draw small outlined circle
      circlePath.addOval(Rect.fromCircle(center: Offset(x, y), radius: 3));
    }

    // Draw small filled circle at the last data point
    final double lastX = startX + (xInterval * (dataPoints.length - 1));
    final double lastY =
        startY - ((dataPoints[dataPoints.length - 1] - minValue) * yInterval);
    circlePath
        .addOval(Rect.fromCircle(center: Offset(lastX, lastY), radius: 3));

    // Draw graph line
    canvas.drawPath(graphPath, linePaint);

    // Draw small outlined circles
    canvas.drawPath(circlePath, circlePaint);

    // Draw small filled circle at the last data point
    canvas.drawCircle(Offset(lastX, lastY), 2, filledCirclePaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
