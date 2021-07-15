(defpackage fizzbuzz/tests
  (:use :cl
        :fizzbuzz
        :cl-quickcheck)
  (:export :check!)
  (:documentation "Property-Based Tests."))
(in-package :fizzbuzz/tests)

;; NOTE: To run this test file, execute `(asdf:test-system :fizzbuzz)' in your Lisp.

(defun check! ()
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

;;; INVERTIBILITY
;; Example: (a + b) - b = a
;; Encoder / Decorder pairs
;; Persistence: Creation should have deletion as an inverse
    (named "Partial Invertible FizzBuzz"
      (for-all ((i an-integer))
	(let ((fizzy (= (mod i 3) 0))
	      (buzzy (= (mod i 5) 0))
	      (fizzless (car (fizzbuzz (list i)))))
	(test (or fizzy buzzy
		  (= i (parse-integer fizzless)))))))

    ))
