import Foundation

/*
The setup() function is called once when the app launches. Without it, your app won't compile.
Use it to set up and start your app.

You can create as many other functions as you want, and declare variables and constants,
at the top level of the file (outside any function). You can't write any other kind of code,
for example if statements and for loops, at the top level; they have to be written inside
of a function.
*/

let ball = OvalShape(width: 50, height: 50)
let barrierHeight = 25.0
let barrierWidth = 300.0

let barrierPoints = [
    Point(x: 0, y: 0),
    Point(x: 0, y: barrierHeight),
    Point(x: barrierWidth, y: barrierHeight),
    Point(x: barrierWidth, y: 0)
]

let funnelPoints = [
    Point(x: 0, y: 50),
    Point(x: 80, y: 50),
    Point(x: 60, y: 0),
    Point(x: 20, y: 0)
]

let targetPoints = [
    Point(x: 10, y: 0),
    Point(x: 0, y: 10),
    Point(x: 10, y: 20),
    Point(x: 20, y: 10)
]



let barrier = PolygonShape(points: barrierPoints)
let funnel = PolygonShape(points: funnelPoints)
let target = PolygonShape(points: targetPoints)

fileprivate func barrierSetup() {
    barrier.position = Point(x: 200, y: 150)
    scene.add(barrier)
    barrier.hasPhysics = true
    barrier.isImmobile = true
    barrier.angle = -2.5
}


fileprivate func ballSetup() {
    ball.position = Point(x: 200, y: scene.height - 30)
    scene.add(ball)
    ball.hasPhysics = true
    ball.fillColor = .cyan
    ball.onCollision = ballCollided
    ball.isDraggable = false
    scene.trackShape(ball)
    ball.onExitedScene = ballExitedScreen
    ball.onTapped = resetGame
    ball.bounciness = 1.0
    
}

func ballCollided(with otherShape: Shape) {
    if otherShape.name != "target" { return }
    otherShape.fillColor = .black
}

fileprivate func funnelSetup() {
    funnel.position = Point(x:200, y: scene.height - 25)
    scene.add(funnel)
    funnel.onTapped = dropBall
    funnel.isDraggable = false
}

func targetSetup() {
    target.position = Point(x: 100, y: 400)
    target.hasPhysics = true
    target.isImmobile = true
    target.isImpermeable = true
    target.fillColor = .green
    scene.add(target)
    target.name = "target"
    target.isDraggable = false
}

func setup() {
    ballSetup()
    barrierSetup()
    funnelSetup()
    targetSetup()
    resetGame()
}

func dropBall() {
    ball.position = funnel.position
    ball.stopAllMotion()
    target.fillColor = .green
    barrier.isDraggable = false
}

func ballExitedScreen() {
    barrier.isDraggable = true
    
}

func resetGame() {
    ball.position = Point(x: 0, y: -80)
}
