const KEYS = [['1', '2', '3'],
              ['4', '5', '6'],
              ['7', '8', '9']];

class Keypad {
  constructor() {
    this.coords  = {x: 1 , y: 1 };
    this.pressed = [];
  }

  get keys() { return KEYS; }
  get x()    { return this.coords.x; }
  get y()    { return this.coords.y; }
  
  get currentKey() { return this.keys[this.x][this.y]; }

  press()  { return this.pressed.push(this.currentKey); }
  submit() { return this.pressed.join(); }

}

const decode = directionsStr => {
  const directions = parseDirections(directionsStr);
  const keypad     = new Keypad();
  return directions.reduce(walkToKeys, keypad).submit();
};

const walkToKeys = (keypad, direction) => keypad;

const parseDirections = directionsStr => directionsStr.split(/\r?\n/);

const BathroomSecurity = {
  decode, parseDirections, Keypad
};

module.exports = BathroomSecurity;
