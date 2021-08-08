;;;; Properties for testing BIGGEST

(in-package :test-bed/tests)

;;; PROPERTIES

(defun check-biggest ()
  "Properties for testing BIGGEST."
  (quickcheck

    ;; Modelling / Oracle
    (named "finds biggest element"
      (for-all ((x (a-list an-integer)))
	(is= (test-bed:biggest x)
	     (model-biggest x))))

    (named "picks the last number"
      (for-all ((lis (a-list an-integer))
		(known-num an-integer))
	(let* ((known-last (list known-num))
	       (known-list (append lis known-last)))
	  (is equal known-last (last known-list)))))

    (named "a sorted list has ordered pairs"
      (for-all ((lis (a-list an-integer)))
	(let ((fn (random-choice (function <)
				 (function >))))
	  (test (ordered (sort lis fn) :test fn)))))

    (named "a sorted list keeps its size, regardless of ordering."
      (for-all ((l (a-list an-integer)))
	(let ((fn (random-choice (function <)
				 (function >))))
	(is= (length l) (length (sort l fn))))))

    (named "no element added"
      (for-all ((l (a-list an-integer)))
	(let ((sorted (sort l #'<)))
	  (mapc #'(lambda (item)
		    (is member item l))
		sorted))))

    (named "no element deleted"
      (for-all ((l (a-list an-integer)))
	(let ((sorted (sort l #'<)))
	  (mapc #'(lambda (item)
		    (is member item sorted))
		l))))


    ))

;;; HELPERS / MODELS

(defun model-biggest (lis)
  (car (last (sort lis #'<))))

(defun ordered (lis &key (test #'<))
  "Checks if each pair of a list are ordered according to the ordering function TEST.
Defaults to an ascending ordering."
  (check-type lis list " >> Only accepts LISTS. ")
  (check-type test function " >> :TEST supplied MUST be either #'> or #'<.")

  (cond ((< (length lis) 2)
	 T)
        ((eq #'< test)
	 (and (<= (car lis) (cadr lis))
	      (ordered (cdr lis))))
	((eq #'> test)
	 (and (>= (car lis) (cadr lis))
	      (ordered (cdr lis) :test test)))))


(defmacro random-choice (&rest exprs)
  "Courtesy of Paul Graham's ANSI CL Macros pg 170."
  `(case (random, (length exprs))
     ,@(let ((key -1))
	 (mapcar #'(lambda (expr)
		     `(,(incf key) ,expr))
		 exprs))))
