/*
 * Body
 */
include <consts.scad>;
use <tools.scad>;
use <tenon.scad>;

BODY_LENGTH=TENON_LENGTH;
BODY_HOLES=[];

module body(l=BODY_LENGTH, holes=BODY_HOLES) {
  slide(TENON_LENGTH) difference() {
    union() {
      mortise(z=-TENON_LENGTH);
      shell(b=FLUTE_OUTER, l=l-TENON_LENGTH);
      tenon(z=l-TENON_LENGTH);
    }
    // bore
    bore(b=FLUTE_INNER, l=l-TENON_LENGTH);
    // holes
    for(h=holes) let (zh=h[0], dh=h[1], hh=(FLUTE_OUTER-FLUTE_INNER)/2) {
      hole(z=zh, b=FLUTE_INNER, h=hh, d=dh);
    }
  }
}

body();
