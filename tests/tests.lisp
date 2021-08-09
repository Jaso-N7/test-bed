
(in-package :test-bed/tests)

(defparameter *skipped*
  (vector #'check-fizzbuzz)
  "Do not run these tests.")

(defparameter *suite*
  (vector #'run-units
	  #'check-fizzbuzz
	  #'check-biggest)
  "Test Suite. Holds the names of all the tests to be run.")

(defun check! ()
  "Run ALL tests."
  (dotimes (index (length *suite*))
    (let ((test-name (svref *suite* index)))
      (unless (find test-name *skipped*)
	(funcall test-name)))))
