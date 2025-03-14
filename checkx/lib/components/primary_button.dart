import 'package:checkx/utils/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PrimaryButton extends StatefulWidget {
  final String text;
  final VoidCallback onPressed;
  final Color color;
  final Color textColor;
  final bool isLoading;
  final String? icon;

  const PrimaryButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.color = const Color(0xFF6A1E55),
    this.textColor = Colors.white,
    this.isLoading = false,
    this.icon,
  });

  @override
  State<PrimaryButton> createState() => _PrimaryButtonState();
}

class _PrimaryButtonState extends State<PrimaryButton> {
  bool _isLoading = false;

  void _handlePress() {
    setState(() => _isLoading = true);
    widget.onPressed();
    Future.delayed(const Duration(seconds: 2), () {
      setState(() => _isLoading = false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: _isLoading ? null : _handlePress,
      style: ElevatedButton.styleFrom(
        backgroundColor: widget.color,
        foregroundColor: widget.textColor,
        minimumSize: const Size(double.infinity, 50),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      child: _isLoading
          ? const CircularProgressIndicator(color: Colors.white)
          : Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (widget.icon != null) ...[
                  SvgPicture.asset(widget.icon!, height: 20, width: 20),
                  const SizedBox(width: 10),
                ],
                Text(widget.text, style: AppTheme.headingText18),
              ],
            ),
    );
  }
}
