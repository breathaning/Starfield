Particle[] particles = new Particle[100];

void setup() {
  size(500, 500, P3D);
  
	for (int i = 0; i < particles.length; i++) {
		if (i < 20) {
			particles[i] = new Oddball();
		} else {
			particles[i] = new Particle();
		}
	}
}


void draw() {
  background(80, 2, 110);
	for (int i = 0; i < particles.length; i++) {
		particles[i].move();
		particles[i].show();
	}
}
