//: [Previous](@previous) / [Next](@next)
/*:
## Canvas size
 
 Set the size of your desired canvas by adjusting the constants on lines 19 and 20.
 */
let preferredWidth = 600
let preferredHeight = 600
/*:
 ## Required code
 
 Lines 28 to 36 are required to make the playground run.
 
 Please do not remove.
 */
import Cocoa
import PlaygroundSupport
import CanvasGraphics

// Create canvas
let canvas = Canvas(width: preferredWidth, height: preferredHeight)

// Create a turtle that will draw upon the canvas
let turtle = Tortoise(drawingUpon: canvas)

// Show the canvas in the playground's live view
PlaygroundPage.current.liveView = canvas
/*:
 ## Add your code
 
 Beginning on line 48, write a meaningful comment.
 
 You can remove the code on line 49 and begin writing your own code.
 
 [Documentation](http://russellgordon.ca/CanvasGraphics/Documentation/) is available.

 */
canvas.highPerformance = true

//Draw a boundary for the tesselation
//canvas.defaultBorderWidth = 5
//canvas.drawShapesWithFill = false
//canvas.drawShapesWithBorders = true
//canvas.borderColor = Color(hue: 0, saturation: 25, brightness: 0, alpha: 25)
//canvas.drawRectangle(at: Point(x:25, y:75), width: 500, height: 500)

let sideLength = 25
let startPointx = 100
let startPointy = 100
var lengthOfPattern = Int(round(Double(3).squareRoot()*Double(sideLength)+Double(2*sideLength)))
var numberPerRow = ((canvas.width - startPointy) / lengthOfPattern)
var numberOfRows = ((canvas.width - startPointy) / lengthOfPattern)

//MARK: Functions
//draw one pattern
func turtleToStartPoint(){
    turtle.penUp()
    turtle.goToHome()
    turtle.forward(steps: startPointx)
    turtle.left(by: 90)
    turtle.forward(steps: startPointx)
    turtle.right(by: 90)
    turtle.penDown()
}
func drawSquare(){
    turtle.penDown()
    turtle.forward(steps: sideLength)
    turtle.right(by: 90)
    turtle.forward(steps: sideLength)
    turtle.right(by: 90)
    turtle.forward(steps: sideLength)
    turtle.right(by: 90)
    turtle.forward(steps: sideLength)
}
func drawTriangle(){
    turtle.penDown()
    turtle.right(by: 90)
    turtle.forward(steps: sideLength)
    turtle.right(by: 90)
    turtle.forward(steps: sideLength)
    turtle.left(by: 120)
    turtle.forward(steps: sideLength)
    turtle.left(by: 120)
    turtle.forward(steps: sideLength)
}
func drawPattern(){
    turtle.setPenColor(to: Color.black)
    for _ in 1...6{
        drawSquare()
        drawTriangle()
        turtle.right(by: 90)
    }
}
//move to draw the next one
func switchLine(){
    turtle.penUp()
    turtle.left(by: 90)
    turtle.forward(steps: lengthOfPattern)
    turtle.right(by: 90)
    turtle.backward(steps: lengthOfPattern * numberPerRow)
    turtle.penDown()
}
func forwardOne(){
    turtle.penUp()
    turtle.forward(steps: lengthOfPattern)
    turtle.penDown()
}
//redraw inner and outer edge in different colors
func drawHexagon(){
    turtle.setPenColor(to: Color.green)
    for _ in 1...6{
        turtle.forward(steps: sideLength)
        turtle.left(by: 60)
    }
}
func drawDodecagon(){
    turtle.setPenColor(to: Color.red)
    for _ in 1...12{
        turtle.forward(steps: sideLength)
        turtle.left(by: 30)
    }
}
func changeShape(){
    turtle.penUp()
    turtle.right(by: 90)
    turtle.forward(steps: sideLength)
    turtle.left(by: 90)
    turtle.penDown()
    drawDodecagon()
    turtle.penUp()
    turtle.left(by: 90)
    turtle.forward(steps: sideLength)
    turtle.right(by: 90)
    turtle.penDown()
}
//draw test lines
func drawTestLines(line: Int){
    turtle.penUp()
    turtle.goToHome()
    turtle.left(by: 90)
    turtle.forward(steps: 10)
    turtle.right(by: 90)
    turtle.penDown()
    if line == 1{
        turtle.setPenColor(to: Color.green)
        turtle.forward(steps: 200)
        turtle.penUp()
    } else if line == 2{
        turtle.penUp()
        turtle.left(by: 90)
        turtle.forward(steps: 10)
        turtle.right(by: 90)
        turtle.penDown()
        turtle.setPenColor(to: Color.red)
        turtle.forward(steps: 200)
        turtle.penUp()
    }
}

//MARK: starts drawing
turtleToStartPoint()
//draw the pattern in black
for _ in 1...numberOfRows{
    for _ in 1...numberPerRow{
        drawPattern()
        forwardOne()
    }
    switchLine()
}
drawTestLines(line: 1)
turtleToStartPoint()

//draw the hexagon (inner edge) in green
for _ in 1...numberOfRows{
    for _ in 1...numberPerRow{
        drawHexagon()
        forwardOne()
    }
    switchLine()
}
drawTestLines(line: 2)
turtleToStartPoint()

//draw the dodecagon (outer edge) in red
for _ in 1...numberOfRows{
    for _ in 1...numberPerRow{
        changeShape()
        forwardOne()
    }
    switchLine()
}

canvas.highPerformance = false
turtle.copySVGToClipboard()
/*:
 ## Show the Live View
 Don't see any results?
 
 Remember to show the Live View (1 then 2):
 
 ![timeline](timeline.png "Timeline")

 ## Use source control
 To keep your work organized, receive feedback, and earn a high grade in this course, regular use of source control is a must.
 
 Please commit and push your work often.
 
 ![source_control](source-control.png "Source Control")
 */
