// Student: MUHIRE Christian
// Reg no: 19754
const String regNo = '19754';
final int d = int.parse(regNo[regNo.length - 1]);
final int t = int.parse(regNo.substring(regNo.length - 2));

int countVowels(String text) {
  // by MC
  int count = 0;
  text = text.toLowerCase(); // this line makes capital letters count
  int i = 0;
  while (i < text.length) {
    if ('aeiou'.contains(text[i])) {
      count++;
    }
    i++;
  }
  return count;
}

String initials(String fullName) {
  // by MC
  fullName = fullName.trim();
  if (fullName.isEmpty) {
    return '';
  }
  List<String> names = fullName.split(RegExp(r'\s+'));
  String result = '';
  int i = 0;
  while (i < names.length) {
    result += names[i][0].toUpperCase() + '.';
    i++;
  }
  return result;
}

void drawTriangle(int height) {
  // by MC
  int row = 1;
  while (row <= height) {
    String line = '';
    int spaces = height - row; // shorter rows need more spaces on the left
    int j = 0;
    while (j < spaces) {
      line += ' ';
      j++;
    }
    String symbol = '*';
    if (row % 2 == 0) {
      symbol = '#';
    }
    int k = 0;
    while (k < row) {
      line += symbol;
      k++;
    }
    print(line);
    row++;
  }
}

int momoFee(int amount) {
  // by MC
  if (amount <= 0) {
    return -1;
  } else if (amount <= 1000) {
    return 20;
  } else if (amount <= 10000) {
    return 100;
  } else if (amount <= 150000) {
    return 250;
  } else {
    return 1500;
  }
}

String maskPhone(String phone) {
  // by MC
  if (phone.length != 10) {
    return 'INVALID';
  }
  return phone.substring(0, 3) + '*****' + phone.substring(8, 10);
}

void main() {
  // by MC
  print('Reg no: $regNo | D = $d | T = $t');

  // B2
  String studentName = 'MUHIRE Christian';
  print('$studentName has ${countVowels(studentName)} vowels');

  // B3
  print(initials(studentName));
  print(initials(' ana uwase '));
  print(initials(' '));

  // C5
  drawTriangle(d + 3);
  drawTriangle(0);
  drawTriangle(-2);

  // D2
  String phone = '0788123456';
  int total = 0;
  int i = 1;
  while (i <= d + 3) {
    int amount = i * 4000 + t * 100;
    int fee = momoFee(amount);
    print('Receipt $i | $amount RWF | fee $fee RWF | to ${maskPhone(phone)}');
    total += fee;
    i++;
  }
  print('Total fees: $total RWF');
}