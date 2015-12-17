;;; Testing prolog external library

(asdf:oos 'asdf:load-op :cffi)
   
  ;;; Nothing special about the "CFFI-USER" package.  We're just
  ;;; using it as a substitute for your own CL package.
  (defpackage :swilisp-user
    (:use :common-lisp :cffi))
 
  (in-package :swilisp-user)

  (define-foreign-library swi-prolog
    (:darwin (:or "libswipl.so" "libswipl.so"))
    (:unix "libswipl.so")
    (t (:default "libswipl.so")))

  (use-foreign-library swi-prolog)

  (cffi:define-foreign-library swilisp
      (t (:default "swilisp"))) ;; note no .so suffix here
  (cffi:use-foreign-library swilisp)

  (load "swilisp.lisp")
