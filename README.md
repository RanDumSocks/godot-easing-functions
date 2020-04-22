# godot-easing-functions
Easing function script for Godot

Head over to [releases](https://github.com/RanDumSocks/godot-easing-functions/releases/latest) for download.

## Example project
This repo includes an entire sample project, which is basically just this:
![easingTest](https://user-images.githubusercontent.com/23219465/80032261-c51e8680-849f-11ea-8ada-07ac9f3e4629.gif)
There is a settings script in `res://scripts/Settings.gd` which you can use to modify how the easing functions are calculated.

||Sine|Quad|Poly|Expo|Circ|Back|Elastic|Bounce|
|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|
|In|`easeInSine`|`easeInQuad`|`easeInPoly`|`easeInExpo`|`easeInCirc`|`easeInBack`|`easeInElastic`|`easeInBounce`|
|Out|`easeOutSine`|`easeOutQuad`|`easeOutPoly`|`easeOutExpo`|`easeOutCirc`|`easeOutBack`|`easeOutElastic`|`easeOutBounce`|
|InOut|`easeInOutSine`|`easeInOutQuad`|`easeInOutPoly`|`easeInOutExpo`|`easeInOutCirc`|`easeInOutBack`|`easeInOutElastic`|`easeInOutBounce`|

## Adding to your project
Download and add `Ease.gd` somewhere in your project and AutoLoad it by going to Project > Project Settings > AutoLoad. Select the `Ease.gd` file in your project, click add, and you are ready to go! Just call the functions using `Ease.<function_name>` from anywhere in your project.

## Using the easing functions
There are 8 easing functions, each with 3 variants making a total of 24:
* Sine
* Quad
* Poly
* Expo
* Circ
* Back
* Elastic
* Bounce

All of which are taken from [https://easings.net/](easings.net).

---
Every function is in the form of:
```gdscript
easeModName(x: float, offset: float=0, length: float=0)
```
where `Mod` is either `In`, `Out`, or `InOut` with the function names listed above.
* `x` takes on a range `0 < x < length` and determines your position within the easing function.
* `offset` is just subtracted off the `x` value.
* `length` is how long you want the easing to be, which adjusts the range of `x`.

There are a few exceptions:
* `ease<mod>Poly` takes in a last optional parameter, `poly: float=2`, which determines the polynomial.
* `easeInElastic` and `easeOutElastic` also has a last optional parameter, `wobble: float=10`, which adjusts how violently the easing wobbles. If set to 1, there is no wobble.
