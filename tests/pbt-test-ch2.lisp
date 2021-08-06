;;;; Properties for testing BIGGEST

(in-package :test-bed/tests)

(defun check-biggest ()
  "Properties for testing BIGGEST."
  (quickcheck

    (named "finds biggest element"
      (for-all ((x (a-list an-integer)))
	(is= (biggest x)
	     (car (last (sort x #'<))))))

    ))
