extends Node

func easeOutElastic(x: float, offset:float=0, length: float=1, wobble: float=10) -> float:
   x -= offset
   var length_trans = 10 / length
   var c4 = (2 * PI) / 3
   return (0.0 if x < 0 else (1.0 if x > length else pow(2, -length_trans * x) * sin((x * wobble - 0.75) * c4) + 1))

"""
function easeOutElastic(x: number): number {
const c4 = (2 * Math.PI) / 3;

return x === 0
  ? 0
  : x === 1
  ? 1
  : pow(2, -10 * x) * sin((x * 10 - 0.75) * c4) + 1;
}"""
