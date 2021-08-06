
(in-package :test-bed/tests)

(defun check! ()
  "Run ALL tests."
  (run-units)
  (check-fizzbuzz)
  (check-biggest))
