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

let sideLength = 25
var lengthOfPattern = Int(round(Double(3).squareRoot()*Double(sideLength)+Double(2*sideLength)))
var numberPerRow = (canvas.width / lengthOfPattern) + 1
var numberOfRows = (canvas.height / lengthOfPattern) + 1

func turtleToMiddleOfCanvas(){
    turtle.penUp()
    turtle.forward(steps: canvas.width / 2)
    turtle.currentHeading()
    turtle.left(by: 90)
    turtle.currentHeading()
    turtle.penUp()
    turtle.forward(steps: canvas.height / 2)
    turtle.right(by: 90)
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
func repeatedPattern(){
    for _ in 1...6{
        drawSquare()
        drawTriangle()
        turtle.right(by: 90)
    }
}
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

//MARK: draw patterns in black
for _ in 1...numberOfRows{
    for _ in 1...numberPerRow{
        repeatedPattern()
        forwardOne()
    }
    switchLine()
}


canvas.highPerformance = false
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
