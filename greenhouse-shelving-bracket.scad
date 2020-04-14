nutLipRad = 14.5/2;
nutLipZ = 2.25;

boltRad =  6/2; //6mm cropped greenhouse bolt

lateralOffset = 15;

centerBracketX = 38;
bracketX = 35;
bracketY = 203;
bracketZ = 8;

boltHoleOffset = 10;

centerBracket();

$fn = 50;

module centerBracket()
{
    bracketSeg();
    translate([0,bracketY/2+bracketZ/2,bracketY/2-bracketZ/2])
        rotate([90,0,0])
            bracketSeg();
}

module bigBrace()
{
    
}

module bracketSeg()
{
    difference()
    {
        cube([centerBracketX,bracketY,bracketZ], center = true);
        translate([0,0,bracketZ/2-nutLipZ]){
            boltHole();
        }
        translate([0,bracketY/2-nutLipRad-boltHoleOffset,bracketZ/2-nutLipZ]){
            boltHole();
        }
        translate([0,-bracketY/2+nutLipRad+boltHoleOffset,bracketZ/2-nutLipZ]){
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