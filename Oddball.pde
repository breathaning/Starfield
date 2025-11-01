class Oddball extends Particle {
	private color sparkColor;
	
	Oddball() {
		super();
		showColor = color(255, 255, 0);
		sparkColor = color(255, 70, 0);
		speed = 10;
	}

	void move() {
		super.move();
		x += (Math.random() - 0.5) * speed / 5;
		y += (Math.random() - 0.5) * speed / 5;
	}

	void show() {
		noStroke();
		fill(sparkColor);
		pushMatrix();
		translate(x, y);
		rotate(x / 100);
		ellipse(0, 0, size, size * 2);
		popMatrix();
		fill(showColor);
		super.show();
	}
}
