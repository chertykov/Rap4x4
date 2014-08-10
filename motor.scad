use </mnt/d/RepRap/Work/Rap4x4/nema17.scad>


union() {
	union() {
		union() {
			translate(v = [5, 0, 0]) {
				union() {
					rotate(a = [0, 180, 0]) {
						nema17();
					}
					translate(v = [0, 0, 1]) {
						color(c = "gray") {
							import_stl(filename = "Pulleys/pulley-GT2-5x16t.stl");
						}
					}
				}
			}
			translate(v = [0, -7.8000000000, 0]) {
				translate(v = [-22, 0, 0]) {
					translate(v = [0, 0, 7.5000000000]) {
						color(c = "red") {
							import_stl(filename = "Pulleys/idler-624.stl");
						}
					}
				}
			}
		}
		translate(v = [0, 320, 0]) {
			rotate(a = [0, 0, 90]) {
				union() {
					translate(v = [5, 0, 0]) {
						union() {
							rotate(a = [0, 180, 0]) {
								nema17();
							}
							translate(v = [0, 0, 1]) {
								color(c = "gray") {
									import_stl(filename = "Pulleys/pulley-GT2-5x16t.stl");
								}
							}
						}
					}
					translate(v = [0, -7.8000000000, 0]) {
						translate(v = [-22, 0, 0]) {
							translate(v = [0, 0, 7.5000000000]) {
								color(c = "red") {
									import_stl(filename = "Pulleys/idler-624.stl");
								}
							}
						}
					}
				}
			}
		}
	}
	union() {
		translate(v = [0, -20, 0]) {
			translate(v = [0, 0, 26]) {
				rotate(a = [-90, 0, 0]) {
					cylinder(h = 330, r = 4);
				}
			}
		}
		translate(v = [-10, 0, 0]) {
			translate(v = [0, 0, 26]) {
				rotate(a = [0, -90, 0]) {
					cylinder(h = 330, r = 4);
				}
			}
		}
	}
}
