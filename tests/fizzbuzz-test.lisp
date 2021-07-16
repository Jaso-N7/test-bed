
(in-package :test-bed/tests)

;; NOTE: To run this test file, execute `(asdf:test-system :test-bed)' in your Lisp.

(defun check-fizzbuzz ()
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

;;; IDEMPOTENCE
    ;; Updating something to a given value
    ;; Deleting a given object
    ;; reading a given object / field


;;; INVARIANCE
    ;; Mutable systems, where precise assertions are hard.
    ;; For all sequences of valid operations on a DB, the DB should never be corrupt.


;;; METAMORPHIC RELATION
    ;; Is there a couple of transformations such that applying one before the
    ;; SUT and the other after doesn't change the outcome?
    ;; Use cases:-
    ;; Searches - for example, should results be different for a different sort order?

    (named "Stability on FizzBuzz"
      (for-all (m) 
	;; For any number positive I, the invers -I, should return the same result
	(only-if (member "Fizz" (fizzbuzz (list m)) :test #'string=)
		 (test (member "Fizz" (fizzbuzz (list (- m)))
			       :test #'string=))))
      (for-all (n)
	(only-if (member "Buzz" (fizzbuzz (list n)) :test #'string=)
		 (test (member "Buzz" (fizzbuzz (list (- n)))
			       :test #'string=)))))

		   
	   
    
    ))
