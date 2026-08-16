# Layout-Safe Motion

## Do Not Shift Layout To Animate

- Animate `transform` and `opacity`. Everything else touches layout or paint and drags the rest of the screen with it.
- Expanding regions are the exception worth naming: animate `grid-template-rows` from `0fr` to `1fr` with the child set to `overflow: hidden`. It is a layout animation, so keep it scoped to a small subtree and off screens rendering hundreds of rows.
- An element that animates while entering must already have its space reserved. Motion into unreserved space is layout shift with easing on top.
- Add `will-change` immediately before a transition and drop it after. Left on, it pins compositor layers and costs memory across a whole screen.

## Reduced Motion Is A Gate, Not A Polish Item

Honor `prefers-reduced-motion` at app scale: route transitions become instant swaps, list entrances become plain renders, skeleton crossfades stay (opacity is safe), parallax and autoplay stop entirely. Gate JS-driven motion on the same query rather than shipping a shorter version of the same movement.
