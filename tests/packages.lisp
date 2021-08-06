(defpackage test-bed/tests
  (:documentation "Property-Based Tests.")
  (:use :cl
        :test-bed
        :cl-quickcheck)
  (:export :check!
	   :run-units
	   :check-fizzbuzz
	   :check-biggest))

