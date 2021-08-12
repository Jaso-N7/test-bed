;;;; Properties & Helper functions for testing BIGGEST [pbt.lisp]

(in-package :test-bed/tests)



;;; PROPERTIES

(defun check-biggest ()
  "Properties for testing BIGGEST."

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
	  (is ordered (sort (copy-list lis) fn) :test fn))))

    (named "a sorted list keeps its size, regardless of ordering."
      (for-all ((l (a-list an-integer)))
	(let ((fn (random-choice (function <)
				 (function >))))
	  (is= (length l) (length (sort (copy-list l) fn))))))

    (named "no element added."
      (for-all ((l (a-list an-integer)))
	(let ((sorted (sort (copy-list l) #'<)))
	  (mapc #'(lambda (element)
		    (is member element l))
		sorted))))

    (named "no element deleted"
      (for-all ((l (a-list an-integer)))
	(let ((sorted (sort (copy-list l) #'<)))
	  (mapc #'(lambda (item)
		    (is member item sorted))
		l))))

    #|
    (named "symmetric endcoding/decoding"
      (for-all ((lats (a-list
|#
    )

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



(defun ncode (term)
  "Model Encoder."
  (declare (ignore term))
  (error "Not yet implemented"))

(defun dcode (term)
  "Model Decoder."
  (declare (ignore term))
  (error "Not yet implemented."))
