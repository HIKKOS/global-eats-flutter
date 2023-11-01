import 'dart:ui' as ui;

import 'package:flutter/material.dart';

//Copy this CustomPainter code to the Bottom of the File
class Logo extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(size.width * 0.7776152, size.height * 0.1239558);
    path_0.lineTo(size.width * 0.8355870, size.height * 0.1690977);
    path_0.cubicTo(
        size.width * 0.8979543,
        size.height * 0.2176629,
        size.width * 0.9291370,
        size.height * 0.2419455,
        size.width * 0.9464543,
        size.height * 0.2855803);
    path_0.cubicTo(
        size.width * 0.9637696,
        size.height * 0.3292161,
        size.width * 0.9637696,
        size.height * 0.3835129,
        size.width * 0.9637696,
        size.height * 0.4921065);
    path_0.lineTo(size.width * 0.9637696, size.height * 0.4971387);
    path_0.cubicTo(
        size.width * 0.9637696,
        size.height * 0.6057323,
        size.width * 0.9637696,
        size.height * 0.6600355,
        size.width * 0.9464543,
        size.height * 0.7036677);
    path_0.cubicTo(
        size.width * 0.9291370,
        size.height * 0.7473032,
        size.width * 0.8979543,
        size.height * 0.7715839,
        size.width * 0.8355870,
        size.height * 0.8201516);
    path_0.lineTo(size.width * 0.7776152, size.height * 0.8652903);
    path_0.cubicTo(
        size.width * 0.7267283,
        size.height * 0.9049161,
        size.width * 0.7012848,
        size.height * 0.9247323,
        size.width * 0.6739152,
        size.height * 0.9247323);
    path_0.cubicTo(
        size.width * 0.6465435,
        size.height * 0.9247323,
        size.width * 0.6211000,
        size.height * 0.9049161,
        size.width * 0.5702130,
        size.height * 0.8652903);
    path_0.lineTo(size.width * 0.5122413, size.height * 0.8201516);
    path_0.cubicTo(
        size.width * 0.4498761,
        size.height * 0.7715839,
        size.width * 0.4186913,
        size.height * 0.7473032,
        size.width * 0.4013761,
        size.height * 0.7036677);
    path_0.cubicTo(
        size.width * 0.3840587,
        size.height * 0.6600355,
        size.width * 0.3840587,
        size.height * 0.6057323,
        size.width * 0.3840587,
        size.height * 0.4971387);
    path_0.lineTo(size.width * 0.3840587, size.height * 0.4921065);
    path_0.cubicTo(
        size.width * 0.3840587,
        size.height * 0.3835129,
        size.width * 0.3840587,
        size.height * 0.3292161,
        size.width * 0.4013761,
        size.height * 0.2855803);
    path_0.cubicTo(
        size.width * 0.4186913,
        size.height * 0.2419455,
        size.width * 0.4498761,
        size.height * 0.2176629,
        size.width * 0.5122413,
        size.height * 0.1690977);
    path_0.lineTo(size.width * 0.5702130, size.height * 0.1239558);
    path_0.cubicTo(
        size.width * 0.6211000,
        size.height * 0.08432935,
        size.width * 0.6465435,
        size.height * 0.06451613,
        size.width * 0.6739152,
        size.height * 0.06451613);
    path_0.cubicTo(
        size.width * 0.7012848,
        size.height * 0.06451613,
        size.width * 0.7267283,
        size.height * 0.08432935,
        size.width * 0.7776152,
        size.height * 0.1239558);
    path_0.close();

    Paint paint0Stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.06521739;
    paint0Stroke.color = const Color(0xff4BB6B7).withOpacity(1.0);
    paint0Stroke.strokeCap = StrokeCap.round;
    canvas.drawPath(path_0, paint0Stroke);

    Paint paint0Fill = Paint()..style = PaintingStyle.fill;
    paint0Fill.color = const Color(0xff31989B).withOpacity(1.0);
    canvas.drawPath(path_0, paint0Fill);

    Path path_1 = Path();
    path_1.moveTo(size.width * 0.9347826, size.height * 0.3010765);
    path_1.lineTo(size.width * 0.8188413, size.height * 0.3870968);
    path_1.close();
    path_1.moveTo(size.width * 0.6739130, size.height * 0.4946258);
    path_1.lineTo(size.width * 0.4130435, size.height * 0.3010765);
    path_1.close();
    path_1.moveTo(size.width * 0.6739130, size.height * 0.4946258);
    path_1.lineTo(size.width * 0.6739130, size.height * 0.9032258);
    path_1.close();
    path_1.moveTo(size.width * 0.6739130, size.height * 0.4946258);
    path_1.cubicTo(
        size.width * 0.6739130,
        size.height * 0.4946258,
        size.width * 0.7534087,
        size.height * 0.4356452,
        size.width * 0.8043478,
        size.height * 0.3978516);
    path_1.cubicTo(
        size.width * 0.8100087,
        size.height * 0.3936516,
        size.width * 0.8188413,
        size.height * 0.3870968,
        size.width * 0.8188413,
        size.height * 0.3870968);
    path_1.moveTo(size.width * 0.8188413, size.height * 0.3870968);
    path_1.lineTo(size.width * 0.8188413, size.height * 0.5376355);
    path_1.close();
    path_1.moveTo(size.width * 0.8188413, size.height * 0.3870968);
    path_1.lineTo(size.width * 0.5434783, size.height * 0.1720442);
    path_1.close();

    Paint paint_1_fill = Paint()..style = PaintingStyle.fill;
    paint_1_fill.color = Color(0xff4BB6B7).withOpacity(1.0);
    canvas.drawPath(path_1, paint_1_fill);

    Path path_2 = Path();
    path_2.moveTo(size.width * 0.9347826, size.height * 0.3010765);
    path_2.lineTo(size.width * 0.8188413, size.height * 0.3870968);
    path_2.moveTo(size.width * 0.8188413, size.height * 0.3870968);
    path_2.cubicTo(
        size.width * 0.8188413,
        size.height * 0.3870968,
        size.width * 0.8100087,
        size.height * 0.3936516,
        size.width * 0.8043478,
        size.height * 0.3978516);
    path_2.cubicTo(
        size.width * 0.7534087,
        size.height * 0.4356452,
        size.width * 0.6739130,
        size.height * 0.4946258,
        size.width * 0.6739130,
        size.height * 0.4946258);
    path_2.moveTo(size.width * 0.8188413, size.height * 0.3870968);
    path_2.lineTo(size.width * 0.8188413, size.height * 0.5376355);
    path_2.moveTo(size.width * 0.8188413, size.height * 0.3870968);
    path_2.lineTo(size.width * 0.5434783, size.height * 0.1720442);
    path_2.moveTo(size.width * 0.6739130, size.height * 0.4946258);
    path_2.lineTo(size.width * 0.4130435, size.height * 0.3010765);
    path_2.moveTo(size.width * 0.6739130, size.height * 0.4946258);
    path_2.lineTo(size.width * 0.6739130, size.height * 0.9032258);

    Paint paint_2_stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.06521739;
    paint_2_stroke.color = Color(0xff4BB6B7).withOpacity(1.0);
    paint_2_stroke.strokeCap = StrokeCap.round;
    canvas.drawPath(path_2, paint_2_stroke);

    Paint paint_2_fill = Paint()..style = PaintingStyle.fill;
    paint_2_fill.color = Color(0xff000000).withOpacity(1.0);
    canvas.drawPath(path_2, paint_2_fill);

    Path path_3 = Path();
    path_3.moveTo(size.width * 0.3478261, size.height * 0.3655935);
    path_3.lineTo(size.width * 0.08695652, size.height * 0.3655935);

    Paint paint3Stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.04347826;
    paint3Stroke.color = Color(0xff4BB6B7).withOpacity(1.0);
    paint3Stroke.strokeCap = StrokeCap.round;
    canvas.drawPath(path_3, paint3Stroke);

    Paint paint3Fill = Paint()..style = PaintingStyle.fill;
    paint3Fill.color = Color(0xff000000).withOpacity(1.0);
    canvas.drawPath(path_3, paint3Fill);

    Path path_4 = Path();
    path_4.moveTo(size.width * 0.3478261, size.height * 0.5268839);
    path_4.lineTo(size.width * 0.2173913, size.height * 0.5268839);

    Paint paint4Stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.04347826;
    paint4Stroke.color = Color(0xff4BB6B7).withOpacity(1.0);
    paint4Stroke.strokeCap = StrokeCap.round;
    canvas.drawPath(path_4, paint4Stroke);

    Paint paint4Fill = Paint()..style = PaintingStyle.fill;
    paint4Fill.color = Color(0xff000000).withOpacity(1.0);
    canvas.drawPath(path_4, paint4Fill);

    Path path_5 = Path();
    path_5.moveTo(size.width * 0.3478261, size.height * 0.6881742);
    path_5.lineTo(size.width * 0.2173913, size.height * 0.6881742);

    Paint paint_5_stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.04347826;
    paint_5_stroke.color = Color(0xff4BB6B7).withOpacity(1.0);
    paint_5_stroke.strokeCap = StrokeCap.round;
    canvas.drawPath(path_5, paint_5_stroke);

    Paint paint_5_fill = Paint()..style = PaintingStyle.fill;
    paint_5_fill.color = Color(0xff000000).withOpacity(1.0);
    canvas.drawPath(path_5, paint_5_fill);

    Path path_6 = Path();
    path_6.moveTo(size.width * 0.1304348, size.height * 0.6881742);
    path_6.lineTo(size.width * 0.02173913, size.height * 0.6881742);

    Paint paint_6_stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.04347826;
    paint_6_stroke.color = Color(0xff4BB6B7).withOpacity(1.0);
    paint_6_stroke.strokeCap = StrokeCap.round;
    canvas.drawPath(path_6, paint_6_stroke);

    Paint paint_6_fill = Paint()..style = PaintingStyle.fill;
    paint_6_fill.color = Color(0xff000000).withOpacity(1.0);
    canvas.drawPath(path_6, paint_6_fill);

    Paint paint_7_fill = Paint()..style = PaintingStyle.fill;
    paint_7_fill.color = Color(0xff4BB6B7).withOpacity(1.0);
    canvas.drawCircle(Offset(size.width * 0.1304348, size.height * 0.5268839),
        size.width * 0.02173913, paint_7_fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
