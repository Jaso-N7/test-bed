(defsystem "test-bed"
  :version "0.1.0"
  :author "Jason S. Robinson"
  :license ""
  :depends-on ()
  :serial t
  :components ((:module "src"
                :components
                ((:file "packages")
		 (:file "fizzbuzz"))))
  :description "Sample application(s) used for Property-Based Testing."
  :in-order-to ((test-op (test-op "test-bed/tests"))))

(defsystem "test-bed/tests"
  :author "Jason S. Robinson"
  :license ""
  :depends-on ("test-bed"
               "cl-quickcheck")
  :serial t
  :components ((:module "tests"
                :components
                ((:file "packages")
		 (:file "fizzbuzz-test")
		 (:file "tests"))))
  :description "Test system for TEST-BED"
  :perform (test-op (op c) (symbol-call :test-bed/tests :check!)))
