(clear)
(release-mem)
(clear)                   ; Memory Leak #1
(progn (release-mem) TRUE)
(mem-used)
(defclass SOURCE (is-a USER))

(deffunction foo()
   (do-for-all-instances ((?x SOURCE)) TRUE
      (bind ?y 0)
      (bogus)))
(clear)                   ; Memory Leak #2
(progn (release-mem) TRUE)
(mem-used)
(defclass SOURCE (is-a USER))

(deffunction foo()
   (do-for-all-instances ((?x SOURCE)) (progn (bind ?y 3) (bogus) TRUE)
      (+ 3 4)))
(clear)                   ; Memory Leak #3
(progn (release-mem) TRUE)
(mem-used)
(deftemplate SOURCE)

(deffunction foo()
   (do-for-all-facts ((?x SOURCE)) TRUE
      (bind ?y 0)
      (bogus)))
(clear)                   ; Memory Leak #41
(progn (release-mem) TRUE)
(mem-used)
(deftemplate SOURCE)

(deffunction foo()
   (do-for-all-facts ((?x SOURCE)) (progn (bind ?y 3) (bogus) TRUE)
      (+ 3 4)))
(clear)                   ; Memory Leak #5
(progn (release-mem) TRUE)
(mem-used)

(defclass FOO (is-a USER)
   (slot value1))

(deffunction foo ()
   (make-instance of FOO
      (value1 (bogus))))
(clear)                   ; Memory Leak #6
(progn (release-mem) TRUE)
(mem-used)

(deftemplate FOO
   (slot value1 (type SYMBOL)))

(defrule foo
   (FOO (value1 ?x))
   =>
   (+ ?x 1)
   (printout t ?x))
(clear)
(progn (release-mem) TRUE)
(mem-used)