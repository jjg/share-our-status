/*
    Parts
    1x Gemma M0
    2x CR2032 Lithium coin cell (20mm x 3.2mm)
*/

TOLERANCE = 1;
SOCKET_DIAMETER = 39;
BOARD_DIAMETER = 28;
BOARD_HEIGHT = 6.5;
CELL_DIAMETER = 20;
CELL_HEIGHT = 3.2;

//$fn=100;

difference(){
    // outer shell
    cylinder(r=SOCKET_DIAMETER/2, h=BOARD_HEIGHT + (CELL_HEIGHT*2) + TOLERANCE + 1);
    
    // battery cut-out
    translate([0,0,1]){
        cylinder(r=(CELL_DIAMETER/2)+TOLERANCE, h=(CELL_HEIGHT*2)+1);
    }
    
    // board cut-out
    translate([0,0,(CELL_HEIGHT*2)+1]){
        cylinder(r=(BOARD_DIAMETER/2)+TOLERANCE, h=BOARD_HEIGHT + TOLERANCE + 1);
        translate([-4,(CELL_DIAMETER/2),-(CELL_HEIGHT*2)]){
            cube([8,8,BOARD_HEIGHT + (CELL_HEIGHT*2) + TOLERANCE]);
        }
    }
    
    // cover cut-out
    translate([0,0,BOARD_HEIGHT + (CELL_HEIGHT*2) + 1]){
        #cylinder(r=(SOCKET_DIAMETER-2)/2,h=5);
    }
}