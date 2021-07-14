(defpackage fizzbuzz/tests
  (:use :cl
        :fizzbuzz
        :cl-quickcheck)
  (:export :run!)
  (:documentation "Property-Based Tests."))
(in-package :fizzbuzz/tests)

;; NOTE: To run this test file, execute `(asdf:test-system :fizzbuzz)' in your Lisp.

(defun run! ()
  "Run ALL tests."
  ;; May do a seperate one for Example Based / Unit Tests
  ; (run-units)
  (run-pbts))

(defun run-pbts ()
  "All property based tests to be run."
  (quickcheck
;;;**** Strategies for identifying properties ****

;;; TEST ORACLE
;; SUT Regression, legacy code or unoptimized code that is already working

;;; VALIDITY
;; Output is valid (but not necessarily correct)?
;; Sanity check against simple mistakes
;; Remember that errors are valid outputs too!
    (named "Valid FizzBuzz"
      (for-all ((i an-integer))
	(let ((seq  (list (format nil "~A" i) "Fizz" "Buzz" "FizzBuzz"))
	      (item (car (fizzbuzz (list i)))))
	  (test (find item seq :test #'string=)))))

    ))
