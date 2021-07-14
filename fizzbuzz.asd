(defsystem "fizzbuzz"
  :version "0.1.0"
  :author "Jason S. Robinson"
  :license ""
  :depends-on ()
  :components ((:module "src"
                :components
                ((:file "main"))))
  :description "Sample application used for Property-Based Testing."
  :in-order-to ((test-op (test-op "fizzbuzz/tests"))))

(defsystem "fizzbuzz/tests"
  :author ""
  :license ""
  :depends-on ("fizzbuzz"
               "cl-quickcheck")
  :components ((:module "tests"
                :components
                ((:file "main"))))
  :description "Test system for FIZZBUZZ"
  :perform (test-op (op c) (symbol-call :rove :run c)))
