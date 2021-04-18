import UIKit

var a: Double = 1
var b: Double = 4
var c: Double = 3
var D: Double?
var x1: Double?
var x2: Double?
D = Double(pow(b, 2) - (4 * a * c))
print(D!)
x1 = ((-b + sqrt(D!))/2*a);
x2 = ((-b - sqrt(D!))/2*a);
print(x1!,x2!)


var AB: Double = 3
var BC: Double = 4
var AC: Double = 0
var p: Double?
var s: Double?

AC = (sqrt(pow(Double(AB), 2) + pow(Double(BC), 2)))
print(AC)

p = AB + BC + AC
print(p!)

s = (AB * BC)/2
print(s!)

var sum: Double = 100000
var proc: Double = 10
var years: Double = 5
var finalSum: Double?

finalSum = (sum * proc * years)/100 + sum

print(finalSum!)



