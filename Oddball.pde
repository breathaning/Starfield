class Oddball extends Particle {
	Oddball() {
		super();
		showColor = color(255, 255, 0);
		speed = 10;
	}

	void move() {
		super.move();
		x += (Math.random() - 0.5) * speed / 5;
		y += (Math.random() - 0.5) * speed / 5;
	}

	void show() {
		super.show();
		pushMatrix();
		rotate(x / 100);
		ellipse(x, y, size, size * 2);
		popMatrix();
	}
}
