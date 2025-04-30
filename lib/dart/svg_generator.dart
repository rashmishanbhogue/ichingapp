// generate hexagram pattern in svg based on the inputs from user

class SvgGenerator {
  // generate a yin line (solid filled broken)
  static String getYinLine(double yPosition) {
    return '''
      <path d="M0 $yPosition H70 V${yPosition + 15.8397} H0 V$yPosition Z" fill="#1D1B20"/>
      <path d="M88 $yPosition H158 V${yPosition + 15.8397} H88 V$yPosition Z" fill="#1D1B20"/>
    ''';
  }

  // yin-changing line (solid filled broken with 'X')
  static String getYinChangingLine(double yPosition) {
    return '''
      <path d="M0 $yPosition H70 V${yPosition + 15.8397} H0 V$yPosition Z" fill="#1D1B20"/>
      <path d="M88 $yPosition H158 V${yPosition + 15.8397} H88 V$yPosition Z" fill="#1D1B20"/>
      <text x="79" y="${yPosition + 14}" font-family="Roboto" font-size="18" font-weight="bold" fill="#1D1B20" text-anchor="middle" alignment-baseline="middle">X</text>
    ''';
  }

  // yang line (solid filled black)
  static String getYangLine(double yPosition) {
    return '''
      <path d="M0 $yPosition H158 V${yPosition + 15.8397} H0 V$yPosition Z" fill="#1D1B20"/>
    ''';
  }

  // yang-changing line (solid filled black with 'O')
  static String getYangChangingLine(double yPosition) {
    return '''
      <path d="M0 $yPosition H158 V${yPosition + 15.8397} H0 V$yPosition Z" fill="#1D1B20"/>
      <text x="79" y="${yPosition + 14}" font-family="Roboto" font-size="18" font-weight="bold" fill="#ffffff" text-anchor="middle" alignment-baseline="middle">O</text>
    ''';
  }
}
