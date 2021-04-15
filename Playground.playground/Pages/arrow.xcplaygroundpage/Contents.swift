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

//Move the turtle to the centre of the canvas
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

//Draw an arrow
func drawArrow(number: Int){
    //Begin drawing an arrow
    let squareSize = 10
    for i in 1...number{
        turtle.penUp()
        turtle.forward(steps: 8 * squareSize)
        turtle.penDown()
        turtle.forward(steps: 5 * squareSize)
        turtle.right(by: 90)
        turtle.forward(steps: 2 * squareSize)
        turtle.left(by: 135)
        turtle.forward(steps: Int(3.0 * Double(squareSize) * Double(2.0).squareRoot()))
        turtle.left(by: 90)
        turtle.forward(steps: Int(3.0 * Double(squareSize) * Double(2.0).squareRoot()))
        turtle.left(by: 135)
        turtle.forward(steps: 2 * squareSize)
        turtle.right(by: 90)
        turtle.forward(steps: 5 * squareSize)
        turtle.left(by: 90)
        turtle.forward(steps: 2 * squareSize)
        turtle.left(by: 90)
    }
}

turtleToMiddleOfCanvas()
drawArrow(number: 3)
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
