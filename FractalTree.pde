RainDrops[] rain;
private double fractionLength = .8; 
private int smallestBranch = 75; 
private double branchAngle = .4; 
boolean grow = false; 
boolean raining = false;
PImage africa;
int red = 145;
int green = 75;
int blue = 50;
public void setup() 
{   

	size(640,500);    
	africa = loadImage("AfricanSavanna.jpg");
	rain = new RainDrops[100];
	for(int i = 0; i < rain.length;i++)
		rain[i] = new RainDrops();
} 
public void draw() 
{   
	image(africa,0,0,640,500);
	strokeWeight(3); 
	stroke(145,75,50);
	line(320,480,320,380);   
	drawBranches(320,380,75,3*Math.PI/2);
	if(grow == true && smallestBranch>= 10)
	{
		smallestBranch -= 1;
	}
	if(raining == true)
	{
		for(int i = 0; i < rain.length;i++)
		{	
			rain[i].show();
			rain[i].wrap();
		}
	}
} 
public void mousePressed()
{
	grow = true;
	raining = true;
}
public void mouseReleased()
{
	grow = false;
	raining = false;
	for(int i = 0; i < rain.length;i++)
		rain[i].reset();
}
public void keyPressed()
{
	if(key == 'r')
		smallestBranch = 75;
}
public void drawBranches(int x,int y, double branchLength, double angle) 
{   
	double angle1= angle + branchAngle;
	double angle2= angle - branchAngle;
	int endX1 = (int)(branchLength*Math.cos(angle1)+x);
	int endY1 = (int)(branchLength*Math.sin(angle1)+y);
	int endX2 = (int)(branchLength*Math.cos(angle2)+x);
	int endY2 = (int)(branchLength*Math.sin(angle2)+y);
	branchLength = branchLength * fractionLength;
	
	if(branchLength > 20)
	{
		stroke(145,75,50);
	}
	if(branchLength < 20)
	{
		stroke(40,115,35);
	}
	line(x,y,endX1,endY1);
	line(x,y,endX2,endY2);
	if(branchLength>=smallestBranch)
	{
		drawBranches(endX1,endY1,branchLength,angle1);
		drawBranches(endX2,endY2,branchLength,angle2);

	}
} 
public class RainDrops
{
	int rX,rY;
	RainDrops()
	{
		rX = (int)(Math.random()*640);
		rY = (int)(Math.random()*500)-500;
	}
	void show()
	{
		noStroke();
		fill(0,0,255);
		ellipse(rX,rY,5,5);
		rY+=20;
	}
	void wrap()
 	{
    	if(rY >= 500)
    	{
      		rY = (int)(Math.random()*500)-500;
      		rX = (int)(Math.random()*640);
    	}
    }
 	void reset()
 	{
 		rX = (int)(Math.random()*640);
		rY = (int)(Math.random()*500)-500;
 	}


}
