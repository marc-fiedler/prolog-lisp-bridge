;;; Testing prolog external library

(asdf:oos 'asdf:load-op :cffi)
   
  ;;; Nothing special about the "CFFI-USER" package.  We're just
  ;;; using it as a substitute for your own CL package.
  (defpackage :prolog-test-user
    (:use :common-lisp :cffi))
 
  (in-package :prolog-test-user)

  (define-foreign-library swi-prolog
    (:darwin (:or "libswipl.so" "libswipl.so"))
    (:unix "libswipl.so")
    (t (:default "libswipl.so")))

  (use-foreign-library swi-prolog)

  (define-foreign-library prolog-test
    (:darwin (:or "libcurl.3.dylib" "libcurl.dylib"))
    (:unix "prolog-test.so")
    (t (:default "prolog-test.so")))

  (use-foreign-library prolog-test)

  (cffi:define-foreign-library c-test
      (t (:default "c-test"))) ;; note no .so suffix here
  (cffi:use-foreign-library c-test)

  (load "lisp-test.lisp")
  (load "c-test.lisp")
  (load "main.lisp")
