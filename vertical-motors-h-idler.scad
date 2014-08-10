use </mnt/d/RepRap/Work/Rap4x4/nema17.scad>


union() {
	union() {
		translate(v = [5, 0, 0]) {
			union() {
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
				difference() {
					difference() {
						difference() {
							difference() {
								difference() {
									difference() {
										union() {
											difference() {
												translate(v = [-22, -22, -1]) {
													cube(size = [43, 43, 35]);
												}
												translate(v = [0, -7.8000000000]) {
													cylinder(h = 15, r = 15);
												}
											}
											translate(v = [-39, -13.8000000000, -1]) {
												cube(size = [17, 12, 8.5000000000]);
											}
										}
										translate(v = [0, 0, 1]) {
											cylinder(h = 40, r = 11);
										}
									}
									translate(v = [-22, 21, 0]) {
										translate(v = [0, 0, 5]) {
											cylinder(h = 80, r = 9);
										}
									}
								}
								rotate(a = 90) {
									translate(v = [-22, 21, 0]) {
										translate(v = [0, 0, 5]) {
											cylinder(h = 80, r = 9);
										}
									}
								}
							}
							rotate(a = 180) {
								translate(v = [-22, 21, 0]) {
									translate(v = [0, 0, 5]) {
										cylinder(h = 80, r = 9);
									}
								}
							}
						}
						rotate(a = 270) {
							translate(v = [-22, 21, 0]) {
								translate(v = [0, 0, 5]) {
									cylinder(h = 80, r = 9);
								}
							}
						}
					}
					translate(v = [-9, 0, 5]) {
						cube(size = [17, 25, 13]);
					}
				}
			}
		}
		translate(v = [-28, 5.0000000000, 10.5000000000]) {
			rotate(a = [90, 0, 0]) {
				color(c = "red") {
					import_stl(filename = "Pulleys/idler-624.stl");
				}
			}
		}
	}
	union() {
		translate(v = [0, -21, 0]) {
			translate(v = [0, 0, 26]) {
				rotate(a = [-90, 0, 0]) {
					cylinder(h = 330, r = 4);
				}
			}
		}
		translate(v = [-6, 0, 0]) {
			translate(v = [0, 0, 26]) {
				rotate(a = [0, -90, 0]) {
					cylinder(h = 330, r = 4);
				}
			}
		}
	}
}
