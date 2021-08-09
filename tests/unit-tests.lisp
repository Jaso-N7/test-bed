
(in-package :test-bed/tests)

(defun run-units ()
  "Unit Tests - Example Based Testing."
  (named "BIGGEST: Unit Test"
    (is= 5 (biggest '(1 2 3 4 5)))
    (is= 8 (biggest '(3 8 7 -1)))
    (is= -5 (biggest '(-10 -5 -901)))
    (is= 0 (biggest '(0))))

  (named "LAST: Unit Test for picking the last number"
    (is= -23 (car (last '(-23))))
    (is= 5 (car (last '(1 2 3 4 5))))
    (is= 3 (car (last '(5 4 3)))))

  )
