;;;; Sample application used for testing properties
;;;; Reference Property-Based Testing with PropER, Erlang, and Exlixir by Fred Hebert
;;;; Chapter 2.

(in-package :test-bed)

(defun biggest (lis)
  "Finds the largest element in a list."
  (cond ((endp lis)
	 nil)
	((= 1 (length lis))
	 (car lis))
	(t 
	 (find-biggest (cdr lis) (car lis)))))

(defun find-biggest (tail head)
  "Auxiliary function to biggest"
  (cond ((endp tail)
	 head)
	((> (car tail) head)
	 (find-biggest (cdr tail) (car tail)))
	(t
	 (find-biggest (cdr tail) head))))
	
