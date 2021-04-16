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

let squareSize = 20
//Draw an arrow
func drawArrow(number: Int){
    //Begin drawing an arrow
    for _ in 1...number{
        turtle.penDown()
        turtle.forward(steps: 5 * squareSize)
        turtle.right(by: 90)
        turtle.forward(steps: 1 * squareSize)
        turtle.left(by: 135)
        turtle.forward(steps: Int(round(2.0 * Double(2).squareRoot() * Double(squareSize))))
        turtle.left(by: 90)
        turtle.forward(steps: Int(round(2.0 * Double(2).squareRoot() * Double(squareSize))))
        turtle.left(by: 135)
        turtle.forward(steps: 1 * squareSize)
        turtle.right(by: 90)
        turtle.forward(steps: 5 * squareSize)
        turtle.left(by: 90)
        turtle.forward(steps: 2 * squareSize)
        turtle.left(by: 90)
        turtle.penUp()
        turtle.forward(steps: 7 * squareSize)
    }
}

//turtleToMiddleOfCanvas()
var numberPerRow = (canvas.width / squareSize / 7) + 1
var numberOfRows = (canvas.height / squareSize / 4) + 1

//Switch line
func anotherRow(){
    turtle.penUp()
    turtle.backward(steps: numberPerRow * 7 * squareSize)
    turtle.left(by: 90)
    turtle.forward(steps: 4 * squareSize)
    turtle.right(by: 90)

}
for _ in 1...numberOfRows{
    drawArrow(number: numberPerRow)
    anotherRow()
}

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
