# HandBall

I want to learn about handling physics in Swift, so here goes.

## Notes

I've got two bodies that I can apply impulses to and a body around the view to
keep everything in place.  I want to learn how to drag a body around now, so I
can use it knock into the others.

According to this,
https://www.raywenderlich.com/2598-how-to-create-a-breakout-game-using-spritekit,
the way to do this is to:

1. Update a state value when a touch is made on the paddle.
2. Add code in the `touchesMoved` hook to reposition the paddle if needed.
