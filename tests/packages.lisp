(defpackage test-bed/tests
  (:use :cl
        :test-bed
        :cl-quickcheck)
  (:export :check!
	   :run-units
	   :check-fizzbuzz)
  (:documentation "Property-Based Tests."))
