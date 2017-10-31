
(SDEFUN |SYMTAB;coerce;$Of;1| ((|t| $) ($ |OutputForm|))
        (SPADCALL |t| (QREFELT $ 8))) 

(PUT '|SYMTAB;coerce;$T;2| '|SPADreplace| '(XLAM (|t|) |t|)) 

(SDEFUN |SYMTAB;coerce;$T;2| ((|t| $) ($ |Table| (|Symbol|) (|FortranType|)))
        |t|) 

(SDEFUN |SYMTAB;symbolTable;L$;3|
        ((|l| |List|
          (|Record| (|:| |key| (|Symbol|)) (|:| |entry| (|FortranType|))))
         ($ $))
        (SPADCALL |l| (QREFELT $ 14))) 

(SDEFUN |SYMTAB;empty;$;4| (($ $)) (SPADCALL (QREFELT $ 16))) 

(SDEFUN |SYMTAB;parametersOf;$L;5| ((|tab| $) ($ |List| (|Symbol|)))
        (SPADCALL |tab| (QREFELT $ 19))) 

(SDEFUN |SYMTAB;declare!;SFt$Ft;6|
        ((|name| |Symbol|) (|type| |FortranType|) (|tab| $) ($ |FortranType|))
        (SEQ (SPADCALL |tab| |name| |type| (QREFELT $ 23)) (EXIT |type|))) 

(SDEFUN |SYMTAB;declare!;LFt$Ft;7|
        ((|names| |List| (|Symbol|)) (|type| |FortranType|) (|tab| $)
         ($ |FortranType|))
        (SPROG ((#1=#:G714 NIL) (|name| NIL))
               (SEQ
                (SEQ (LETT |name| NIL . #2=(|SYMTAB;declare!;LFt$Ft;7|))
                     (LETT #1# |names| . #2#) G190
                     (COND
                      ((OR (ATOM #1#)
                           (PROGN (LETT |name| (CAR #1#) . #2#) NIL))
                       (GO G191)))
                     (SEQ (EXIT (SPADCALL |tab| |name| |type| (QREFELT $ 23))))
                     (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
                (EXIT |type|)))) 

(SDEFUN |SYMTAB;fortranTypeOf;S$Ft;8|
        ((|u| |Symbol|) (|tab| $) ($ |FortranType|))
        (SPADCALL |tab| |u| (QREFELT $ 26))) 

(SDEFUN |SYMTAB;externalList;$L;9| ((|tab| $) ($ |List| (|Symbol|)))
        (SPROG ((#1=#:G719 NIL) (|u| NIL) (#2=#:G718 NIL))
               (SEQ
                (PROGN
                 (LETT #2# NIL . #3=(|SYMTAB;externalList;$L;9|))
                 (SEQ (LETT |u| NIL . #3#)
                      (LETT #1# (SPADCALL |tab| (QREFELT $ 19)) . #3#) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |u| (CAR #1#) . #3#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (COND
                         ((SPADCALL (SPADCALL |u| |tab| (QREFELT $ 27))
                                    (QREFELT $ 29))
                          (LETT #2# (CONS |u| #2#) . #3#)))))
                      (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                      (EXIT (NREVERSE #2#))))))) 

(SDEFUN |SYMTAB;typeList;Fst$L;10|
        ((|type| |FortranScalarType|) (|tab| $)
         ($ |List|
          (|Union| (|:| |name| (|Symbol|))
                   (|:| |bounds|
                        (|List|
                         (|Union| (|:| S (|Symbol|))
                                  (|:| P (|Polynomial| (|Integer|)))))))))
        (SPROG
         ((|arrayList|
           (|List|
            (|Union| (|:| |name| (|Symbol|))
                     (|:| |bounds|
                          (|List|
                           (|Union| (|:| S (|Symbol|))
                                    (|:| P (|Polynomial| (|Integer|)))))))))
          (|scalarList|
           (|List|
            (|Union| (|:| |name| (|Symbol|))
                     (|:| |bounds|
                          (|List|
                           (|Union| (|:| S (|Symbol|))
                                    (|:| P (|Polynomial| (|Integer|)))))))))
          (|uDim|
           (|List|
            (|Union| (|:| S (|Symbol|)) (|:| P (|Polynomial| (|Integer|))))))
          (#1=#:G746 NIL) (|v| NIL) (#2=#:G745 NIL)
          (|sType|
           (|Union| (|:| |fst| (|FortranScalarType|)) (|:| |void| "void")))
          (|uType| (|FortranType|)) (#3=#:G744 NIL) (|u| NIL))
         (SEQ (LETT |scalarList| NIL . #4=(|SYMTAB;typeList;Fst$L;10|))
              (LETT |arrayList| NIL . #4#)
              (SEQ (LETT |u| NIL . #4#)
                   (LETT #3# (SPADCALL |tab| (QREFELT $ 19)) . #4#) G190
                   (COND
                    ((OR (ATOM #3#) (PROGN (LETT |u| (CAR #3#) . #4#) NIL))
                     (GO G191)))
                   (SEQ
                    (LETT |uType| (SPADCALL |u| |tab| (QREFELT $ 27)) . #4#)
                    (LETT |sType| (SPADCALL |uType| (QREFELT $ 32)) . #4#)
                    (EXIT
                     (COND
                      ((QEQCAR |sType| 0)
                       (COND
                        ((SPADCALL (CDR |sType|) |type| (QREFELT $ 34))
                         (SEQ
                          (LETT |uDim|
                                (PROGN
                                 (LETT #2# NIL . #4#)
                                 (SEQ (LETT |v| NIL . #4#)
                                      (LETT #1#
                                            (SPADCALL |uType| (QREFELT $ 36))
                                            . #4#)
                                      G190
                                      (COND
                                       ((OR (ATOM #1#)
                                            (PROGN
                                             (LETT |v| (CAR #1#) . #4#)
                                             NIL))
                                        (GO G191)))
                                      (SEQ
                                       (EXIT
                                        (LETT #2# (CONS (CONS 1 |v|) #2#)
                                              . #4#)))
                                      (LETT #1# (CDR #1#) . #4#) (GO G190) G191
                                      (EXIT (NREVERSE #2#))))
                                . #4#)
                          (EXIT
                           (COND
                            ((NULL |uDim|)
                             (LETT |scalarList|
                                   (CONS (CONS 0 |u|) |scalarList|) . #4#))
                            ('T
                             (LETT |arrayList|
                                   (CONS (CONS 1 (CONS (CONS 0 |u|) |uDim|))
                                         |arrayList|)
                                   . #4#)))))))))))
                   (LETT #3# (CDR #3#) . #4#) (GO G190) G191 (EXIT NIL))
              (EXIT (SPADCALL |scalarList| |arrayList| (QREFELT $ 40)))))) 

(SDEFUN |SYMTAB;typeList2|
        ((|type| |FortranScalarType|) (|tab| $)
         ($ |List|
          (|Union| (|:| |name| (|Symbol|))
                   (|:| |bounds|
                        (|List|
                         (|Union| (|:| S (|Symbol|))
                                  (|:| P (|Polynomial| (|Integer|)))))))))
        (SPROG
         ((|tl|
           (|List|
            (|Union| (|:| |name| (|Symbol|))
                     (|:| |bounds|
                          (|List|
                           (|Union| (|:| S (|Symbol|))
                                    (|:| P (|Polynomial| (|Integer|)))))))))
          (|uDim|
           (|List|
            (|Union| (|:| S (|Symbol|)) (|:| P (|Polynomial| (|Integer|))))))
          (#1=#:G763 NIL) (|v| NIL) (#2=#:G762 NIL)
          (|sType|
           (|Union| (|:| |fst| (|FortranScalarType|)) (|:| |void| "void")))
          (|uType| (|FortranType|)) (#3=#:G761 NIL) (|u| NIL)
          (|symbolType| (|Symbol|)))
         (SEQ (LETT |tl| NIL . #4=(|SYMTAB;typeList2|))
              (LETT |symbolType| (SPADCALL |type| (QREFELT $ 42)) . #4#)
              (SEQ (LETT |u| NIL . #4#)
                   (LETT #3# (SPADCALL |tab| (QREFELT $ 19)) . #4#) G190
                   (COND
                    ((OR (ATOM #3#) (PROGN (LETT |u| (CAR #3#) . #4#) NIL))
                     (GO G191)))
                   (SEQ
                    (LETT |uType| (SPADCALL |u| |tab| (QREFELT $ 27)) . #4#)
                    (LETT |sType| (SPADCALL |uType| (QREFELT $ 32)) . #4#)
                    (EXIT
                     (COND
                      ((QEQCAR |sType| 0)
                       (COND
                        ((SPADCALL (CDR |sType|) |type| (QREFELT $ 34))
                         (SEQ
                          (LETT |uDim|
                                (PROGN
                                 (LETT #2# NIL . #4#)
                                 (SEQ (LETT |v| NIL . #4#)
                                      (LETT #1#
                                            (SPADCALL |uType| (QREFELT $ 36))
                                            . #4#)
                                      G190
                                      (COND
                                       ((OR (ATOM #1#)
                                            (PROGN
                                             (LETT |v| (CAR #1#) . #4#)
                                             NIL))
                                        (GO G191)))
                                      (SEQ
                                       (EXIT
                                        (LETT #2# (CONS (CONS 1 |v|) #2#)
                                              . #4#)))
                                      (LETT #1# (CDR #1#) . #4#) (GO G190) G191
                                      (EXIT (NREVERSE #2#))))
                                . #4#)
                          (EXIT
                           (LETT |tl|
                                 (COND ((NULL |uDim|) (CONS (CONS 0 |u|) |tl|))
                                       ('T
                                        (CONS
                                         (CONS 1 (CONS (CONS 0 |u|) |uDim|))
                                         |tl|)))
                                 . #4#)))))))))
                   (LETT #3# (CDR #3#) . #4#) (GO G190) G191 (EXIT NIL))
              (EXIT
               (COND ((NULL |tl|) |tl|)
                     ('T (CONS (CONS 0 |symbolType|) |tl|))))))) 

(SDEFUN |SYMTAB;updateList|
        ((|sType| |SExpression|) (|name| |SExpression|) (|lDims| |SExpression|)
         (|tl| |SExpression|) ($ |SExpression|))
        (SPROG ((|entry| (|SExpression|)) (|l| (|SExpression|)))
               (SEQ (LETT |l| (ASSOC |sType| |tl|) . #1=(|SYMTAB;updateList|))
                    (LETT |entry|
                          (COND ((SPADCALL |lDims| (QREFELT $ 44)) |name|)
                                (#2='T (CONS |name| |lDims|)))
                          . #1#)
                    (EXIT
                     (COND
                      ((SPADCALL |l| (QREFELT $ 44))
                       (CONS (|construct| |sType| |entry|) |tl|))
                      (#2#
                       (SEQ
                        (RPLACD |l|
                                (CONS |entry| (SPADCALL |l| (QREFELT $ 45))))
                        (EXIT |tl|)))))))) 

(SDEFUN |SYMTAB;newTypeLists;$Se;13| ((|tab| $) ($ |SExpression|))
        (SPROG
         ((|tl| (|SExpression|)) (|lType| (|SExpression|))
          (|lDims| (|List| (|SExpression|))) (#1=#:G779 NIL) (|v| NIL)
          (#2=#:G778 NIL) (|dims| (|List| (|Polynomial| (|Integer|))))
          (|sType|
           (|Union| (|:| |fst| (|FortranScalarType|)) (|:| |void| "void")))
          (|uType| (|FortranType|)) (#3=#:G777 NIL) (|u| NIL))
         (SEQ (LETT |tl| (|construct|) . #4=(|SYMTAB;newTypeLists;$Se;13|))
              (SEQ (LETT |u| NIL . #4#)
                   (LETT #3# (SPADCALL |tab| (QREFELT $ 19)) . #4#) G190
                   (COND
                    ((OR (ATOM #3#) (PROGN (LETT |u| (CAR #3#) . #4#) NIL))
                     (GO G191)))
                   (SEQ
                    (LETT |uType| (SPADCALL |u| |tab| (QREFELT $ 27)) . #4#)
                    (LETT |sType| (SPADCALL |uType| (QREFELT $ 32)) . #4#)
                    (LETT |dims| (SPADCALL |uType| (QREFELT $ 36)) . #4#)
                    (LETT |lDims|
                          (PROGN
                           (LETT #2# NIL . #4#)
                           (SEQ (LETT |v| NIL . #4#) (LETT #1# |dims| . #4#)
                                G190
                                (COND
                                 ((OR (ATOM #1#)
                                      (PROGN (LETT |v| (CAR #1#) . #4#) NIL))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (LETT #2#
                                        (CONS
                                         (SPADCALL
                                          (SPADCALL |v| (QREFELT $ 48))
                                          (QREFELT $ 49))
                                         #2#)
                                        . #4#)))
                                (LETT #1# (CDR #1#) . #4#) (GO G190) G191
                                (EXIT (NREVERSE #2#))))
                          . #4#)
                    (LETT |lType|
                          (COND
                           ((QEQCAR |sType| 1)
                            (SPADCALL '|void| (QREFELT $ 50)))
                           ('T (SPADCALL (CDR |sType|) (QREFELT $ 51))))
                          . #4#)
                    (EXIT
                     (LETT |tl|
                           (|SYMTAB;updateList| |lType|
                            (SPADCALL |u| (QREFELT $ 50))
                            (SPADCALL |lDims| (QREFELT $ 53)) |tl| $)
                           . #4#)))
                   (LETT #3# (CDR #3#) . #4#) (GO G190) G191 (EXIT NIL))
              (EXIT |tl|)))) 

(SDEFUN |SYMTAB;typeLists;$L;14|
        ((|tab| $)
         ($ |List|
          (|List|
           (|Union| (|:| |name| (|Symbol|))
                    (|:| |bounds|
                         (|List|
                          (|Union| (|:| S (|Symbol|))
                                   (|:| P (|Polynomial| (|Integer|))))))))))
        (SPROG
         ((|tl|
           (|List|
            (|List|
             (|Union| (|:| |name| (|Symbol|))
                      (|:| |bounds|
                           (|List|
                            (|Union| (|:| S (|Symbol|))
                                     (|:| P (|Polynomial| (|Integer|))))))))))
          (|types|
           (|List|
            (|Union| (|:| |name| (|Symbol|))
                     (|:| |bounds|
                          (|List|
                           (|Union| (|:| S (|Symbol|))
                                    (|:| P (|Polynomial| (|Integer|)))))))))
          (#1=#:G786 NIL) (|u| NIL)
          (|fortranTypes| (|List| (|FortranScalarType|))))
         (SEQ
          (LETT |fortranTypes|
                (LIST (SPADCALL "real" (QREFELT $ 56))
                      (SPADCALL "double precision" (QREFELT $ 56))
                      (SPADCALL "integer" (QREFELT $ 56))
                      (SPADCALL "complex" (QREFELT $ 56))
                      (SPADCALL "logical" (QREFELT $ 56))
                      (SPADCALL "character" (QREFELT $ 56)))
                . #2=(|SYMTAB;typeLists;$L;14|))
          (LETT |tl| NIL . #2#)
          (SEQ (LETT |u| NIL . #2#) (LETT #1# |fortranTypes| . #2#) G190
               (COND
                ((OR (ATOM #1#) (PROGN (LETT |u| (CAR #1#) . #2#) NIL))
                 (GO G191)))
               (SEQ (LETT |types| (|SYMTAB;typeList2| |u| |tab| $) . #2#)
                    (EXIT
                     (COND
                      ((NULL (NULL |types|))
                       (LETT |tl| (CONS |types| |tl|) . #2#)))))
               (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
          (EXIT |tl|)))) 

(SDEFUN |SYMTAB;oForm2|
        ((|w| |Union| (|:| S (|Symbol|)) (|:| P (|Polynomial| (|Integer|))))
         ($ |OutputForm|))
        (SPROG ((#1=#:G748 NIL))
               (COND ((QEQCAR |w| 0) (SPADCALL (CDR |w|) (QREFELT $ 59)))
                     ((QEQCAR |w| 1)
                      (SPADCALL
                       (PROG2 (LETT #1# |w| |SYMTAB;oForm2|)
                           (QCDR #1#)
                         (|check_union2| (QEQCAR #1# 1)
                                         (|Polynomial| (|Integer|))
                                         (|Union| (|:| S (|Symbol|))
                                                  (|:| P
                                                       (|Polynomial|
                                                        (|Integer|))))
                                         #1#))
                       (QREFELT $ 60)))))) 

(SDEFUN |SYMTAB;oForm|
        ((|v| |Union| (|:| |name| (|Symbol|))
          (|:| |bounds|
               (|List|
                (|Union| (|:| S (|Symbol|))
                         (|:| P (|Polynomial| (|Integer|)))))))
         ($ |OutputForm|))
        (SPROG
         ((|ll| (|List| (|OutputForm|))) (#1=#:G799 NIL) (#2=#:G750 NIL)
          (|uu| NIL) (#3=#:G798 NIL))
         (SEQ
          (COND ((QEQCAR |v| 0) (SPADCALL (CDR |v|) (QREFELT $ 59)))
                ((QEQCAR |v| 1)
                 (SEQ
                  (LETT |ll|
                        (PROGN
                         (LETT #3# NIL . #4=(|SYMTAB;oForm|))
                         (SEQ (LETT |uu| NIL . #4#)
                              (LETT #1#
                                    (PROG2 (LETT #2# |v| . #4#)
                                        (QCDR #2#)
                                      (|check_union2| (QEQCAR #2# 1)
                                                      (|List|
                                                       (|Union|
                                                        (|:| S (|Symbol|))
                                                        (|:| P
                                                             (|Polynomial|
                                                              (|Integer|)))))
                                                      (|Union|
                                                       (|:| |name| (|Symbol|))
                                                       (|:| |bounds|
                                                            (|List|
                                                             (|Union|
                                                              (|:| S
                                                                   (|Symbol|))
                                                              (|:| P
                                                                   (|Polynomial|
                                                                    (|Integer|)))))))
                                                      #2#))
                                    . #4#)
                              G190
                              (COND
                               ((OR (ATOM #1#)
                                    (PROGN (LETT |uu| (CAR #1#) . #4#) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (LETT #3# (CONS (|SYMTAB;oForm2| |uu| $) #3#)
                                      . #4#)))
                              (LETT #1# (CDR #1#) . #4#) (GO G190) G191
                              (EXIT (NREVERSE #3#))))
                        . #4#)
                  (EXIT (SPADCALL |ll| (QREFELT $ 62))))))))) 

(SDEFUN |SYMTAB;outForm|
        ((|t| |List|
          (|Union| (|:| |name| (|Symbol|))
                   (|:| |bounds|
                        (|List|
                         (|Union| (|:| S (|Symbol|))
                                  (|:| P (|Polynomial| (|Integer|))))))))
         ($ |List| (|OutputForm|)))
        (SPROG ((#1=#:G803 NIL) (|u| NIL) (#2=#:G802 NIL))
               (SEQ
                (PROGN
                 (LETT #2# NIL . #3=(|SYMTAB;outForm|))
                 (SEQ (LETT |u| NIL . #3#) (LETT #1# |t| . #3#) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |u| (CAR #1#) . #3#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #2# (CONS (|SYMTAB;oForm| |u| $) #2#) . #3#)))
                      (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                      (EXIT (NREVERSE #2#))))))) 

(SDEFUN |SYMTAB;printTypes;$V;18| ((|tab| $) ($ |Void|))
        (SPROG
         ((|el| (|List| (|OutputForm|))) (#1=#:G811 NIL) (|u| NIL)
          (#2=#:G810 NIL) (|otl| (|List| (|OutputForm|)))
          (|tl|
           (|List|
            (|Union| (|:| |name| (|Symbol|))
                     (|:| |bounds|
                          (|List|
                           (|Union| (|:| S (|Symbol|))
                                    (|:| P (|Polynomial| (|Integer|)))))))))
          (#3=#:G809 NIL) (|ty| NIL) (|ft| (|List| (|FortranScalarType|))))
         (SEQ
          (LETT |ft|
                (LIST (SPADCALL "integer" (QREFELT $ 56))
                      (SPADCALL "real" (QREFELT $ 56))
                      (SPADCALL "double precision" (QREFELT $ 56))
                      (SPADCALL "complex" (QREFELT $ 56))
                      (SPADCALL "logical" (QREFELT $ 56))
                      (SPADCALL "character" (QREFELT $ 56)))
                . #4=(|SYMTAB;printTypes;$V;18|))
          (SEQ (LETT |ty| NIL . #4#) (LETT #3# |ft| . #4#) G190
               (COND
                ((OR (ATOM #3#) (PROGN (LETT |ty| (CAR #3#) . #4#) NIL))
                 (GO G191)))
               (SEQ (LETT |tl| (SPADCALL |ty| |tab| (QREFELT $ 41)) . #4#)
                    (LETT |otl| (|SYMTAB;outForm| |tl| $) . #4#)
                    (EXIT
                     (SPADCALL (SPADCALL |ty| (QREFELT $ 63)) |otl|
                               (QREFELT $ 66))))
               (LETT #3# (CDR #3#) . #4#) (GO G190) G191 (EXIT NIL))
          (LETT |el|
                (PROGN
                 (LETT #2# NIL . #4#)
                 (SEQ (LETT |u| NIL . #4#)
                      (LETT #1# (SPADCALL |tab| (QREFELT $ 30)) . #4#) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |u| (CAR #1#) . #4#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #2# (CONS (SPADCALL |u| (QREFELT $ 59)) #2#)
                              . #4#)))
                      (LETT #1# (CDR #1#) . #4#) (GO G190) G191
                      (EXIT (NREVERSE #2#))))
                . #4#)
          (SPADCALL "EXTERNAL" |el| (QREFELT $ 66))
          (EXIT (SPADCALL (QREFELT $ 67)))))) 

(DECLAIM (NOTINLINE |SymbolTable;|)) 

(DEFUN |SymbolTable| ()
  (SPROG NIL
         (PROG (#1=#:G813)
           (RETURN
            (COND
             ((LETT #1# (HGET |$ConstructorCache| '|SymbolTable|)
                    . #2=(|SymbolTable|))
              (|CDRwithIncrement| (CDAR #1#)))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (CDDAR
                       (HPUT |$ConstructorCache| '|SymbolTable|
                             (LIST (CONS NIL (CONS 1 (|SymbolTable;|))))))
                    (LETT #1# T . #2#))
                (COND
                 ((NOT #1#) (HREM |$ConstructorCache| '|SymbolTable|)))))))))) 

(DEFUN |SymbolTable;| ()
  (SPROG ((|dv$| NIL) ($ NIL) (|pv$| NIL))
         (PROGN
          (LETT |dv$| '(|SymbolTable|) . #1=(|SymbolTable|))
          (LETT $ (GETREFV 69) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|SymbolTable| NIL (CONS 1 $))
          (|stuffDomainSlots| $)
          (SETF |pv$| (QREFELT $ 3))
          (QSETREFV $ 6 (|Table| (|Symbol|) (|FortranType|)))
          $))) 

(MAKEPROP '|SymbolTable| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL '|Rep| (|OutputForm|) (0 . |coerce|)
              |SYMTAB;coerce;$Of;1| (|Table| 22 21) |SYMTAB;coerce;$T;2|
              (|Record| (|:| |key| 22) (|:| |entry| 21)) (|List| 12)
              (5 . |table|) |SYMTAB;symbolTable;L$;3| (10 . |empty|)
              |SYMTAB;empty;$;4| (|List| 22) (14 . |keys|)
              |SYMTAB;parametersOf;$L;5| (|FortranType|) (|Symbol|)
              (19 . |setelt!|) |SYMTAB;declare!;SFt$Ft;6|
              |SYMTAB;declare!;LFt$Ft;7| (26 . |elt|)
              |SYMTAB;fortranTypeOf;S$Ft;8| (|Boolean|) (32 . |external?|)
              |SYMTAB;externalList;$L;9|
              (|Union| (|:| |fst| 33) (|:| |void| '"void"))
              (37 . |scalarTypeOf|) (|FortranScalarType|) (42 . =) (|List| 47)
              (48 . |dimensionsOf|) (|Union| (|:| S 22) (|:| P 47))
              (|Union| (|:| |name| 22) (|:| |bounds| (|List| 37))) (|List| 38)
              (53 . |append|) |SYMTAB;typeList;Fst$L;10| (59 . |coerce|)
              (|SExpression|) (64 . |null?|) (69 . |cdr|) (|InputForm|)
              (|Polynomial| (|Integer|)) (74 . |convert|) (79 . |convert|)
              (84 . |convert|) (89 . |coerce|) (|List| $) (94 . |convert|)
              |SYMTAB;newTypeLists;$Se;13| (|String|) (99 . |coerce|)
              (|List| 39) |SYMTAB;typeLists;$L;14| (104 . |coerce|)
              (109 . |coerce|) (|List| 7) (114 . |coerce|) (119 . |coerce|)
              (|Void|) (|FortranCodeTools|) (124 . |fort_format_types|)
              (130 . |void|) |SYMTAB;printTypes;$V;18|)
           '#(|typeLists| 134 |typeList| 139 |symbolTable| 145 |printTypes| 150
              |parametersOf| 155 |newTypeLists| 160 |fortranTypeOf| 165
              |externalList| 171 |empty| 176 |declare!| 180 |coerce| 194)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS '#((|CoercibleTo| 7))
                             (|makeByteWordVec2| 68
                                                 '(1 6 7 0 8 1 6 0 13 14 0 6 0
                                                   16 1 6 18 0 19 3 6 21 0 22
                                                   21 23 2 6 21 0 22 26 1 21 28
                                                   0 29 1 21 31 0 32 2 33 28 0
                                                   0 34 1 21 35 0 36 2 39 0 0 0
                                                   40 1 33 22 0 42 1 43 28 0 44
                                                   1 43 0 0 45 1 47 46 0 48 1
                                                   46 43 0 49 1 43 0 22 50 1 33
                                                   43 0 51 1 43 0 52 53 1 33 0
                                                   55 56 1 22 7 0 59 1 47 7 0
                                                   60 1 61 7 0 62 1 33 55 0 63
                                                   2 65 64 55 61 66 0 64 0 67 1
                                                   0 57 0 58 2 0 39 33 0 41 1 0
                                                   0 13 15 1 0 64 0 68 1 0 18 0
                                                   20 1 0 43 0 54 2 0 21 22 0
                                                   27 1 0 18 0 30 0 0 0 17 3 0
                                                   21 22 21 0 24 3 0 21 18 21 0
                                                   25 1 0 7 0 9 1 0 10 0
                                                   11)))))
           '|lookupComplete|)) 

(MAKEPROP '|SymbolTable| 'NILADIC T) 
