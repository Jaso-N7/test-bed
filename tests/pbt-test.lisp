;;;; Properties for testing BIGGEST

(in-package :test-bed/tests)

;;; PROPERTIES

(defun check-biggest ()
  "Properties for testing BIGGEST."
  (quickcheck

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

    ))

;;; HELPERS / MODELS

(defun model-biggest (lis)
  (car (last (sort lis #'<))))
