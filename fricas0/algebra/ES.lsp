
(DECLAIM (NOTINLINE |ExpressionSpace;|)) 

(DEFPARAMETER |ExpressionSpace;AL| 'NIL) 

(DEFUN |ExpressionSpace| ()
  (LET (#:G712)
    (COND (|ExpressionSpace;AL|)
          (T (SETQ |ExpressionSpace;AL| (|ExpressionSpace;|)))))) 

(DEFUN |ExpressionSpace;| ()
  (SPROG ((#1=#:G710 NIL))
         (PROG1
             (LETT #1#
                   (|sublisV|
                    (PAIR '(#2=#:G708 #3=#:G709)
                          (LIST '(|Kernel| $) '(|Kernel| $)))
                    (|Join| (|Comparable|) (|RetractableTo| '#2#)
                            (|InnerEvalable| '#3# '$) (|Evalable| '$)
                            (|mkCategory|
                             '(((|elt| ($ (|BasicOperator|) $)) T)
                               ((|elt| ($ (|BasicOperator|) $ $)) T)
                               ((|elt| ($ (|BasicOperator|) $ $ $)) T)
                               ((|elt| ($ (|BasicOperator|) $ $ $ $)) T)
                               ((|elt| ($ (|BasicOperator|) $ $ $ $ $)) T)
                               ((|elt| ($ (|BasicOperator|) $ $ $ $ $ $)) T)
                               ((|elt| ($ (|BasicOperator|) $ $ $ $ $ $ $)) T)
                               ((|elt| ($ (|BasicOperator|) $ $ $ $ $ $ $ $))
                                T)
                               ((|elt| ($ (|BasicOperator|) $ $ $ $ $ $ $ $ $))
                                T)
                               ((|elt| ($ (|BasicOperator|) (|List| $))) T)
                               ((|subst| ($ $ (|Equation| $))) T)
                               ((|subst| ($ $ (|List| (|Equation| $)))) T)
                               ((|subst|
                                 ($ $ (|List| (|Kernel| $)) (|List| $)))
                                T)
                               ((|box| ($ $)) T) ((|box| ($ (|List| $))) T)
                               ((|paren| ($ $)) T) ((|paren| ($ (|List| $))) T)
                               ((|distribute| ($ $)) T)
                               ((|distribute| ($ $ $)) T)
                               ((|height| ((|NonNegativeInteger|) $)) T)
                               ((|mainKernel|
                                 ((|Union| (|Kernel| $) "failed") $))
                                T)
                               ((|kernels| ((|List| (|Kernel| $)) $)) T)
                               ((|kernels| ((|List| (|Kernel| $)) (|List| $)))
                                T)
                               ((|tower| ((|List| (|Kernel| $)) $)) T)
                               ((|tower| ((|List| (|Kernel| $)) (|List| $))) T)
                               ((|operators| ((|List| (|BasicOperator|)) $)) T)
                               ((|operator|
                                 ((|BasicOperator|) (|BasicOperator|)))
                                T)
                               ((|belong?| ((|Boolean|) (|BasicOperator|))) T)
                               ((|is?| ((|Boolean|) $ (|BasicOperator|))) T)
                               ((|is?| ((|Boolean|) $ (|Symbol|))) T)
                               ((|kernel| ($ (|BasicOperator|) $)) T)
                               ((|kernel| ($ (|BasicOperator|) (|List| $))) T)
                               ((|map| ($ (|Mapping| $ $) (|Kernel| $))) T)
                               ((|freeOf?| ((|Boolean|) $ $)) T)
                               ((|freeOf?| ((|Boolean|) $ (|Symbol|))) T)
                               ((|eval|
                                 ($ $ (|List| (|Symbol|))
                                  (|List| (|Mapping| $ $))))
                                T)
                               ((|eval|
                                 ($ $ (|List| (|Symbol|))
                                  (|List| (|Mapping| $ (|List| $)))))
                                T)
                               ((|eval|
                                 ($ $ (|Symbol|) (|Mapping| $ (|List| $))))
                                T)
                               ((|eval| ($ $ (|Symbol|) (|Mapping| $ $))) T)
                               ((|eval|
                                 ($ $ (|List| (|BasicOperator|))
                                  (|List| (|Mapping| $ $))))
                                T)
                               ((|eval|
                                 ($ $ (|List| (|BasicOperator|))
                                  (|List| (|Mapping| $ (|List| $)))))
                                T)
                               ((|eval|
                                 ($ $ (|BasicOperator|)
                                  (|Mapping| $ (|List| $))))
                                T)
                               ((|eval|
                                 ($ $ (|BasicOperator|) (|Mapping| $ $)))
                                T)
                               ((|minPoly|
                                 ((|SparseUnivariatePolynomial| $)
                                  (|Kernel| $)))
                                (|has| $ (|Ring|)))
                               ((|definingPolynomial| ($ $))
                                (|has| $ (|Ring|)))
                               ((|even?| ((|Boolean|) $))
                                (|has| $ (|RetractableTo| (|Integer|))))
                               ((|odd?| ((|Boolean|) $))
                                (|has| $ (|RetractableTo| (|Integer|)))))
                             NIL
                             '((|Boolean|) (|SparseUnivariatePolynomial| $)
                               (|Kernel| $) (|BasicOperator|)
                               (|List| (|BasicOperator|))
                               (|List| (|Mapping| $ (|List| $)))
                               (|List| (|Mapping| $ $)) (|Symbol|)
                               (|List| (|Symbol|)) (|List| $)
                               (|List| (|Kernel| $)) (|NonNegativeInteger|)
                               (|List| (|Equation| $)) (|Equation| $))
                             NIL)))
                   |ExpressionSpace|)
           (SETELT #1# 0 '(|ExpressionSpace|))))) 

(MAKEPROP '|ExpressionSpace| 'NILADIC T) 
