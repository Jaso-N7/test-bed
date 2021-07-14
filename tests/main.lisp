(defpackage FIZZBUZZ/tests/main
  (:use :cl
        :FIZZBUZZ
        :rove))
(in-package :FIZZBUZZ/tests/main)

;; NOTE: To run this test file, execute `(asdf:test-system :FIZZBUZZ)' in your Lisp.

(deftest test-target-1
  (testing "should (= 1 1) to be true"
    (ok (= 1 1))))
