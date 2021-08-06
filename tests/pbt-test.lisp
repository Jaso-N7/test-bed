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

    ))

;;; HELPERS / MODELS

(defun model-biggest (lis)
  (car (last (sort lis #'<))))
