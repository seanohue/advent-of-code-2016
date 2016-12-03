const expect = require('chai').expect;
const directions = `
ULL
RRDDD
LURDL
UUUUD
`
const BathroomSecurity = require('./bathroom-security');

describe('Keypad', () => {
  it('should be able to reach correct code based on directions', () =>{
    expect(BathroomSecurity.decode(directions)).to.be('1985');
  });

});