const expect = require('chai').expect;
const Keypad = require('./bathroom-security').Keypad;

const directions = `ULL
RRDDD
LURDL
UUUUD`

describe('Decoder', () => {
  it('should be able to reach correct code based on directions', () =>{
    const keypad = new Keypad();
    expect(keypad.decode(directions)).to.equal('1985');
  });
});

describe('Keypad', () => {
  it('should instantiate with 5 as the default key', () => {
    const keys = new Keypad();
    expect(keys.currentKey).to.equal('5')
  });

  it('should be able to move keys and return the new key', () => {
    const keys = new Keypad();
    const newKey = keys.go('R');
    expect(newKey).to.equal('6');
  });

  it('should not wrap or go out of bounds of keyboard', () => {
    const keys = new Keypad();
    keys.go('R');
    const newKey = keys.go('R');
    expect(newKey).to.equal('6');
  });
});