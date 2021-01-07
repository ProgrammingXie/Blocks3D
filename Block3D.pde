PImage Diamond;
PImage Dirt;
PImage GrassTop;
PImage GrassSides;
PImage Glass;
PImage PumpkinTop;
PImage PumpkinSides;
PImage Jack_oLantern;

float RotateX = 0;
float RotateY = 0;

void setup(){
  size(900,800,P3D);

  Diamond = loadImage("diamond.png");
  Dirt = loadImage("dirt.png");
  GrassTop = loadImage("grass_top.png");
  GrassSides = loadImage("grass_side.png");
  Glass = loadImage("Glass.png");
  PumpkinTop = loadImage("PumpkinTop.png");
  PumpkinSides = loadImage("PumpkinSides.png");
  Jack_oLantern = loadImage("Jack_o'Lantern.png");
  textureMode(NORMAL);

}
//===================================================================================================

void draw(){
  background(0);
  TexturedBlocks(width/2, height/2, 0, Diamond, 100);
  TexturedBlocks(width/2-200, height/2, 0, GrassTop, GrassSides, Dirt, GrassSides, 100);
  TexturedBlocks(width/2+200, height/2, 0, Dirt, 100);
  TexturedBlocks(width/2-25, height/2-25, -60, Glass, 150);
  TexturedBlocks(width/2, height/2-200, 00, PumpkinTop, PumpkinSides, PumpkinSides, Jack_oLantern, 100);
  
  //stroke(255);
  //line(300,0,0, 300,height,0);
  //line(600,0,0, 600,height,0);

}
//===================================================================================================

void TexturedBlocks(float X, float Y, float Z, PImage Texture, int Size){
  pushMatrix();
    translate(X, Y, Z);
    scale(Size);
    rotateX(RotateX);
    rotateY(RotateY);

    
    noStroke();
    beginShape(QUADS);
      texture(Texture);
      //     X,Y,Z, tX,tY
      vertex(0,0,0, 0,0);// Top
      vertex(1,0,0, 1,0);
      vertex(1,0,1, 1,1);
      vertex(0,0,1, 0,1);

      vertex(0,1,0, 0,0);// Bottom
      vertex(1,1,0, 1,0);
      vertex(1,1,1, 1,1);
      vertex(0,1,1, 0,1);
    
      vertex(0,0,1, 0,0);// Front
      vertex(1,0,1, 1,0);
      vertex(1,1,1, 1,1);
      vertex(0,1,1, 0,1);
        
      vertex(0,0,0, 0,0);// Back
      vertex(1,0,0, 1,0);
      vertex(1,1,0, 1,1);
      vertex(0,1,0, 0,1);
        
      vertex(0,0,0, 0,0);// Left
      vertex(0,0,1, 1,0);
      vertex(0,1,1, 1,1);
      vertex(0,1,0, 0,1);
        
      vertex(1,0,1, 0,0);// Right 
      vertex(1,0,0, 1,0);
      vertex(1,1,0, 1,1);
      vertex(1,1,1, 0,1);   
    endShape();
    
    
  popMatrix();
}

//===================================================================================================

void TexturedBlocks(float X, float Y, float Z, PImage Top, PImage Sides, PImage Bottom, PImage Front, int Size){
  pushMatrix();
    translate(X, Y, Z);
    scale(Size);
    rotateX(RotateX);
    rotateY(RotateY);

    
    noStroke();
    beginShape(QUADS);
      texture(Top);
      //     X,Y,Z, tX,tY
      vertex(0,0,0, 0,0);// Top
      vertex(1,0,0, 1,0);
      vertex(1,0,1, 1,1);
      vertex(0,0,1, 0,1);
    endShape();
    
    beginShape(QUADS); 
      texture(Bottom);
      vertex(0,1,0, 0,0);// Bottom
      vertex(1,1,0, 1,0);
      vertex(1,1,1, 1,1);
      vertex(0,1,1, 0,1);
    endShape();
    
    beginShape(QUADS); 
      texture(Front);
      vertex(0,0,1, 0,0);// Front
      vertex(1,0,1, 1,0);
      vertex(1,1,1, 1,1);
      vertex(0,1,1, 0,1);
    endShape();
    
    beginShape(QUADS); 
      texture(Sides);
      vertex(0,0,0, 0,0);// Back
      vertex(1,0,0, 1,0);
      vertex(1,1,0, 1,1);
      vertex(0,1,0, 0,1);
        
      vertex(0,0,0, 0,0);// Left
      vertex(0,0,1, 1,0);
      vertex(0,1,1, 1,1);
      vertex(0,1,0, 0,1);
        
      vertex(1,0,1, 0,0);// Right 
      vertex(1,0,0, 1,0);
      vertex(1,1,0, 1,1);
      vertex(1,1,1, 0,1);   
    endShape();
    
    
  popMatrix();
}
//===================================================================================================

void mouseDragged(){
  RotateX = RotateX + (pmouseY - mouseY)*0.01;
  RotateY = RotateY + (pmouseX - mouseX)*-0.01;

}
