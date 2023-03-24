spielraum = 2;
wanddicke = 7;
wanddicke_vogelhaus = 7;

hook_x = wanddicke_vogelhaus + 2*wanddicke;
hook_y = 46 - spielraum;
hook_z = 30;

hookinner_x = wanddicke_vogelhaus;
hookinner_y = hook_y + 2*spielraum;
hookinner_z = hook_z - wanddicke + spielraum;

box_x = 50;
box_y = hook_y + 2*wanddicke;
box_z = 30;

boxinner_x = box_x - 2* wanddicke;
boxinner_y = box_y - 2*wanddicke;
boxinner_z = box_z - wanddicke + spielraum;


color("#00ff00") union() {      // verbindet Box mit Hook
    translate ([-(wanddicke + wanddicke_vogelhaus), wanddicke, wanddicke]) difference() {   // zieht inneren Hook von Hook ab

        cube([hook_x, hook_y, hook_z]); //äußere Kanten Hook

        translate([wanddicke, -spielraum, -spielraum]) color("#ff0000") cube ([hookinner_x, hookinner_y, hookinner_z]); // innere Kanten Hook
    }


    difference() {  //zieht innere Box von Box ab
        cube([box_x, box_y, box_z]);    //äußere Kanten Box

        translate([wanddicke, wanddicke, wanddicke]) color("#ff0000") cube([boxinner_x, boxinner_y, boxinner_z]);    // innere Kanten Box
    }
}


// translate([-150, -spielraum/2, -10]) color("#0000ff") cube([150,60,40]);
