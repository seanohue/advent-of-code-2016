const expect = require('chai').expect;
const directions = `ULL
RRDDD
LURDL
UUUUD
`
const BathroomSecurity = require('./bathroom-security');
const Keypad = BathroomSecurity.Keypad;

describe('Decoder', () => {
  it('should be able to reach correct code based on directions', () =>{
    expect(BathroomSecurity.decode(directions)).to.equal('1985');
  });
});

describe('Keypad', () => {
  it('should instantiate with 5 as the default key', () => {
    const keys = new Keypad();
    expect(keys.currentKey).to.equal('5')
  });
});