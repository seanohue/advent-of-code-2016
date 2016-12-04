class Keypad {
  constructor(keysType) {
    this._x = keysType === 'square' ? 1 : 0;
    this._y = keysType === 'square' ? 1 : 2;
    this.pressed = [];
    this.keysType = keysType;
  }

  get KEYS() { 
    const keypads = {
      square:  [['1', '2', '3'],
                ['4', '5', '6'],
                ['7', '8', '9']],

      diamond: [[ '', '','1', '', ''],
                [ '','2','3','4', ''],
                ['5','6','7','8','9'],
                [ '','A','B','C', ''],
                [ '', '','D', '', '']],
    };
    return keypads[this.keysType];
  }

  get currentKey() { return this.KEYS[this.y][this.x]; }

  get x() { return this._x; }
  get y() { return this._y; }
  
  set x(n) { 
    if (this.inbounds(n)) { this._x = n; } 
  }
  set y(n) { 
    if (this.inbounds(n)){ this._y = n; } 
  }

  inbounds(n) {
    const boundsCheckers = {
      square:  n => (n > -1) && (n < 3),
      diamond: n => (n > -1) && (n < 4) && this.KEYS[n][n]
    };
    return boundsCheckers[this.keysType](n);
  }

  decode(directionsStr) {
    const directions = this.parseDirections(directionsStr);
    directions.forEach(dir => this.walk(dir));
    return this.submit();
  }

  parseDirections(directionsStr) { return directionsStr.split(/\r?\n/); }

  walk(direction) {
    const steps = direction.split('');
    steps.forEach(step => this.go(step));
    return this.press();
  }

  press()  { 
    this.pressed.push(this.currentKey); 
    return this.currentKey;
  }
  
  submit() { return this.pressed.join(''); }

  go(dir) {
    const coordinateChanges = {
      'R': [  1,  0 ],
      'L': [ -1,  0 ],
      'U': [  0, -1 ],
      'D': [  0,  1 ]
    };
    this.changeKey(...coordinateChanges[dir]);
    return this.currentKey;
  }
  
  changeKey(x, y) {
    this.x += x;
    this.y += y;
  }

}

module.exports = { Keypad };
