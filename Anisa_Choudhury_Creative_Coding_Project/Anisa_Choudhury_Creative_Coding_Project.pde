/*
Name: Anisa Choudhury
Student ID: 230019755

Description:
My data looks at the modes of transportation I have used for journeys I have made over a span of 2 weeks. 
The images indicate the mode of transportation that was used, and they are arranged according to use on that particular day.
When you hover the mouse over the images, it also tells you if it was a short or long journey.
Lastly, you can use the < and > keys to make the data display bigger or smaller.
*/

// Global variables 
String[] lightData;   // Array holds data from the file (in this case the CSV data)
String[][] data;      // 2D array holds each data item in a separate array element (each row corresponds to a day, columns are transport modes)
PImage walkingImg, carImg, busImg, trainImg, planeImg, boatImg; 
float lightSize = 50;  // determines the sizes of the images used to represent data items

void setup() {
  size(800, 850);  
  textAlign(CENTER, TOP);  
  textSize(18); 
  ellipseMode(CENTER);  

  // Loads images for different transport modes into PImage objects
  walkingImg = loadImage("walking.png");  
  carImg = loadImage("car.png");          
  busImg = loadImage("bus.png");          
  trainImg = loadImage("train.png");      
  planeImg = loadImage("plane.png");     
  boatImg = loadImage("boat.png");       

  // Loads data from the file into the lightData array with loadStrings()
  lightData = loadStrings("Journey.csv");  

  // Initializes each element of the data array
  data = new String[lightData.length][];  

  // Loops through each line of Lightdata array
  for (int i = 0; i < lightData.length; i++) {
    String[] dataItems = split(lightData[i], ","); // Splits the line at each comma
    data[i] = new String[dataItems.length];  

    // Loops through each comma separated item in the line and put each data item into the appropriate array element
    for (int d = 0; d < dataItems.length; d++) {
      data[i][d] = dataItems[d]; // 'i' is the data line (row), 'd' is the data element number (column)
    }
  }
}

void draw() {
  background(173, 216, 230);  

  fill(0); 
  textSize(32);
  text("Modes Of Transport For Journeys Across Two Weeks", width / 2, 20);  

  // Loops through each row in the data array to display each day's data
  for (int i = 0; i < data.length; i++) {
    float x = lightSize * 1.5;           
    float y = lightSize + i * lightSize; 
    String dayName = data[i][0];         
    color fillColour = color(255, 255, 255); 
    fill(32, 128);  
    textSize(18);  
    text(dayName, lightSize * 1.5, y);  

    // Loops through each column in this row of the data array
    for (int d = 1; d < data[i].length; d++) { 
      String light = data[i][d];          
      boolean weHaveData = true;          
      String lightText = ""; 
      PImage img = null;                  

      // Determines which image to display based on the transport mode
      if (light.equals("Short Walking Journey")) {          
        img = walkingImg;
      } else if (light.equals("Long Walking Journey")) {       
        img = walkingImg;
      } else if (light.equals("Short Car Journey")) {        
        img = carImg;
      } else if (light.equals("Long Car Journey")) {      
        img = carImg;
      } else if (light.equals("Short Bus Journey")) {      
        img = busImg;
      } else if (light.equals("Long Bus Journey")) {       
        img = busImg;
      } else if (light.equals("Long Train Journey")) {       
        img = trainImg;
      } else if (light.equals("Short Train Journey")) {      
        img = trainImg;
      } else if (light.equals("Long Boat Journey")) {      
        img = boatImg;
      } else if (light.equals("Short Boat Journey")) {       
        img = boatImg;
      } else if (light.equals("Long Plane Journey")) {      
        img = planeImg;
      } else if (light.equals("Short Plane Journey")) {       
        img = planeImg;
      }
      
      // If img is not null, the corresponding transport image is displayed
      if (img != null) {  
        x += lightSize;  

        // Drawing image
        imageMode(CENTER);  
        image(img, x, y, lightSize, lightSize); 

        // If mouse is hovering over the image, display the transport mode text
        if (dist(mouseX, mouseY, x, y) < lightSize * 0.5) {  
          stroke(32, 128); 
          noFill();  
          ellipse(x, y, lightSize * 1.1, lightSize * 1.1); 
          fill(16, 200);  
          text(light, mouseX, mouseY - 10);  
        }
      }
    }
  }

  noLoop();  // Switches the draw() loop off to save resources
}

void mouseMoved() {
  loop();  // Switch the draw() loop on when mouse is moved
}

// Change the size of images by pressing the < and > keys
void keyPressed() {
    if (key == '>') {  
        lightSize = lightSize * 1.1;
    }
    if (key == '<') { 
        lightSize = lightSize / 1.1;
    }
     
    loop();  // Switches the draw() loop on to apply the size changes 
}

/*
REFERENCES: 
Plane image by icons8, https://icons8.com/icons/set/plane/emoji
Bus image by icons8, https://icons8.com/icon/set/bus/emoji
Walking image by icons8, https://icons8.com/icon/set/walking/emoji
Train image by icons8, https://icons8.com/icon/set/train/emoji
Car image by icons8, https://icons8.com/icon/set/car/emoji
Boat image by icons8, https://icons8.com/icons/set/boat-emoji

How I learnt how to draw an image:
https://processing.org/reference/

Whole structure (with adjustments such as image code) is from Creative Coding 2024/5 Data:Core, 
https://moodle4.city.ac.uk/mod/page/view.php?id=821077

Code for images influenced by Creative Coding 2024/5 Images:Core,
https://moodle4.city.ac.uk/mod/page/view.php?id=819308
*/
