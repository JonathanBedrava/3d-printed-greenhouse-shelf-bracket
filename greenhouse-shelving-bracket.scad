nutLipRad = 13.9/2;
nutLipZ = 2.25;

boltRad =  6.5/2; //6mm cropped greenhouse bolt

lateralOffset = 15;

centerBracketX = 38;
bracketX = 35;
bracketY = 203;
bracketZ = 8;

boltHoleOffset = 10;

rotate([0,90,90])

bracketDouble();
//bracketLeft();
//bracketRight();
//centerBracket();
//bigBrace();

$fn = 50;

module bracketDouble()
{
    translate([-bracketX*2,0,0])
    bracketRight();
    bracketLeft();
}

module bracketRight()
{
    scale([-1,1,1])
    bracketLeft();
}

module bracketLeft()
{
    translate([-bracketX,0,0])
        bracketSeg();
    bracketBase();
    translate([0,bracketY/2+bracketZ/2,bracketY/2-bracketZ/2])
        rotate([90,0,0])
            bracketSeg();
    translate([1/128,1/128,-1/128])
    bigBrace();
}

module centerBracket()
{
    bracketSeg();
    translate([0,bracketY/2+bracketZ/2,bracketY/2-bracketZ/2])
        rotate([90,0,0])
            bracketSeg();
    translate([1/128,1/128,-1/128])
    bigBrace();
}

module bigBrace()
{
    x = bracketX/2+1.5;

    polyhedron (points=[
        [-x,-bracketY/3.75-bracketX/2,bracketZ/2],//BOTTOM LEFT BACK 0
        [x,-bracketY/3.75-bracketX/2,bracketZ/2],//BOTTOM RIGHT BACK 1
        [-x,-bracketY/3.75+bracketX/2,bracketZ/2],//BOTTOM LEFT FRONT 2
        [x,-bracketY/3.75+bracketX/2,bracketZ/2],//BOTTOM RIGHT FRONT 3
        [-x,bracketY/2,bracketY-bracketY/4.125+x],//TOP LEFT TOP 4
        [x,bracketY/2,bracketY-bracketY/4.125+x],//TOP RIGHT TOP 5
        [-x,bracketY/2,bracketY-bracketY/4.125-x],//TOP LEFT BOTTOM 6
        [x,bracketY/2,bracketY-bracketY/4.125-x],//TOP RIGHT BOTTOM 7
        ],
        faces=[
            [0,1,3,2], //cw BOTTOM
            [1,5,7,3], //good - cw RIGHT
            [7,6,2,3], //cw BACK
            [0,4,5,1], //cw TOP
            [6,4,0,2], //good - cw LEFT
            ///[0,1,2,3], // cw
            [4,6,7,5] //cw BACK
        ]); 
}

module bracketBase()
{
    cube([centerBracketX,bracketY,bracketZ], center = true);
}

module bracketSeg()
{
    difference()
    {
        bracketBase();
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