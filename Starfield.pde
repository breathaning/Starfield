class Particle {
	double x, y, angle, speed, size;
	color showColor;
	Particle() {
		speed = 5;
		showColor = color(255, 0, 0);
		reset();
	}

	void move() {
		x += speed * Math.cos(angle);
		y += speed * Math.sin(angle);

		double dist = Math.sqrt(Math.pow(x - 200, 2) + Math.pow(y - 200, 2));
		double maxDist = Math.sqrt(Math.pow(width / 2, 2) + Math.pow(height / 2, 2));
		if (dist > maxDist) {
			reset();
		}
	}

	void show() {
		noStroke();
		fill(showColor);
		ellipse(x, y, size, size);
	}

	void reset() {
		x = width / 2;
		y = height / 2;
		angle = Math.random() * TWO_PI;
		size = Math.random() * 5 + 10;
	}
}

class Oddball extends Particle {
	Oddball() {
		super();
		showColor = color(255, 255, 0);
		speed = 10;
	}
}

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
