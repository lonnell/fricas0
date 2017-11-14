
(DECLAIM (NOTINLINE |UniqueFactorizationDomain;|)) 

(DEFPARAMETER |UniqueFactorizationDomain;AL| 'NIL) 

(DEFUN |UniqueFactorizationDomain| ()
  (LET (#:G692)
    (COND (|UniqueFactorizationDomain;AL|)
          (T
           (SETQ |UniqueFactorizationDomain;AL|
                   (|UniqueFactorizationDomain;|)))))) 

(DEFUN |UniqueFactorizationDomain;| ()
  (SPROG ((#1=#:G690 NIL))
         (PROG1
             (LETT #1#
                   (|Join| (|GcdDomain|)
                           (|mkCategory|
                            '(((|prime?| ((|Boolean|) $)) T)
                              ((|squareFree| ((|Factored| $) $)) T)
                              ((|squareFreePart| ($ $)) T)
                              ((|factor| ((|Factored| $) $)) T))
                            NIL '((|Factored| $) (|Boolean|)) NIL))
                   |UniqueFactorizationDomain|)
           (SETELT #1# 0 '(|UniqueFactorizationDomain|))))) 

(MAKEPROP '|UniqueFactorizationDomain| 'NILADIC T) 