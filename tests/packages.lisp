(defpackage test-bed/tests
  (:use :cl
        :test-bed
        :cl-quickcheck)
  (:export :check!
	   :check-fizzbuzz)
  (:documentation "Property-Based Tests."))
