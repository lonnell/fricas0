
(SDEFUN |GCNAALG;eval|
        ((|rf| |Fraction| (|Polynomial| R)) (|a| $)
         ($ |Fraction| (|Polynomial| R)))
        (SPROG
         ((|bot| #1=(|Polynomial| R)) (|top| #1#)
          (|lEq| (|List| (|Equation| (|Polynomial| R)))) (#2=#:G742 NIL)
          (|i| NIL) (#3=#:G741 NIL) (|s| NIL) (#4=#:G740 NIL)
          (|coefOfa| (|List| (|Polynomial| R))))
         (SEQ
          (LETT |coefOfa|
                (SPADCALL (ELT $ 36)
                          (SPADCALL (SPADCALL |a| (QREFELT $ 37))
                                    (QREFELT $ 39))
                          (QREFELT $ 43))
                . #5=(|GCNAALG;eval|))
          (SETELT $ 8
                  (PROGN
                   (LETT #4# NIL . #5#)
                   (SEQ (LETT |s| NIL . #5#)
                        (LETT #3# (SPADCALL (QREFELT $ 18) (QREFELT $ 44))
                              . #5#)
                        G190
                        (COND
                         ((OR (ATOM #3#)
                              (PROGN (LETT |s| (CAR #3#) . #5#) NIL))
                          (GO G191)))
                        (SEQ
                         (EXIT
                          (LETT #4#
                                (CONS
                                 (SPADCALL (|spadConstant| $ 20) (LIST |s|)
                                           (LIST 1) (QREFELT $ 26))
                                 #4#)
                                . #5#)))
                        (LETT #3# (CDR #3#) . #5#) (GO G190) G191
                        (EXIT (NREVERSE #4#)))))
          (LETT |lEq| NIL . #5#)
          (SEQ (LETT |i| 1 . #5#)
               (LETT #2# (SPADCALL (QREFELT $ 8) (QREFELT $ 45)) . #5#) G190
               (COND ((|greater_SI| |i| #2#) (GO G191)))
               (SEQ
                (EXIT
                 (LETT |lEq|
                       (CONS
                        (SPADCALL (SPADCALL (QREFELT $ 8) |i| (QREFELT $ 46))
                                  (SPADCALL |coefOfa| |i| (QREFELT $ 46))
                                  (QREFELT $ 48))
                        |lEq|)
                       . #5#)))
               (LETT |i| (|inc_SI| |i|) . #5#) (GO G190) G191 (EXIT NIL))
          (LETT |top|
                (SPADCALL (SPADCALL |rf| (QREFELT $ 36)) |lEq| (QREFELT $ 50))
                . #5#)
          (LETT |bot|
                (SPADCALL (SPADCALL |rf| (QREFELT $ 36)) |lEq| (QREFELT $ 50))
                . #5#)
          (EXIT (SPADCALL |top| |bot| (QREFELT $ 51)))))) 

(SDEFUN |GCNAALG;genericLeftTraceForm;2$F;2|
        ((|a| $) (|b| $) ($ |Fraction| (|Polynomial| R)))
        (SPADCALL (SPADCALL |a| |b| (QREFELT $ 52)) (QREFELT $ 53))) 

(SDEFUN |GCNAALG;genericLeftDiscriminant;F;3| (($ |Fraction| (|Polynomial| R)))
        (SPROG
         ((|m| (|Matrix| (|Fraction| (|Polynomial| R)))) (#1=#:G751 NIL)
          (|a| NIL) (#2=#:G750 NIL) (#3=#:G749 NIL) (|b| NIL) (#4=#:G748 NIL)
          (|listBasis| (|List| $)))
         (SEQ
          (LETT |listBasis| (SPADCALL (SPADCALL (QREFELT $ 56)) (QREFELT $ 59))
                . #5=(|GCNAALG;genericLeftDiscriminant;F;3|))
          (LETT |m|
                (SPADCALL
                 (PROGN
                  (LETT #4# NIL . #5#)
                  (SEQ (LETT |b| NIL . #5#) (LETT #3# |listBasis| . #5#) G190
                       (COND
                        ((OR (ATOM #3#) (PROGN (LETT |b| (CAR #3#) . #5#) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (LETT #4#
                               (CONS
                                (PROGN
                                 (LETT #2# NIL . #5#)
                                 (SEQ (LETT |a| NIL . #5#)
                                      (LETT #1# |listBasis| . #5#) G190
                                      (COND
                                       ((OR (ATOM #1#)
                                            (PROGN
                                             (LETT |a| (CAR #1#) . #5#)
                                             NIL))
                                        (GO G191)))
                                      (SEQ
                                       (EXIT
                                        (LETT #2#
                                              (CONS
                                               (SPADCALL |a| |b|
                                                         (QREFELT $ 54))
                                               #2#)
                                              . #5#)))
                                      (LETT #1# (CDR #1#) . #5#) (GO G190) G191
                                      (EXIT (NREVERSE #2#))))
                                #4#)
                               . #5#)))
                       (LETT #3# (CDR #3#) . #5#) (GO G190) G191
                       (EXIT (NREVERSE #4#))))
                 (QREFELT $ 62))
                . #5#)
          (EXIT (SPADCALL |m| (QREFELT $ 63)))))) 

(SDEFUN |GCNAALG;genericRightTraceForm;2$F;4|
        ((|a| $) (|b| $) ($ |Fraction| (|Polynomial| R)))
        (SPADCALL (SPADCALL |a| |b| (QREFELT $ 52)) (QREFELT $ 65))) 

(SDEFUN |GCNAALG;genericRightDiscriminant;F;5|
        (($ |Fraction| (|Polynomial| R)))
        (SPROG
         ((|m| (|Matrix| (|Fraction| (|Polynomial| R)))) (#1=#:G760 NIL)
          (|a| NIL) (#2=#:G759 NIL) (#3=#:G758 NIL) (|b| NIL) (#4=#:G757 NIL)
          (|listBasis| (|List| $)))
         (SEQ
          (LETT |listBasis| (SPADCALL (SPADCALL (QREFELT $ 56)) (QREFELT $ 59))
                . #5=(|GCNAALG;genericRightDiscriminant;F;5|))
          (LETT |m|
                (SPADCALL
                 (PROGN
                  (LETT #4# NIL . #5#)
                  (SEQ (LETT |b| NIL . #5#) (LETT #3# |listBasis| . #5#) G190
                       (COND
                        ((OR (ATOM #3#) (PROGN (LETT |b| (CAR #3#) . #5#) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (LETT #4#
                               (CONS
                                (PROGN
                                 (LETT #2# NIL . #5#)
                                 (SEQ (LETT |a| NIL . #5#)
                                      (LETT #1# |listBasis| . #5#) G190
                                      (COND
                                       ((OR (ATOM #1#)
                                            (PROGN
                                             (LETT |a| (CAR #1#) . #5#)
                                             NIL))
                                        (GO G191)))
                                      (SEQ
                                       (EXIT
                                        (LETT #2#
                                              (CONS
                                               (SPADCALL |a| |b|
                                                         (QREFELT $ 66))
                                               #2#)
                                              . #5#)))
                                      (LETT #1# (CDR #1#) . #5#) (GO G190) G191
                                      (EXIT (NREVERSE #2#))))
                                #4#)
                               . #5#)))
                       (LETT #3# (CDR #3#) . #5#) (GO G190) G191
                       (EXIT (NREVERSE #4#))))
                 (QREFELT $ 62))
                . #5#)
          (EXIT (SPADCALL |m| (QREFELT $ 63)))))) 

(SDEFUN |GCNAALG;initializeLeft| (($ |Void|))
        (SEQ (SETELT $ 71 NIL)
             (SETELT $ 70 (SPADCALL (QREFELT $ 35) (QREFELT $ 72)))
             (EXIT (SPADCALL (QREFELT $ 74))))) 

(SDEFUN |GCNAALG;initializeRight| (($ |Void|))
        (SEQ (SETELT $ 76 NIL)
             (SETELT $ 75 (SPADCALL (QREFELT $ 35) (QREFELT $ 77)))
             (EXIT (SPADCALL (QREFELT $ 74))))) 

(SDEFUN |GCNAALG;leftRankPolynomial;Sup;8|
        (($ |SparseUnivariatePolynomial| (|Fraction| (|Polynomial| R))))
        (SEQ (COND ((QREFELT $ 71) (|GCNAALG;initializeLeft| $)))
             (EXIT (QREFELT $ 70)))) 

(SDEFUN |GCNAALG;rightRankPolynomial;Sup;9|
        (($ |SparseUnivariatePolynomial| (|Fraction| (|Polynomial| R))))
        (SEQ (COND ((QREFELT $ 76) (|GCNAALG;initializeRight| $)))
             (EXIT (QREFELT $ 75)))) 

(SDEFUN |GCNAALG;genericLeftMinimalPolynomial;$Sup;10|
        ((|a| $)
         ($ |SparseUnivariatePolynomial| (|Fraction| (|Polynomial| R))))
        (SPROG NIL
               (SEQ (COND ((QREFELT $ 71) (|GCNAALG;initializeLeft| $)))
                    (EXIT
                     (SPADCALL
                      (CONS #'|GCNAALG;genericLeftMinimalPolynomial;$Sup;10!0|
                            (VECTOR $ |a|))
                      (QREFELT $ 70) (QREFELT $ 81)))))) 

(SDEFUN |GCNAALG;genericLeftMinimalPolynomial;$Sup;10!0| ((|x| NIL) ($$ NIL))
        (PROG (|a| $)
          (LETT |a| (QREFELT $$ 1)
                . #1=(|GCNAALG;genericLeftMinimalPolynomial;$Sup;10|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (|GCNAALG;eval| |x| |a| $))))) 

(SDEFUN |GCNAALG;genericRightMinimalPolynomial;$Sup;11|
        ((|a| $)
         ($ |SparseUnivariatePolynomial| (|Fraction| (|Polynomial| R))))
        (SPROG NIL
               (SEQ (COND ((QREFELT $ 76) (|GCNAALG;initializeRight| $)))
                    (EXIT
                     (SPADCALL
                      (CONS #'|GCNAALG;genericRightMinimalPolynomial;$Sup;11!0|
                            (VECTOR $ |a|))
                      (QREFELT $ 75) (QREFELT $ 81)))))) 

(SDEFUN |GCNAALG;genericRightMinimalPolynomial;$Sup;11!0| ((|x| NIL) ($$ NIL))
        (PROG (|a| $)
          (LETT |a| (QREFELT $$ 1)
                . #1=(|GCNAALG;genericRightMinimalPolynomial;$Sup;11|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (|GCNAALG;eval| |x| |a| $))))) 

(SDEFUN |GCNAALG;genericLeftTrace;$F;12|
        ((|a| $) ($ |Fraction| (|Polynomial| R)))
        (SPROG
         ((|rf| (|Fraction| (|Polynomial| R))) (|d1| (|NonNegativeInteger|)))
         (SEQ (COND ((QREFELT $ 71) (|GCNAALG;initializeLeft| $)))
              (LETT |d1|
                    (SPADCALL (SPADCALL (QREFELT $ 70) (QREFELT $ 85)) 1
                              (QREFELT $ 86))
                    . #1=(|GCNAALG;genericLeftTrace;$F;12|))
              (LETT |rf| (SPADCALL (QREFELT $ 70) |d1| (QREFELT $ 87)) . #1#)
              (LETT |rf| (|GCNAALG;eval| |rf| |a| $) . #1#)
              (EXIT (SPADCALL |rf| (QREFELT $ 88)))))) 

(SDEFUN |GCNAALG;genericRightTrace;$F;13|
        ((|a| $) ($ |Fraction| (|Polynomial| R)))
        (SPROG
         ((|rf| (|Fraction| (|Polynomial| R))) (|d1| (|NonNegativeInteger|)))
         (SEQ (COND ((QREFELT $ 76) (|GCNAALG;initializeRight| $)))
              (LETT |d1|
                    (SPADCALL (SPADCALL (QREFELT $ 75) (QREFELT $ 85)) 1
                              (QREFELT $ 86))
                    . #1=(|GCNAALG;genericRightTrace;$F;13|))
              (LETT |rf| (SPADCALL (QREFELT $ 75) |d1| (QREFELT $ 87)) . #1#)
              (LETT |rf| (|GCNAALG;eval| |rf| |a| $) . #1#)
              (EXIT (SPADCALL |rf| (QREFELT $ 88)))))) 

(SDEFUN |GCNAALG;genericLeftNorm;$F;14|
        ((|a| $) ($ |Fraction| (|Polynomial| R)))
        (SPROG ((|rf| (|Fraction| (|Polynomial| R))))
               (SEQ (COND ((QREFELT $ 71) (|GCNAALG;initializeLeft| $)))
                    (LETT |rf| (SPADCALL (QREFELT $ 70) 1 (QREFELT $ 87))
                          . #1=(|GCNAALG;genericLeftNorm;$F;14|))
                    (COND
                     ((ODDP (SPADCALL (QREFELT $ 70) (QREFELT $ 85)))
                      (LETT |rf| (SPADCALL |rf| (QREFELT $ 88)) . #1#)))
                    (EXIT |rf|)))) 

(SDEFUN |GCNAALG;genericRightNorm;$F;15|
        ((|a| $) ($ |Fraction| (|Polynomial| R)))
        (SPROG ((|rf| (|Fraction| (|Polynomial| R))))
               (SEQ (COND ((QREFELT $ 76) (|GCNAALG;initializeRight| $)))
                    (LETT |rf| (SPADCALL (QREFELT $ 75) 1 (QREFELT $ 87))
                          . #1=(|GCNAALG;genericRightNorm;$F;15|))
                    (COND
                     ((ODDP (SPADCALL (QREFELT $ 75) (QREFELT $ 85)))
                      (LETT |rf| (SPADCALL |rf| (QREFELT $ 88)) . #1#)))
                    (EXIT |rf|)))) 

(SDEFUN |GCNAALG;conditionsForIdempotents;VL;16|
        ((|b| |Vector| $) ($ |List| (|Polynomial| R)))
        (SPROG ((|x| ($)))
               (SEQ
                (LETT |x| (SPADCALL |b| (QREFELT $ 91))
                      |GCNAALG;conditionsForIdempotents;VL;16|)
                (EXIT
                 (SPADCALL (ELT $ 36)
                           (SPADCALL
                            (SPADCALL
                             (SPADCALL (SPADCALL |x| |x| (QREFELT $ 52)) |x|
                                       (QREFELT $ 92))
                             |b| (QREFELT $ 93))
                            (QREFELT $ 39))
                           (QREFELT $ 43)))))) 

(SDEFUN |GCNAALG;conditionsForIdempotents;L;17| (($ |List| (|Polynomial| R)))
        (SPROG ((|x| ($)))
               (SEQ
                (LETT |x| (QREFELT $ 35)
                      |GCNAALG;conditionsForIdempotents;L;17|)
                (EXIT
                 (SPADCALL (ELT $ 36)
                           (SPADCALL
                            (SPADCALL
                             (SPADCALL (SPADCALL |x| |x| (QREFELT $ 52)) |x|
                                       (QREFELT $ 92))
                             (QREFELT $ 37))
                            (QREFELT $ 39))
                           (QREFELT $ 43)))))) 

(SDEFUN |GCNAALG;generic;$;18| (($ $)) (QREFELT $ 35)) 

(SDEFUN |GCNAALG;generic;VV$;19|
        ((|vs| |Vector| (|Symbol|)) (|ve| |Vector| $) ($ $))
        (SPROG
         ((|v| (|Vector| (|Polynomial| R))) (#1=#:G798 NIL) (#2=#:G800 NIL)
          (|i| NIL) (#3=#:G799 NIL))
         (SEQ
          (COND
           ((SPADCALL (QVSIZE |vs|) (SPADCALL |ve| (QREFELT $ 97))
                      (QREFELT $ 99))
            (|error| "generic: too little symbols"))
           ('T
            (SEQ
             (LETT |v|
                   (PROGN
                    (LETT #3# (GETREFV #4=(SPADCALL |ve| (QREFELT $ 97)))
                          . #5=(|GCNAALG;generic;VV$;19|))
                    (SEQ (LETT |i| 1 . #5#) (LETT #2# #4# . #5#)
                         (LETT #1# 0 . #5#) G190
                         (COND ((|greater_SI| |i| #2#) (GO G191)))
                         (SEQ
                          (EXIT
                           (SETELT #3# #1#
                                   (SPADCALL (|spadConstant| $ 20)
                                             (LIST
                                              (SPADCALL |vs| |i|
                                                        (QREFELT $ 23)))
                                             (LIST 1) (QREFELT $ 26)))))
                         (LETT #1#
                               (PROG1 (|inc_SI| #1#)
                                 (LETT |i| (|inc_SI| |i|) . #5#))
                               . #5#)
                         (GO G190) G191 (EXIT NIL))
                    #3#)
                   . #5#)
             (EXIT
              (SPADCALL (SPADCALL (ELT $ 28) |v| (QREFELT $ 33)) |ve|
                        (QREFELT $ 100))))))))) 

(SDEFUN |GCNAALG;generic;SV$;20| ((|s| |Symbol|) (|ve| |Vector| $) ($ $))
        (SPROG
         ((|sFC| (|Vector| (|Symbol|))) (#1=#:G807 NIL) (#2=#:G809 NIL)
          (|i| NIL) (#3=#:G808 NIL) (|lON| (|List| (|String|))) (#4=#:G806 NIL)
          (|q| NIL) (#5=#:G805 NIL))
         (SEQ
          (LETT |lON|
                (PROGN
                 (LETT #5# NIL . #6=(|GCNAALG;generic;SV$;20|))
                 (SEQ (LETT |q| 1 . #6#)
                      (LETT #4# (SPADCALL |ve| (QREFELT $ 97)) . #6#) G190
                      (COND ((|greater_SI| |q| #4#) (GO G191)))
                      (SEQ
                       (EXIT (LETT #5# (CONS (STRINGIMAGE |q|) #5#) . #6#)))
                      (LETT |q| (|inc_SI| |q|) . #6#) (GO G190) G191
                      (EXIT (NREVERSE #5#))))
                . #6#)
          (LETT |sFC|
                (PROGN
                 (LETT #3# (GETREFV (SIZE |lON|)) . #6#)
                 (SEQ (LETT |i| NIL . #6#) (LETT #2# |lON| . #6#)
                      (LETT #1# 0 . #6#) G190
                      (COND
                       ((OR (ATOM #2#) (PROGN (LETT |i| (CAR #2#) . #6#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (SETELT #3# #1#
                                (SPADCALL (STRCONC |s| |i|) (QREFELT $ 17)))))
                      (LETT #1#
                            (PROG1 (|inc_SI| #1#) (LETT #2# (CDR #2#) . #6#))
                            . #6#)
                      (GO G190) G191 (EXIT NIL))
                 #3#)
                . #6#)
          (EXIT (SPADCALL |sFC| |ve| (QREFELT $ 101)))))) 

(SDEFUN |GCNAALG;generic;V$;21| ((|ve| |Vector| $) ($ $))
        (SPROG
         ((|v| (|Vector| (|Polynomial| R))) (#1=#:G821 NIL) (#2=#:G823 NIL)
          (|i| NIL) (#3=#:G822 NIL) (|sFC| (|Vector| (|Symbol|)))
          (#4=#:G818 NIL) (#5=#:G820 NIL) (#6=#:G819 NIL)
          (|lON| (|List| (|String|))) (#7=#:G817 NIL) (|q| NIL)
          (#8=#:G816 NIL))
         (SEQ
          (LETT |lON|
                (PROGN
                 (LETT #8# NIL . #9=(|GCNAALG;generic;V$;21|))
                 (SEQ (LETT |q| 1 . #9#)
                      (LETT #7# (SPADCALL |ve| (QREFELT $ 97)) . #9#) G190
                      (COND ((|greater_SI| |q| #7#) (GO G191)))
                      (SEQ
                       (EXIT (LETT #8# (CONS (STRINGIMAGE |q|) #8#) . #9#)))
                      (LETT |q| (|inc_SI| |q|) . #9#) (GO G190) G191
                      (EXIT (NREVERSE #8#))))
                . #9#)
          (LETT |sFC|
                (PROGN
                 (LETT #6# (GETREFV (SIZE |lON|)) . #9#)
                 (SEQ (LETT |i| NIL . #9#) (LETT #5# |lON| . #9#)
                      (LETT #4# 0 . #9#) G190
                      (COND
                       ((OR (ATOM #5#) (PROGN (LETT |i| (CAR #5#) . #9#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (SETELT #6# #4#
                                (SPADCALL (STRCONC "%" (STRCONC "x" |i|))
                                          (QREFELT $ 17)))))
                      (LETT #4#
                            (PROG1 (|inc_SI| #4#) (LETT #5# (CDR #5#) . #9#))
                            . #9#)
                      (GO G190) G191 (EXIT NIL))
                 #6#)
                . #9#)
          (LETT |v|
                (PROGN
                 (LETT #3# (GETREFV #10=(SPADCALL |ve| (QREFELT $ 97))) . #9#)
                 (SEQ (LETT |i| 1 . #9#) (LETT #2# #10# . #9#)
                      (LETT #1# 0 . #9#) G190
                      (COND ((|greater_SI| |i| #2#) (GO G191)))
                      (SEQ
                       (EXIT
                        (SETELT #3# #1#
                                (SPADCALL (|spadConstant| $ 20)
                                          (LIST
                                           (SPADCALL |sFC| |i| (QREFELT $ 23)))
                                          (LIST 1) (QREFELT $ 26)))))
                      (LETT #1#
                            (PROG1 (|inc_SI| #1#)
                              (LETT |i| (|inc_SI| |i|) . #9#))
                            . #9#)
                      (GO G190) G191 (EXIT NIL))
                 #3#)
                . #9#)
          (EXIT
           (SPADCALL (SPADCALL (ELT $ 28) |v| (QREFELT $ 33)) |ve|
                     (QREFELT $ 100)))))) 

(SDEFUN |GCNAALG;generic;V$;22| ((|vs| |Vector| (|Symbol|)) ($ $))
        (SPADCALL |vs| (SPADCALL (QREFELT $ 56)) (QREFELT $ 101))) 

(SDEFUN |GCNAALG;generic;S$;23| ((|s| |Symbol|) ($ $))
        (SPADCALL |s| (SPADCALL (QREFELT $ 56)) (QREFELT $ 102))) 

(DECLAIM (NOTINLINE |GenericNonAssociativeAlgebra;|)) 

(DEFUN |GenericNonAssociativeAlgebra| (&REST #1=#:G841)
  (SPROG NIL
         (PROG (#2=#:G842)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|GenericNonAssociativeAlgebra|)
                                               '|domainEqualList|)
                    . #3=(|GenericNonAssociativeAlgebra|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (APPLY (|function| |GenericNonAssociativeAlgebra;|) #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|GenericNonAssociativeAlgebra|)))))))))) 

(DEFUN |GenericNonAssociativeAlgebra;| (|#1| |#2| |#3| |#4|)
  (SPROG
   ((|v| NIL) (#1=#:G838 NIL) (#2=#:G840 NIL) (|i| NIL) (#3=#:G839 NIL)
    (#4=#:G835 NIL) (#5=#:G837 NIL) (#6=#:G836 NIL) (#7=#:G834 NIL) (|q| NIL)
    (#8=#:G833 NIL) (|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$4 NIL) (DV$3 NIL)
    (DV$2 NIL) (DV$1 NIL))
   (SEQ
    (PROGN
     (LETT DV$1 (|devaluate| |#1|) . #9=(|GenericNonAssociativeAlgebra|))
     (LETT DV$2 (|devaluate| |#2|) . #9#)
     (LETT DV$3 (|devaluate| |#3|) . #9#)
     (LETT DV$4 (|devaluate| |#4|) . #9#)
     (LETT |dv$| (LIST '|GenericNonAssociativeAlgebra| DV$1 DV$2 DV$3 DV$4)
           . #9#)
     (LETT $ (GETREFV 118) . #9#)
     (QSETREFV $ 0 |dv$|)
     (QSETREFV $ 3
               (LETT |pv$|
                     (|buildPredVector| 0 0
                                        (LIST
                                         (|HasCategory|
                                          (|Fraction| (|Polynomial| |#1|))
                                          '(|IntegralDomain|))
                                         (|HasCategory|
                                          (|Fraction| (|Polynomial| |#1|))
                                          '(|Finite|))
                                         (|HasCategory|
                                          (|Fraction| (|Polynomial| |#1|))
                                          '(|Field|))
                                         (|HasCategory| |#1|
                                                        '(|IntegralDomain|))))
                     . #9#))
     (|haddProp| |$ConstructorCache| '|GenericNonAssociativeAlgebra|
                 (LIST DV$1 DV$2 DV$3 DV$4) (CONS 1 $))
     (|stuffDomainSlots| $)
     (QSETREFV $ 6 |#1|)
     (QSETREFV $ 7 |#2|)
     (QSETREFV $ 8 |#3|)
     (QSETREFV $ 9 |#4|)
     (SETF |pv$| (QREFELT $ 3))
     (QSETREFV $ 14
               (PROGN
                (LETT #8# NIL . #9#)
                (SEQ (LETT |q| 1 . #9#) (LETT #7# |#2| . #9#) G190
                     (COND ((|greater_SI| |q| #7#) (GO G191)))
                     (SEQ (EXIT (LETT #8# (CONS (STRINGIMAGE |q|) #8#) . #9#)))
                     (LETT |q| (|inc_SI| |q|) . #9#) (GO G190) G191
                     (EXIT (NREVERSE #8#)))))
     (QSETREFV $ 18
               (PROGN
                (LETT #6# (GETREFV (SIZE #10=(QREFELT $ 14))) . #9#)
                (SEQ (LETT |i| NIL . #9#) (LETT #5# #10# . #9#)
                     (LETT #4# 0 . #9#) G190
                     (COND
                      ((OR (ATOM #5#) (PROGN (LETT |i| (CAR #5#) . #9#) NIL))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (SETELT #6# #4#
                               (SPADCALL (STRCONC "%" (STRCONC "x" |i|))
                                         (QREFELT $ 17)))))
                     (LETT #4#
                           (PROG1 (|inc_SI| #4#) (LETT #5# (CDR #5#) . #9#))
                           . #9#)
                     (GO G190) G191 (EXIT NIL))
                #6#))
     (QSETREFV $ 35
               (SEQ
                (LETT |v|
                      (PROGN
                       (LETT #3# (GETREFV |#2|) . #9#)
                       (SEQ (LETT |i| 1 . #9#) (LETT #2# |#2| . #9#)
                            (LETT #1# 0 . #9#) G190
                            (COND ((|greater_SI| |i| #2#) (GO G191)))
                            (SEQ
                             (EXIT
                              (SETELT #3# #1#
                                      (SPADCALL (|spadConstant| $ 20)
                                                (LIST
                                                 (SPADCALL (QREFELT $ 18) |i|
                                                           (QREFELT $ 23)))
                                                (LIST 1) (QREFELT $ 26)))))
                            (LETT #1#
                                  (PROG1 (|inc_SI| #1#)
                                    (LETT |i| (|inc_SI| |i|) . #9#))
                                  . #9#)
                            (GO G190) G191 (EXIT NIL))
                       #3#)
                      . #9#)
                (EXIT
                 (SPADCALL (SPADCALL (ELT $ 28) |v| (QREFELT $ 33))
                           (QREFELT $ 34)))))
     (COND
      ((|testBitVector| |pv$| 4)
       (PROGN
        (QSETREFV $ 54
                  (CONS
                   (|dispatchFunction| |GCNAALG;genericLeftTraceForm;2$F;2|)
                   $))
        (QSETREFV $ 64
                  (CONS
                   (|dispatchFunction| |GCNAALG;genericLeftDiscriminant;F;3|)
                   $))
        (QSETREFV $ 66
                  (CONS
                   (|dispatchFunction| |GCNAALG;genericRightTraceForm;2$F;4|)
                   $))
        (QSETREFV $ 67
                  (CONS
                   (|dispatchFunction| |GCNAALG;genericRightDiscriminant;F;5|)
                   $))
        (QSETREFV $ 70 (|spadConstant| $ 69))
        (QSETREFV $ 71 'T)
        NIL
        (QSETREFV $ 75 (|spadConstant| $ 69))
        (QSETREFV $ 76 'T)
        NIL
        (QSETREFV $ 78
                  (CONS (|dispatchFunction| |GCNAALG;leftRankPolynomial;Sup;8|)
                        $))
        (QSETREFV $ 79
                  (CONS
                   (|dispatchFunction| |GCNAALG;rightRankPolynomial;Sup;9|) $))
        (QSETREFV $ 82
                  (CONS
                   (|dispatchFunction|
                    |GCNAALG;genericLeftMinimalPolynomial;$Sup;10|)
                   $))
        (QSETREFV $ 83
                  (CONS
                   (|dispatchFunction|
                    |GCNAALG;genericRightMinimalPolynomial;$Sup;11|)
                   $))
        (QSETREFV $ 53
                  (CONS (|dispatchFunction| |GCNAALG;genericLeftTrace;$F;12|)
                        $))
        (QSETREFV $ 65
                  (CONS (|dispatchFunction| |GCNAALG;genericRightTrace;$F;13|)
                        $))
        (QSETREFV $ 89
                  (CONS (|dispatchFunction| |GCNAALG;genericLeftNorm;$F;14|)
                        $))
        (QSETREFV $ 90
                  (CONS (|dispatchFunction| |GCNAALG;genericRightNorm;$F;15|)
                        $)))))
     $)))) 

(MAKEPROP '|GenericNonAssociativeAlgebra| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL
              (|AlgebraGivenByStructuralConstants| 27 (NRTEVAL (QREFELT $ 7))
                                                   (NRTEVAL (QREFELT $ 8))
                                                   (NRTEVAL
                                                    (SPADCALL (QREFELT $ 9)
                                                              (QREFELT $ 13))))
              (|local| |#1|) (|local| |#2|) (|local| |#3|) (|local| |#4|)
              (|Vector| 61) (|Vector| (|Matrix| 6))
              (|CoerceVectorMatrixPackage| 6) (0 . |coerce|) '|listOfNumbers|
              (|String|) (|Symbol|) (5 . |coerce|) '|symbolsForCoef|
              (|Polynomial| 6) (10 . |One|) (|Integer|) (|Vector| 16)
              (14 . |elt|) (|List| 16) (|List| 84) (20 . |monomial|)
              (|Fraction| 19) (27 . |coerce|) (|Vector| 27) (|Mapping| 27 19)
              (|Vector| 19) (|VectorFunctions2| 19 27) (32 . |map|)
              (38 . |convert|) '|genericElement| (43 . |numer|)
              (48 . |coordinates|) (|List| 27) (53 . |entries|) (|List| 19)
              (|Mapping| 19 27) (|ListFunctions2| 27 19) (58 . |map|)
              (64 . |entries|) (69 . |maxIndex|) (74 . |elt|) (|Equation| 19)
              (80 . |equation|) (|List| (|Equation| $)) (86 . |eval|) (92 . /)
              (98 . *) (104 . |genericLeftTrace|)
              (109 . |genericLeftTraceForm|) (|Vector| $) (115 . |basis|)
              (|List| $$) (|Vector| $$) (119 . |entries|) (|List| 38)
              (|Matrix| 27) (124 . |matrix|) (129 . |determinant|)
              (134 . |genericLeftDiscriminant|) (138 . |genericRightTrace|)
              (143 . |genericRightTraceForm|)
              (149 . |genericRightDiscriminant|)
              (|SparseUnivariatePolynomial| 27) (153 . |Zero|) '|leftRankPoly|
              '|initLeft?| (157 . |leftMinimalPolynomial|) (|Void|)
              (162 . |void|) '|rightRankPoly| '|initRight?|
              (166 . |rightMinimalPolynomial|) (171 . |leftRankPolynomial|)
              (175 . |rightRankPolynomial|) (|Mapping| 27 27) (179 . |map|)
              (185 . |genericLeftMinimalPolynomial|)
              (190 . |genericRightMinimalPolynomial|) (|NonNegativeInteger|)
              (195 . |degree|) (200 . -) (206 . |coefficient|) (212 . -)
              (217 . |genericLeftNorm|) (222 . |genericRightNorm|)
              |GCNAALG;generic;V$;21| (227 . -) (233 . |coordinates|)
              |GCNAALG;conditionsForIdempotents;VL;16|
              |GCNAALG;conditionsForIdempotents;L;17| |GCNAALG;generic;$;18|
              (239 . |maxIndex|) (|Boolean|) (244 . >) (250 . |represents|)
              |GCNAALG;generic;VV$;19| |GCNAALG;generic;SV$;20|
              |GCNAALG;generic;V$;22| |GCNAALG;generic;S$;23|
              (|SparseUnivariatePolynomial| (|Polynomial| 27)) (|List| $)
              (|PositiveInteger|) (|InputForm|) (|Union| $ '"failed")
              (|List| 29) (|Record| (|:| |particular| $) (|:| |basis| 106))
              (|Union| 111 '"failed")
              (|SquareMatrix| (NRTEVAL (QREFELT $ 7)) 27)
              (|List| (|Polynomial| 27)) (|HashState|) (|OutputForm|)
              (|SingleInteger|))
           '#(|rightRankPolynomial| 256 |rightMinimalPolynomial| 260
              |represents| 265 |leftRankPolynomial| 271 |leftMinimalPolynomial|
              275 |genericRightTraceForm| 280 |genericRightTrace| 286
              |genericRightNorm| 291 |genericRightMinimalPolynomial| 296
              |genericRightDiscriminant| 301 |genericLeftTraceForm| 305
              |genericLeftTrace| 311 |genericLeftNorm| 316
              |genericLeftMinimalPolynomial| 321 |genericLeftDiscriminant| 326
              |generic| 330 |coordinates| 361 |convert| 372
              |conditionsForIdempotents| 377 |basis| 386 - 390 * 396)
           'NIL
           (CONS
            (|makeByteWordVec2| 2
                                '(0 0 0 0 0 0 0 0 0 0 0 0 0 0 2 0 0 2 0 0 0 1
                                  2))
            (CONS
             '#(|FramedNonAssociativeAlgebra&|
                |FiniteRankNonAssociativeAlgebra&| |NonAssociativeAlgebra&|
                |Module&| |FramedModule&| NIL |NonAssociativeRng&| NIL NIL NIL
                |AbelianGroup&| NIL |NonAssociativeSemiRng&| |AbelianMonoid&|
                |Finite&| |AbelianSemiGroup&| |Magma&| NIL |SetCategory&|
                |BasicType&| NIL NIL NIL)
             (CONS
              '#((|FramedNonAssociativeAlgebra| (|Fraction| (|Polynomial| 6)))
                 (|FiniteRankNonAssociativeAlgebra|
                  (|Fraction| (|Polynomial| 6)))
                 (|NonAssociativeAlgebra| (|Fraction| (|Polynomial| 6)))
                 (|Module| (|Fraction| (|Polynomial| 6)))
                 (|FramedModule| (|Fraction| (|Polynomial| 6)))
                 (|BiModule| (|Fraction| (|Polynomial| 6))
                             (|Fraction| (|Polynomial| 6)))
                 (|NonAssociativeRng|)
                 (|LeftModule|
                  (|SquareMatrix| 7 (|Fraction| (|Polynomial| 6))))
                 (|RightModule| (|Fraction| (|Polynomial| 6)))
                 (|LeftModule| (|Fraction| (|Polynomial| 6))) (|AbelianGroup|)
                 (|CancellationAbelianMonoid|) (|NonAssociativeSemiRng|)
                 (|AbelianMonoid|) (|Finite|) (|AbelianSemiGroup|) (|Magma|)
                 (|Comparable|) (|SetCategory|) (|BasicType|)
                 (|CoercibleTo| 116) (|unitsKnown|) (|ConvertibleTo| 108))
              (|makeByteWordVec2| 104
                                  '(1 12 10 11 13 1 16 0 15 17 0 19 0 20 2 22
                                    16 0 21 23 3 19 0 0 24 25 26 1 27 0 19 28 2
                                    32 29 30 31 33 1 0 0 29 34 1 27 19 0 36 1 0
                                    29 0 37 1 29 38 0 39 2 42 40 41 38 43 1 22
                                    24 0 44 1 40 21 0 45 2 40 19 0 21 46 2 47 0
                                    19 19 48 2 19 0 0 49 50 2 27 0 19 19 51 2 0
                                    0 0 0 52 1 0 27 0 53 2 0 27 0 0 54 0 0 55
                                    56 1 58 57 0 59 1 61 0 60 62 1 61 27 0 63 0
                                    0 27 64 1 0 27 0 65 2 0 27 0 0 66 0 0 27 67
                                    0 68 0 69 1 0 68 0 72 0 73 0 74 1 0 68 0 77
                                    0 0 68 78 0 0 68 79 2 68 0 80 0 81 1 0 68 0
                                    82 1 0 68 0 83 1 68 84 0 85 2 84 0 0 0 86 2
                                    68 27 0 84 87 1 27 0 0 88 1 0 27 0 89 1 0
                                    27 0 90 2 0 0 0 0 92 2 0 29 0 55 93 1 58 21
                                    0 97 2 21 98 0 0 99 2 0 0 29 55 100 0 4 68
                                    79 1 1 68 0 77 2 0 0 29 55 100 0 4 68 78 1
                                    1 68 0 72 2 4 27 0 0 66 1 4 27 0 65 1 4 27
                                    0 90 1 4 68 0 83 0 4 27 67 2 4 27 0 0 54 1
                                    4 27 0 53 1 4 27 0 89 1 4 68 0 82 0 4 27 64
                                    2 0 0 22 55 101 1 0 0 55 91 2 0 0 16 55 102
                                    1 0 0 16 104 1 0 0 22 103 0 0 0 96 1 0 29 0
                                    37 2 0 29 0 55 93 1 0 0 29 34 0 4 40 95 1 4
                                    40 55 94 0 0 55 56 2 0 0 0 0 92 2 0 0 0 0
                                    52)))))
           '|lookupIncomplete|)) 
