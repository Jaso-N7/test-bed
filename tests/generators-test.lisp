;;;; CREATING CUSTOM GENERATORS
; Using Elixir's definition of a binary
; 'https://elixir-lang.org/getting-started/binaries-strings-and-char-lists.html':
; - A binary is a bitstring where the number of bits is divisible by 8 and
; - A string is a UTF-8 encoded binary, where the code point for each character 
; is encoded u;sing 1 to 4 bytes. Thus every string is a binary, but due to the 
; UTF-8 standard encoding ru;les, not every binary is a valid string.
;
; In Common Lisp, a STRING is already a vector of characters, however I am choosing to
; represent them as a literal string of characters #(#\s #\t #\r #\i #\n #\g)
; I may (am definitely) be wrong in this, and will update it once I am either
;  a) corrected 
;  b) learn how stupid I was
;  c) all of the above.

#| Example tested in the REPL of emulating `COLLECT'. Will/May convert this into
a MACRO as an exercise.

(quickcheck
  (flet ((collect-length (xs accum)
	   (incf (svref accum (length xs))))
	 (print-collection (accum)
	   (terpri)
	   (dotimes (pos *size*)
	     (let ((len (svref accum pos)))
	       (format t "~,2F% {length ~A, count ~A}~%"
		       (* (/ len *size*) 100)
		       pos len)))))
    (let ((accum (make-array *size* :element-type 'integer
				    :initial-element 0)))
      (for-all ((xs (a-list #'a-symbol)))
	(collect-length xs accum)
	(only-if (> (length xs) 0)
		 (is= (reverse xs) (nreverse (copy-list xs)))))
      (print-collection accum))))
|#


(in-package :test-bed/tests)

;;; PROPERTIES

#| !!! TODO - finish this up
(defun check-generators ()
  "From Chapter 4. Custom Generators.
Until I improve proficiency in MACROS to update CL-QUICKCHECK. This will do for now."

  (named "collect 1"
	 (flet ((collect (bin)
		  (is-binary bin
|#

;;; HELPERS

;; This may be implementation specific			     
(defun is-binary (bin)
  (or (stringp bin)
      (and (typep bin 'simple-array)
	   (equal '(unsigned-byte 8)
		  (cadr (type-of bin))))))

(when *testing*
  (named "is-binary examples"
	 (isnt= T (is-binary (vector (let ((*print-base* 4))
				       (princ 3)))))
	 (is= T (is-binary "hello"))
	 (is= T (is-binary #(239 191 19)))))
	 
	 
		  

;;; GENERATORS

(define a-binary ()
  (encode-string-to-octets (generate a-string) :external-format :UTF-8))
;; !!! TODO create tests for `A-BINARY' generator.
    


