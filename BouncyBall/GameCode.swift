import Foundation

/*
The setup() function is called once when the app launches. Without it, your app won't compile.
Use it to set up and start your app.

You can create as many other functions as you want, and declare variables and constants,
at the top level of the file (outside any function). You can't write any other kind of code,
for example if statements and for loops, at the top level; they have to be written inside
of a function.
*/

let circle = OvalShape(width: 150, height: 150)
let barrierHeight = 25.0
let barrierWidth = 300.0

let barrierPoints = [
    Point(x: 0, y: 0),
    Point(x: 0, y: barrierHeight),
    Point(x: barrierWidth, y: barrierHeight),
    Point(x: barrierWidth, y: 0)
]

let barrier = PolygonShape(points: barrierPoints)

func setup() {
    circle.position = Point(x: 250, y: 400)
    barrier.position = Point(x: 200, y: 150)

    circle.hasPhysics = true
    barrier.hasPhysics = true
    
    scene.add(circle)
    scene.add(barrier)
}
