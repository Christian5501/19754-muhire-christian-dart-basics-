// Student: MUHIRE Christian
// Reg no: 19754
const String regNo = '19754';
final int d = int.parse(regNo[regNo.length - 1]);
final int t = int.parse(regNo.substring(regNo.length - 2));

String formatRwf(int amount) {
  // by MC
  String number = amount.abs().toString();
  String result = '';
  int i = 0;
  while (i < number.length) {
    if (i > 0 && (number.length - i) % 3 == 0) {
      result += ',';
    }
    result += number[i];
    i++;
  }
  if (amount < 0) {
    result = '-' + result;
  }
  return '$result RWF';
}

bool isValidPin(String pin) {
  // by MC
  if (pin.length != 5) {
    return false;
  }
  int i = 0;
  while (i < pin.length) {
    if (!'0123456789'.contains(pin[i])) {
      return false;
    }
    i++;
  }
  if (pin == '12345') {
    return false;
  }
  bool same = true;
  i = 1;
  while (i < pin.length) {
    if (pin[i] != pin[0]) {
      same = false;
    }
    i++;
  }
  if (same) {
    return false;
  }
  return true;
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

int sendMoney(int balance, int amount) {
  // by MC
  int fee = momoFee(amount);
  if (fee == -1) {
    print('Failed: invalid amount');
    return balance;
  }
  if (amount + fee > balance) {
    print('Failed: insufficient balance');
    return balance;
  }
  balance = balance - amount - fee;
  print('Sent ${formatRwf(amount)} (fee ${formatRwf(fee)}). '
      'New balance: ${formatRwf(balance)}');
  return balance;
}

int buyAirtime(int balance, int amount) {
  // by MC
  if (amount < 100 || amount > 50000) {
    print('Failed: invalid airtime amount');
    return balance;
  }
  if (amount > balance) {
    print('Failed: insufficient balance');
    return balance;
  }
  balance = balance - amount;
  print('Airtime ${formatRwf(amount)} purchased. '
      'New balance: ${formatRwf(balance)}');
  return balance;
}

void main() {
  // by MC
  print('Reg no: $regNo | D = $d | T = $t');

  print(isValidPin('12345'));
  print(isValidPin('77777'));
  print(isValidPin('4821'));
  print(isValidPin('48a21'));
  print(isValidPin('4821$d'));

  int balance = 20000 + t * 500;
  print('Starting balance: ${formatRwf(balance)}');

  int amount = (d + 1) * 3000;
  balance = sendMoney(balance, amount);
  balance = sendMoney(balance, amount);
  balance = sendMoney(balance, amount);
  balance = buyAirtime(balance, 1000);
  balance = sendMoney(balance, 0);
  balance = sendMoney(balance, 200000);
  print('Final balance: ${formatRwf(balance)}');

  // my own tests, expected result in the comment
  print(formatRwf(100000)); // 100,000 RWF
  print(formatRwf(1000000)); // 1,000,000 RWF
  print(formatRwf(-100)); // -100 RWF (might break: comma right after the minus)
  print(isValidPin('00000')); // false (same digit five times)
  print(isValidPin('01234')); // true (leading zero is allowed)
  print(isValidPin(' 1234')); // false (a space is not a digit)
}