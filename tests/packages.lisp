(defpackage test-bed/tests
  (:use :cl
        :test-bed
        :cl-quickcheck)
  (:export :check!
	   :fizzbuzz.check)
  (:documentation "Property-Based Tests."))
