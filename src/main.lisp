(defpackage fizzbuzz
  (:use :cl)
  (:export :fizzbuzz))

(in-package :fizzbuzz)

;;; DATA

(defun modn (n)
  "Template for creating modular of any divisor."
  #'(lambda (i)
      (mod i n)))

(defparameter mod3 (modn 3)
  "")

(defparameter mod5 (modn 5)
  "")


;;; FUNCTIONS

(defun fizzbuzzer (num)
  "Checks the number NUM. If it is a MOD of either 3 or 5, returns 'Fizz'
or 'Buzz' respectively. If MOD by both 3 and 5, return 'FizzBuzz'.
Otherwise returns NUM unchanged."
  (let ((fizzy (= 0 (funcall mod3 num)))
	(buzzy (= 0 (funcall mod5 num))))
    (cond ((and fizzy buzzy)
	   "FizzBuzz")
	  (fizzy "Fizz")
	  (buzzy "Buzz")
	  (t  num))))

(defun fizzbuzz (lst)
  "Consumes a range of numbers in LST, but for multiples of three (3), print 'Fizz'
instead of the number and for the multiples of five(5) print 'Buzz'
EXAMPLE:
CL-USER> (fizzbuzz:fizzbuzz '(0 1 2 3 4 5 6 7 8 9))
(\"FizzBuzz\" 1 2 \"Fizz\" 4 \"Buzz\" \"Fizz\" 7 8 \"Fizz\")
CL-USER> 
CL-USER> (fizzbuzz:fizzbuzz '(-3 -2 -1 0 1 2 3))
(\"Fizz\" -2 -1 \"FizzBuzz\" 1 2 \"Fizz\")"
    (mapcar #'fizzbuzzer lst))
	      
      
