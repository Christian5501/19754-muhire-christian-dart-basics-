// Student: MUHIRE Christian
// Reg no: 19754

const String regNo = '19754';

final int d = int.parse(regNo[regNo.length - 1]);
final int t = int.parse(regNo.substring(regNo.length - 2));

// by MC
void main() {
  print('Reg no: $regNo | D = $d | T = $t');
}

