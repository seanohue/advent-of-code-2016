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
    if (this.inbounds(n)) { this._y = n; } 
  }

  inbounds(n) {
    const boundsCheckers = {
      square:  n => (n > -1) && (n < 3),
      diamond: n => (n > -1) && (n < 5)
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
    console.log(`Pressing ${this.currentKey}!`);
    this.pressed.push(this.currentKey); 
    return this.currentKey;
  }
  
  submit() { return this.pressed.join(''); }

  go(dir) {
    console.log(`Direction is ${dir}.`);
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
    
    const changers = {
      square: (x, y) => {
        this.x += x;
        this.y += y;
      },
      diamond: (x, y) => {
        const newX = this.x + x;
        const newY = this.y + y;
       
        if (this.KEYS[newY] && this.KEYS[newY][newX]) {
          this.x = newX;
          this.y = newY;
          console.log(`Changed to ${newX}, ${newY}.`);
          console.log(`New key is ${this.currentKey}.`);
        }
      }
    };

    return changers[this.keysType](x, y);
  }

}

module.exports = { Keypad };
