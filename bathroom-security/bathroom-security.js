class Keypad {
  constructor() {
    this.x = 1;
    this.y = 1;
    this.pressed = [];
  }

  get keys() { return [['1', '2', '3'],
                       ['4', '5', '6'],
                       ['7', '8', '9']]; }

  get currentKey() { return this.keys[this.y][this.x]; }

  press()  { return this.pressed.push(this.currentKey); }
  submit() { return this.pressed.join(''); }

  changeKey(x, y) {
    this.x += x;
    this.y += y;
  }

  go(dir) {
    switch(dir) {
      case 'R':
        return this.changeKey(1, 0);
      case 'L':
        return this.changeKey(-1, 0);
      case 'U':
        return this.changeKey(0, 1);
      case 'D':
        return this.changeKey(0, -1);
    }
  }

  walk(keypad, direction) {
  const steps = direction.split('');
  steps.forEach(keypad.go.bind(keypad));
  keypad.press();
  return keypad;
}

}

const decode = directionsStr => {
  const directions = parseDirections(directionsStr);
  const keypad     = new Keypad();
  return directions.reduce(keypad.walk, keypad).submit();
};

const parseDirections = directionsStr => directionsStr.split(/\r?\n/);

const BathroomSecurity = {
  decode, parseDirections, Keypad
};

module.exports = BathroomSecurity;
