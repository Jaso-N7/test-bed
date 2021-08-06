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
	(is ordered (sort lis #'<))))

    ))

;;; HELPERS / MODELS

(defun model-biggest (lis)
  (car (last (sort lis #'<))))

(defun ordered (lis)
  (if (< (length lis) 2)
      T
      (and (<= (car lis) (cadr lis))
	   (ordered (cdr lis)))))
