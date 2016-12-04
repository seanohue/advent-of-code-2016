const expect = require('chai').expect;
const Keypad = require('./bathroom-security').Keypad;

const directions = `ULL
RRDDD
LURDL
UUUUD`


describe('Decoder', () => {
  it('should be able to reach correct code based on directions', () =>{
    const keypad = new Keypad('square');
    expect(keypad.decode(directions)).to.equal('1985');
  });
});

describe('Square Keypad', () => {
  it('should instantiate with 5 as the default key', () => {
    const keys = new Keypad('square');
    expect(keys.currentKey).to.equal('5')
  });

  it('should be able to move keys and return the new key', () => {
    const keys = new Keypad('square');
    const newKey = keys.go('R');
    expect(newKey).to.equal('6');
  });

  it('should not wrap or go out of bounds of keyboard', () => {
    const keys = new Keypad('square');
    keys.go('R');
    const newKey = keys.go('R');
    expect(newKey).to.equal('6');
  });
});

describe('Diamond Keypad', () => {
  it('should instantiate with 5 as the default key', () => {
    const keys = new Keypad('diamond');
    expect(keys.currentKey).to.equal('5')
  });

  it('should be able to move and stuff tho', () => {
    const keys = new Keypad('diamond');
    keys.go('R');
    const newKey = keys.go('R');
    expect(newKey).to.equal('7');
  });

  it.only('should still be able to do decoding.', () => {
    const keys = new Keypad('diamond');
    expect(keys.decode(directions)).to.equal('5DB3');
  });
});