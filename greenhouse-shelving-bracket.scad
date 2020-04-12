nutLipRad = 14.5/2;
nutLipZ = 2.25;

boltRad =  6/2; //6mm cropped greenhouse bolt

lateralOffset = 15;

centerBracketX = 20;
bracketX = 35;
bracketY = 190;
bracketZ = 7;

centerBracket();

$fn = 50;

module centerBracket()
{
    bracketSeg();
}

module bracketSeg()
{
    difference()
    {
        cube([centerBracketX,bracketY,bracketZ], center = true);
        translate([0,0,bracketZ/2-nutLipZ]){
            boltHole();
        }
        translate([0,bracketY/2-nutLipRad-3,bracketZ/2-nutLipZ]){
            boltHole();
        }
        translate([0,-bracketY/2+nutLipRad+3,bracketZ/2-nutLipZ]){
            boltHole();
        }
    } 
}

module boltHole()
{
    union()
    {
        cylinder(r = nutLipRad,h = nutLipZ+1);
        translate([0,0,-bracketZ])
            cylinder(r = boltRad, h = bracketZ+1);
    }
}