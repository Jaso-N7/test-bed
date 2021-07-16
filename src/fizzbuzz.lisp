;;;;

(in-package :test-bed)

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
Otherwise returns NUM as a string."
  (let ((fizzy (= 0 (funcall mod3 num)))
	(buzzy (= 0 (funcall mod5 num))))
    (cond ((and fizzy buzzy)
	   "FizzBuzz")
	  (fizzy "Fizz")
	  (buzzy "Buzz")
	  (t  (format nil "~A" num)))))

(defun fizzer (num)
  "Checks the number NUM. If it is a MOD of either 3 or 5, returns 'Fizz'
or 'Buzz' respectively. If MOD by both 3 and 5, return 'FizzBuzz'.
Otherwise returns NUM as a string."
  (let ((fizzy (= 0 (funcall mod3 num)))
	(buzzy (= 0 (funcall mod5 num))))
    (if fizzy
	"Fizz"
	(format nil "~A" num))))

(defun fizzbuzz (lst)
  "Consumes a range of numbers in LST, but for multiples of three (3), print 'Fizz'
instead of the number and for the multiples of five(5) print 'Buzz'"
  ;;  (mapcar #'fizzbuzzer lst))
  (mapcar #'fizzer lst))

	      
      
