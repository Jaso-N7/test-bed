
(in-package :test-bed/tests)

(defun run-units ()

  (named "BIGGEST: Unit Test"
    (is= 5 (biggest '(1 2 3 4 5)))
    (is= 8 (biggest '(3 8 7 -1)))
    (is= -5 (biggest '(-10 -5 -901)))
    (is= 0 (biggest '(0))))

  )
