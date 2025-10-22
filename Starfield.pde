class Instance {
  PVector position;
  PVector size;
  
  Instance(PVector position, PVector size) {
    this.position = position;
    this.size = size;
    instances.add(this);
  }
  
  Instance(PVector position) {
    this(position, new PVector(1, 1, 1));
  }
  
  Instance() {
    this(new PVector(0, 0, 0), new PVector(1, 1, 1));
  }
  
  void update() {}
  
  void show() {}
  
  void destroy() {
    instances.remove(this);
  }
}

class PlaceableBox extends Instance {
  boolean placed = false;
  
  PlaceableBox(PVector position) {
    super(position);
  }
}

class FireworkBox extends PlaceableBox {
  FireworkBox(PVector position) {
    super(position);
  }
  
  void update() {
    
  }
  
  void show() {
    fill(255, 0, 0);
    translate(position.x, position.y, position.z);
    box(size.x, size.y, size.z);
  }
}

boolean isPlacing;
PlaceableBox placingBox;

ArrayList<Instance> instances = new ArrayList();
ArrayList<PlaceableBox> boxes = new ArrayList();

void setup() {
  size(500, 500, P3D);
  
  isPlacing = false;
}

void mousePressed() {
  if (mouseButton == RIGHT && isPlacing == false) {
    isPlacing = true;
    placingBox = new FireworkBox(new PVector(0, 0, 0));
  } else if (mouseButton == LEFT && isPlacing == true) {
    isPlacing = false;
    boxes.add(placingBox);
    placingBox = null;
  }
}

void draw() {
  camera(0, -50, 50, 0, 0, 0, 0, 1, 0);
  background(80, 2, 110);
  pushMatrix();
  translate(0, 0, 0);
  rotateX(HALF_PI);
  fill(0, 128, 0);
  stroke(0, 0, 0);
  strokeWeight(4);
  ellipse(0, 0, 50, 50);
  popMatrix();
  for (int i = 0; i < instances.size(); i++) {
    Instance instance = instances.get(i);
    instance.update();
    pushMatrix();
    instance.show();
    popMatrix();
  }
}
