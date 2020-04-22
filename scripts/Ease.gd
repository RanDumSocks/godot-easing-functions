extends Node
# Credit to easings.net for easing formulas
# Created by RanDumSocks

# Sine
func easeInSine(x: float, offset: float=0, length: float=1) -> float:
   x -= offset
   x /= length
   return (0.0 if x < 0 else (1.0 if x > 1.0 else 1.0 - cos((x * PI) / 2.0)))

func easeOutSine(x: float, offset: float=0, length: float=1) -> float:
   x -= offset
   x /= length
   return (0.0 if x < 0 else (1.0 if x > 1.0 else sin((x * PI) / 2.0)))
   
func easeInOutSine(x: float, offset: float=0, length: float=1) -> float:
   x -= offset
   x /= length
   return (0.0 if x < 0 else (1.0 if x > 1.0 else -(cos(PI * x) - 1.0) / 2.0))
   
# Quad
func easeInQuad(x: float, offset: float=0, length: float=1) -> float:
   x -= offset
   x /= length
   return (0.0 if x < 0 else (1.0 if x > 1.0 else x * x))

func easeOutQuad(x: float, offset: float=0, length: float=1) -> float:
   x -= offset
   x /= length
   return (0.0 if x < 0 else (1.0 if x > 1.0 else 1.0 - (1.0 - x) * (1.0 - x)))
   
func easeInOutQuad(x: float, offset: float=0, length: float=1) -> float:
   x -= offset
   x /= length
   return (0.0 if x < 0 else (1.0 if x > 1.0 else (2.0 * x * x if x < 0.5 else 1 - pow(-2 * x + 2, 2) / 2.0)))
   
# Poly
func easeInPoly(x: float, offset: float=0, length: float=1, poly: float=2) -> float:
   x -= offset
   x /= length
   return (0.0 if x < 0 else (1.0 if x > 1.0 else pow(x, poly)))

func easeOutPoly(x: float, offset: float=0, length: float=1, poly: float=2) -> float:
   x -= offset
   x /= length
   return (0.0 if x < 0 else (1.0 if x > 1.0 else 1.0 - pow(1.0 - x, poly)))
   
func easeInOutPoly(x: float, offset: float=0, length: float=1, poly: float=2) -> float:
   x -= offset
   x /= length
   return (0.0 if x < 0 else (1.0 if x > 1.0 else (pow(2.0, poly - 1) * pow(x, poly) if x < 0.5 else 1 - pow(-2.0 * x + 2, poly) / 2.0)))

# Expo
func easeInExpo(x: float, offset: float=0, length: float=1) -> float:
   x -= offset
   x /= length
   return (0.0 if x < 0 else (1.0 if x > 1.0 else pow(2.0, 10 * x - 10)))

func easeOutExpo(x: float, offset: float=0, length: float=1) -> float:
   x -= offset
   x /= length
   return (0.0 if x < 0 else (1.0 if x > 1.0 else 1.0 - pow(2.0, -10 * x)))
   
func easeInOutExpo(x: float, offset: float=0, length: float=1) -> float:
   x -= offset
   x /= length
   return (0.0 if x < 0 else (1.0 if x > 1.0 else (pow(2.0, 20 * x - 10) / 2 if x < 0.5 else (2.0 - pow(2.0, -20 * x + 10)) / 2.0)))
   
# Circ
func easeInCirc(x: float, offset: float=0, length: float=1) -> float:
   x -= offset
   x /= length
   return (0.0 if x < 0 else (1.0 if x > 1.0 else 1.0 - sqrt(1.0 - pow(x, 2))))

func easeOutCirc(x: float, offset: float=0, length: float=1) -> float:
   x -= offset
   x /= length
   return (0.0 if x < 0 else (1.0 if x > 1.0 else sqrt(1.0 - pow(x - 1.0, 2))))
   
func easeInOutCirc(x: float, offset: float=0, length: float=1) -> float:
   x -= offset
   x /= length
   return (0.0 if x < 0 else (1.0 if x > 1.0 else ((1.0 - sqrt(1.0 - pow(2 * x, 2))) / 2.0 if x < 0.5 else (sqrt(1.0 - pow(-2.0 * x + 2, 2)) + 1.0) / 2.0)))
   
# Back
func easeInBack(x: float, offset: float=0, length: float=1) -> float:
   x -= offset
   x /= length
   var c1 = 1.70158
   var c3 = c1 + 1.0
   return (0.0 if x < 0 else (1.0 if x > 1.0 else c3 * x * x * x - c1 * x * x))

func easeOutBack(x: float, offset: float=0, length: float=1) -> float:
   x -= offset
   x /= length
   var c1 = 1.70158
   var c3 = c1 + 1.0
   return (0.0 if x < 0 else (1.0 if x > 1.0 else 1.0 + c3 * pow(x - 1.0, 3) + c1 * pow(x - 1.0, 2)))
   
func easeInOutBack(x: float, offset: float=0, length: float=1) -> float:
   x -= offset
   x /= length
   var c1 = 1.70158
   var c2 = c1 * 1.525
   return (0.0 if x < 0 else (1.0 if x > 1.0 else ((pow(2 * x, 2) * ((c2 + 1) * 2 * x - c2)) / 2 if x < 0.5 else (pow(2 * x - 2, 2) * ((c2 + 1) * (x * 2 - 2) + c2) + 2) / 2)))

# Elastic
func easeInElastic(x: float, offset: float=0, length: float=1, wobble: float=10) -> float:
   var x_trans = x - offset - length
   var x_new = 0.0 if x_trans > 0.0 else abs(x_trans)
   var ease_inv = easeOutElastic(x_new, 0.0, length, wobble)
   return -ease_inv + 1.0

func easeOutElastic(x: float, offset: float=0, length: float=1, wobble: float=10) -> float:
   x -= offset
   var length_trans = 10 / length
   var c4 = (2 * PI) / 3
   return (0.0 if x < 0 else (1.0 if x > length else pow(2, -length_trans * x) * sin((x * wobble - 0.75) * c4) + 1))

func easeInOutElastic(x: float, offset: float=0, length: float=1) -> float:
   x -= offset
   x /= length
   var c5 = (2 * PI) / 4.5
   return (0.0 if x < 0 else (1.0 if x > 1.0 else (-(pow(2, 20 * x - 10) * sin((20 * x - 11.125) * c5)) / 2 if x < 0.5 else (pow(2, -20 * x + 10) * sin((20 * x - 11.125) * c5)) / 2 + 1)))

# Bounce
func easeInBounce(x: float, offset: float=0, length: float=1) -> float:
   var x_trans = x - offset - length
   var x_new = 0.0 if x_trans > 0.0 else abs(x_trans)
   var ease_inv = easeOutBounce(x_new, 0.0, length)
   return -ease_inv + 1.0

func easeOutBounce(x: float, offset: float=0, length: float=1) -> float:
   x -= offset
   x /= length
   var n1 := 7.5625
   var d1 := 2.75
   if x < 1.0 / d1:
      return n1 * x * x
   elif x < 2.0 / d1:
      x -= 1.5 / d1
      return n1 * (x) * x + 0.75
   elif x < 2.5 / d1:
      x -= 2.25 / d1
      return n1 * (x) * x + 0.9375
   else:
      if x > 1.0:
         return 1.0
      x -= 2.625 / d1
      return n1 * (x) * x + 0.984375
      
func easeInOutBounce(x: float, offset: float=0, length: float=1) -> float:
   x -= offset
   x /= length
   return easeInBounce(x * 2, 0.0, 1.0) / 2.0  if x < 0.5 else (easeOutBounce((x - 0.5) * 2, 0.0, 1.0) / 2.0) + 0.5
