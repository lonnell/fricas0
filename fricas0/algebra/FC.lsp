
(SDEFUN |FC;get_assignment|
        ((|name| |OutputForm|) (|e| |OutputForm|) (|int_to_floats?| |Boolean|)
         ($ |List| (|String|)))
        (SPADCALL
         (SPADCALL (SPADCALL '= (QREFELT $ 8)) (LIST |name| |e|)
                   (QREFELT $ 10))
         |int_to_floats?| (QREFELT $ 14))) 

(SDEFUN |FC;format_switch|
        ((|switch1| |OutputForm|) (|l| |List| (|String|))
         ($ |List| (|List| (|String|))))
        (SPROG ((|r| (|List| (|String|))) (|l1| (|List| (|OutputForm|))))
               (SEQ
                (COND
                 ((LISTP |switch1|)
                  (SEQ (LETT |l1| |switch1| . #1=(|FC;format_switch|))
                       (EXIT
                        (COND
                         ((EQ (|SPADfirst| |l1|) 'NULL)
                          (LETT |switch1| (|SPADfirst| (CDR |l1|)) . #1#)))))))
                (LETT |r| (NREVERSE (SPADCALL |switch1| (QREFELT $ 15))) . #1#)
                (SEQ G190
                     (COND
                      ((NULL
                        (COND ((NULL |r|) NIL)
                              ('T (NULL (EQUAL (|SPADfirst| |r|) "%l")))))
                       (GO G191)))
                     (SEQ (LETT |l| (CONS (|SPADfirst| |r|) |l|) . #1#)
                          (EXIT (LETT |r| (CDR |r|) . #1#)))
                     NIL (GO G190) G191 (EXIT NIL))
                (EXIT (LIST |l| |r|))))) 

(SDEFUN |FC;fortFormatIf1|
        ((|switch1| |OutputForm|) (|i| |Integer|) (|kind| |String|)
         ($ |List| (|String|)))
        (SPROG
         ((|r| NIL) (|#G11| #1=(|List| (|List| (|String|))))
          (|l| (|List| (|String|))) (|#G10| #1#))
         (SEQ (LETT |l| (LIST ")THEN") . #2=(|FC;fortFormatIf1|))
              (SPADCALL (- |i|) (QREFELT $ 18))
              (PROGN
               (LETT |#G10| (|FC;format_switch| |switch1| |l| $) . #2#)
               (LETT |#G11| |#G10| . #2#)
               (LETT |l| (|SPADfirst| |#G11|) . #2#)
               (LETT |#G11| (CDR |#G11|) . #2#)
               (LETT |r| (|SPADfirst| |#G11|) . #2#)
               |#G10|)
              (SPADCALL |i| (QREFELT $ 18))
              (EXIT
               (NREVERSE
                (SPADCALL (NREVERSE |l|) (CONS |kind| |r|) (QREFELT $ 19))))))) 

(SDEFUN |FC;fortFormatIf| ((|switch1| |OutputForm|) ($ |List| (|String|)))
        (SPROG NIL
               (SPADCALL (CONS #'|FC;fortFormatIf!0| (VECTOR $ |switch1|))
                         (QREFELT $ 21)))) 

(SDEFUN |FC;fortFormatIf!0| (($$ NIL))
        (PROG (|switch1| $)
          (LETT |switch1| (QREFELT $$ 1) . #1=(|FC;fortFormatIf|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (|FC;fortFormatIf1| |switch1| 8 "IF(" $))))) 

(SDEFUN |FC;fortFormatElseIf| ((|switch1| |OutputForm|) ($ |List| (|String|)))
        (SPROG NIL
               (SPADCALL (CONS #'|FC;fortFormatElseIf!0| (VECTOR $ |switch1|))
                         (QREFELT $ 21)))) 

(SDEFUN |FC;fortFormatElseIf!0| (($$ NIL))
        (PROG (|switch1| $)
          (LETT |switch1| (QREFELT $$ 1) . #1=(|FC;fortFormatElseIf|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (|FC;fortFormatIf1| |switch1| 12 "ELSEIF(" $))))) 

(SDEFUN |FC;fortFormatIfGoto1|
        ((|switch1| |OutputForm|) (|lab| |SingleInteger|)
         ($ |List| (|String|)))
        (SPROG
         ((|r| NIL) (|#G19| #1=(|List| (|List| (|String|))))
          (|l| (|List| (|String|))) (|#G18| #1#))
         (SEQ
          (LETT |l| (LIST ")GOTO " (STRINGIMAGE |lab|))
                . #2=(|FC;fortFormatIfGoto1|))
          (SPADCALL -8 (QREFELT $ 18))
          (PROGN
           (LETT |#G18| (|FC;format_switch| |switch1| |l| $) . #2#)
           (LETT |#G19| |#G18| . #2#)
           (LETT |l| (|SPADfirst| |#G19|) . #2#)
           (LETT |#G19| (CDR |#G19|) . #2#)
           (LETT |r| (|SPADfirst| |#G19|) . #2#)
           |#G18|)
          (SPADCALL 8 (QREFELT $ 18))
          (EXIT
           (NREVERSE
            (SPADCALL (NREVERSE |l|) (CONS "IF(" |r|) (QREFELT $ 19))))))) 

(SDEFUN |FC;fortFormatIfGoto|
        ((|switch1| |OutputForm|) (|lab| |SingleInteger|)
         ($ |List| (|String|)))
        (SPROG NIL
               (SPADCALL
                (CONS #'|FC;fortFormatIfGoto!0| (VECTOR $ |lab| |switch1|))
                (QREFELT $ 21)))) 

(SDEFUN |FC;fortFormatIfGoto!0| (($$ NIL))
        (PROG (|switch1| |lab| $)
          (LETT |switch1| (QREFELT $$ 2) . #1=(|FC;fortFormatIfGoto|))
          (LETT |lab| (QREFELT $$ 1) . #1#)
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (|FC;fortFormatIfGoto1| |switch1| |lab| $))))) 

(SDEFUN |FC;fortFormatLabelledIfGoto1|
        ((|switch1| |OutputForm|) (|lab1| |SingleInteger|)
         (|lab2| |SingleInteger|) ($ |List| (|String|)))
        (SPROG ((|l| (|List| (|String|))) (|labString| (|String|)) (|i| NIL))
               (SEQ
                (LETT |l| (|FC;fortFormatIfGoto1| |switch1| |lab2| $)
                      . #1=(|FC;fortFormatLabelledIfGoto1|))
                (LETT |labString| (STRINGIMAGE |lab1|) . #1#)
                (SEQ (LETT |i| (QCSIZE |labString|) . #1#) G190
                     (COND ((> |i| 5) (GO G191)))
                     (SEQ
                      (EXIT
                       (LETT |labString| (STRCONC |labString| " ") . #1#)))
                     (LETT |i| (+ |i| 1) . #1#) (GO G190) G191 (EXIT NIL))
                (LETT |l| (SPADCALL |l| (QREFELT $ 22)) . #1#)
                (EXIT
                 (CONS
                  (STRCONC |labString|
                           (SPADCALL (|SPADfirst| |l|)
                                     (SPADCALL 7 (QREFELT $ 24))
                                     (QREFELT $ 26)))
                  (CDR |l|)))))) 

(SDEFUN |FC;fortFormatLabelledIfGoto|
        ((|switch1| |OutputForm|) (|lab1| |SingleInteger|)
         (|lab2| |SingleInteger|) ($ |List| (|String|)))
        (SPROG NIL
               (SPADCALL
                (CONS #'|FC;fortFormatLabelledIfGoto!0|
                      (VECTOR $ |lab2| |lab1| |switch1|))
                (QREFELT $ 27)))) 

(SDEFUN |FC;fortFormatLabelledIfGoto!0| (($$ NIL))
        (PROG (|switch1| |lab1| |lab2| $)
          (LETT |switch1| (QREFELT $$ 3) . #1=(|FC;fortFormatLabelledIfGoto|))
          (LETT |lab1| (QREFELT $$ 2) . #1#)
          (LETT |lab2| (QREFELT $$ 1) . #1#)
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN (|FC;fortFormatLabelledIfGoto1| |switch1| |lab1| |lab2| $))))) 

(SDEFUN |FC;getfortarrayexp1|
        ((|name| |Symbol|) (|of| |OutputForm|) (|int_to_floats?| |Boolean|)
         ($ |List| (|String|)))
        (SPROG ((#1=#:G756 NIL) (|l| (|List| (|String|))))
               (SEQ
                (LETT |l|
                      (SPADCALL (CONS #'|FC;getfortarrayexp1!0| |name|) |of|
                                |int_to_floats?| (QREFELT $ 29))
                      . #2=(|FC;getfortarrayexp1|))
                (EXIT
                 (SPADCALL |l|
                           (PROG1 (LETT #1# (- (LENGTH |l|) 2) . #2#)
                             (|check_subtype2| (>= #1# 0)
                                               '(|NonNegativeInteger|)
                                               '(|Integer|) #1#))
                           (QREFELT $ 31)))))) 

(SDEFUN |FC;getfortarrayexp1!0| ((|name| NIL)) |name|) 

(SDEFUN |FC;getfortarrayexp|
        ((|name| |Symbol|) (|of| |OutputForm|) (|int_to_floats?| |Boolean|)
         ($ |List| (|String|)))
        (SPROG NIL
               (SPADCALL |int_to_floats?|
                         (CONS #'|FC;getfortarrayexp!0|
                               (VECTOR $ |int_to_floats?| |of| |name|))
                         (QREFELT $ 32)))) 

(SDEFUN |FC;getfortarrayexp!0| (($$ NIL))
        (PROG (|name| |of| |int_to_floats?| $)
          (LETT |name| (QREFELT $$ 3) . #1=(|FC;getfortarrayexp|))
          (LETT |of| (QREFELT $$ 2) . #1#)
          (LETT |int_to_floats?| (QREFELT $$ 1) . #1#)
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN (|FC;getfortarrayexp1| |name| |of| |int_to_floats?| $))))) 

(SDEFUN |FC;fortFormatDo1|
        ((|var1| |Symbol|) (|lo| |OutputForm|) (|hi| |OutputForm|)
         (|incr| |OutputForm|) (|lab| |SingleInteger|) ($ |List| (|String|)))
        (SPROG
         ((|il| (|List| (|String|))) (|incl| (|List| (|String|)))
          (|hil| #1=(|List| (|String|))) (|lol| #1#))
         (SEQ
          (LETT |lol| (SPADCALL |lo| (QREFELT $ 15)) . #2=(|FC;fortFormatDo1|))
          (LETT |hil| (SPADCALL |hi| (QREFELT $ 15)) . #2#)
          (LETT |incl|
                (COND
                 ((EQUAL |incr| 1) (CONS "," (SPADCALL |incr| (QREFELT $ 15))))
                 ('T NIL))
                . #2#)
          (LETT |il|
                (SPADCALL |lol|
                          (CONS "," (SPADCALL |hil| |incl| (QREFELT $ 19)))
                          (QREFELT $ 19))
                . #2#)
          (EXIT
           (SPADCALL
            (LIST "DO " (STRINGIMAGE |lab|) " "
                  (SPADCALL |var1| (QREFELT $ 33)) "=")
            |il| (QREFELT $ 19)))))) 

(SDEFUN |FC;fortFormatDo|
        ((|var1| |Symbol|) (|lo| |OutputForm|) (|hi| |OutputForm|)
         (|inc| |OutputForm|) (|lab| |SingleInteger|) ($ |List| (|String|)))
        (SPROG NIL
               (SPADCALL NIL
                         (CONS #'|FC;fortFormatDo!0|
                               (VECTOR $ |lab| |inc| |hi| |lo| |var1|))
                         (QREFELT $ 32)))) 

(SDEFUN |FC;fortFormatDo!0| (($$ NIL))
        (PROG (|var1| |lo| |hi| |inc| |lab| $)
          (LETT |var1| (QREFELT $$ 5) . #1=(|FC;fortFormatDo|))
          (LETT |lo| (QREFELT $$ 4) . #1#)
          (LETT |hi| (QREFELT $$ 3) . #1#)
          (LETT |inc| (QREFELT $$ 2) . #1#)
          (LETT |lab| (QREFELT $$ 1) . #1#)
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (|FC;fortFormatDo1| |var1| |lo| |hi| |inc| |lab| $))))) 

(SDEFUN |FC;addCommas| ((|l| |List| (|Symbol|)) ($ |List| (|String|)))
        (SPROG ((|r| (|List| (|String|))) (#1=#:G778 NIL) (|e| NIL))
               (SEQ
                (COND ((NULL |l|) NIL)
                      ('T
                       (SEQ
                        (LETT |r|
                              (LIST
                               (SPADCALL (|SPADfirst| |l|) (QREFELT $ 33)))
                              . #2=(|FC;addCommas|))
                        (SEQ (LETT |e| NIL . #2#) (LETT #1# (CDR |l|) . #2#)
                             G190
                             (COND
                              ((OR (ATOM #1#)
                                   (PROGN (LETT |e| (CAR #1#) . #2#) NIL))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (LETT |r|
                                     (CONS (SPADCALL |e| (QREFELT $ 33))
                                           (CONS "," |r|))
                                     . #2#)))
                             (LETT #1# (CDR #1#) . #2#) (GO G190) G191
                             (EXIT NIL))
                        (EXIT (NREVERSE |r|)))))))) 

(SDEFUN |FC;setLabelValue;2Si;15| ((|u| |SingleInteger|) ($ |SingleInteger|))
        (SETELT $ 37 |u|)) 

(SDEFUN |FC;newLabel| (($ |SingleInteger|))
        (SEQ (SETELT $ 37 (|add_SI| (QREFELT $ 37) 1)) (EXIT (QREFELT $ 37)))) 

(SDEFUN |FC;commaSep| ((|l| |List| (|String|)) ($ |List| (|String|)))
        (SPROG
         ((#1=#:G785 NIL) (#2=#:G784 #3=(|List| (|String|))) (#4=#:G786 #3#)
          (#5=#:G788 NIL) (|u| NIL))
         (SEQ
          (CONS (SPADCALL |l| 1 (QREFELT $ 41))
                (PROGN
                 (LETT #1# NIL . #6=(|FC;commaSep|))
                 (SEQ (LETT |u| NIL . #6#) (LETT #5# (CDR |l|) . #6#) G190
                      (COND
                       ((OR (ATOM #5#) (PROGN (LETT |u| (CAR #5#) . #6#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (PROGN
                         (LETT #4# (LIST "," |u|) . #6#)
                         (COND
                          (#1#
                           (LETT #2# (SPADCALL #2# #4# (QREFELT $ 19)) . #6#))
                          ('T
                           (PROGN
                            (LETT #2# #4# . #6#)
                            (LETT #1# 'T . #6#)))))))
                      (LETT #5# (CDR #5#) . #6#) (GO G190) G191 (EXIT NIL))
                 (COND (#1# #2#) ('T NIL))))))) 

(SDEFUN |FC;getReturn|
        ((|rec| |Record| (|:| |empty?| (|Boolean|))
          (|:| |value|
               (|Record| (|:| |ints2Floats?| (|Boolean|))
                         (|:| |expr| (|OutputForm|)))))
         ($ |List| (|String|)))
        (SPROG
         ((|rv| (|OutputForm|))
          (|rt|
           (|Record| (|:| |ints2Floats?| (|Boolean|))
                     (|:| |expr| (|OutputForm|))))
          (|returnToken| (|OutputForm|)))
         (SEQ
          (LETT |returnToken| (SPADCALL 'RETURN (QREFELT $ 8))
                . #1=(|FC;getReturn|))
          (EXIT
           (COND ((QCAR |rec|) (SPADCALL |returnToken| NIL (QREFELT $ 14)))
                 ('T
                  (SEQ (LETT |rt| (QCDR |rec|) . #1#)
                       (LETT |rv| (QCDR |rt|) . #1#)
                       (EXIT
                        (SPADCALL
                         (SPADCALL |returnToken| (LIST |rv|) (QREFELT $ 10))
                         (QCAR |rt|) (QREFELT $ 14)))))))))) 

(SDEFUN |FC;getStop| (($ |List| (|String|)))
        (SPADCALL (LIST "STOP") (QREFELT $ 22))) 

(SDEFUN |FC;getSave| (($ |List| (|String|)))
        (SPADCALL (LIST "SAVE") (QREFELT $ 22))) 

(SDEFUN |FC;getCommon|
        ((|u| |Record| (|:| |name| (|Symbol|))
          (|:| |contents| (|List| (|Symbol|))))
         ($ |List| (|String|)))
        (SPADCALL
         (SPADCALL
          (LIST "COMMON" " /" (SPADCALL (QCAR |u|) (QREFELT $ 33)) "/ ")
          (|FC;addCommas| (QCDR |u|) $) (QREFELT $ 19))
         (QREFELT $ 22))) 

(SDEFUN |FC;getPrint| ((|l| |List| (|OutputForm|)) ($ |List| (|String|)))
        (SPROG ((|ll| (|List| (|String|))) (#1=#:G800 NIL) (|i| NIL))
               (SEQ (LETT |ll| (LIST "PRINT*") . #2=(|FC;getPrint|))
                    (SEQ (LETT |i| NIL . #2#) (LETT #1# |l| . #2#) G190
                         (COND
                          ((OR (ATOM #1#)
                               (PROGN (LETT |i| (CAR #1#) . #2#) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (LETT |ll|
                                 (SPADCALL |ll|
                                           (CONS ","
                                                 (SPADCALL |i| (QREFELT $ 42)))
                                           (QREFELT $ 19))
                                 . #2#)))
                         (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
                    (EXIT (SPADCALL |ll| (QREFELT $ 22)))))) 

(SDEFUN |FC;getBlock| ((|rec| |List| $) ($ |List| (|String|)))
        (SPROG ((|expr| (|List| (|String|))) (#1=#:G804 NIL) (|u| NIL))
               (SEQ (SPADCALL 1 (QREFELT $ 43))
                    (LETT |expr| NIL . #2=(|FC;getBlock|))
                    (SEQ (LETT |u| NIL . #2#) (LETT #1# |rec| . #2#) G190
                         (COND
                          ((OR (ATOM #1#)
                               (PROGN (LETT |u| (CAR #1#) . #2#) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (LETT |expr|
                                 (SPADCALL |expr| (SPADCALL |u| (QREFELT $ 44))
                                           (QREFELT $ 19))
                                 . #2#)))
                         (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
                    (SPADCALL -1 (QREFELT $ 43)) (EXIT |expr|)))) 

(SDEFUN |FC;getBody| ((|f| $) ($ |List| (|String|)))
        (SPROG ((|expr| (|List| (|String|))))
               (SEQ
                (COND
                 ((QEQCAR (SPADCALL |f| (QREFELT $ 46)) 4)
                  (SPADCALL |f| (QREFELT $ 44)))
                 ('T
                  (SEQ (SPADCALL 1 (QREFELT $ 43))
                       (LETT |expr| (SPADCALL |f| (QREFELT $ 44)) |FC;getBody|)
                       (SPADCALL -1 (QREFELT $ 43)) (EXIT |expr|))))))) 

(SDEFUN |FC;getElseIf| ((|f| $) ($ |List| (|String|)))
        (SPROG
         ((|expr| (|List| (|String|))) (|elseBranch| ($)) (#1=#:G832 NIL)
          (|rec|
           (|Union| (|:| |nullBranch| #2="null")
                    (|:| |assignmentBranch|
                         (|Record| (|:| |var| (|Symbol|))
                                   (|:| |arrayIndex|
                                        (|List| (|Polynomial| (|Integer|))))
                                   (|:| |rand|
                                        (|Record|
                                         (|:| |ints2Floats?| (|Boolean|))
                                         (|:| |expr| (|OutputForm|))))))
                    (|:| |arrayAssignmentBranch|
                         (|Record| (|:| |var| (|Symbol|))
                                   (|:| |rand| (|OutputForm|))
                                   (|:| |ints2Floats?| (|Boolean|))))
                    (|:| |conditionalBranch|
                         (|Record| (|:| |switch| (|Switch|))
                                   (|:| |thenClause| $) (|:| |elseClause| $)))
                    (|:| |returnBranch|
                         (|Record| (|:| |empty?| (|Boolean|))
                                   (|:| |value|
                                        (|Record|
                                         (|:| |ints2Floats?| (|Boolean|))
                                         (|:| |expr| (|OutputForm|))))))
                    (|:| |blockBranch| (|List| $))
                    (|:| |commentBranch| (|List| (|String|)))
                    (|:| |callBranch| (|String|))
                    (|:| |forBranch|
                         (|Record|
                          (|:| |range|
                               (|SegmentBinding| (|Polynomial| (|Integer|))))
                          (|:| |span| (|Polynomial| (|Integer|)))
                          (|:| |body| $)))
                    (|:| |labelBranch| (|SingleInteger|))
                    (|:| |loopBranch|
                         (|Record| (|:| |switch| (|Switch|)) (|:| |body| $)))
                    (|:| |commonBranch|
                         (|Record| (|:| |name| (|Symbol|))
                                   (|:| |contents| (|List| (|Symbol|)))))
                    (|:| |printBranch| (|List| (|OutputForm|))))))
         (SEQ (LETT |rec| (SPADCALL |f| (QREFELT $ 56)) . #3=(|FC;getElseIf|))
              (LETT |expr|
                    (|FC;fortFormatElseIf|
                     (SPADCALL
                      (QVELT
                       (PROG2 (LETT #1# |rec| . #3#)
                           (QCDR #1#)
                         (|check_union2| (QEQCAR #1# 3)
                                         (|Record| (|:| |switch| (|Switch|))
                                                   (|:| |thenClause| $)
                                                   (|:| |elseClause| $))
                                         (|Union| (|:| |nullBranch| #2#)
                                                  (|:| |assignmentBranch|
                                                       (|Record|
                                                        (|:| |var| (|Symbol|))
                                                        (|:| |arrayIndex|
                                                             (|List|
                                                              (|Polynomial|
                                                               (|Integer|))))
                                                        (|:| |rand|
                                                             (|Record|
                                                              (|:|
                                                               |ints2Floats?|
                                                               (|Boolean|))
                                                              (|:| |expr|
                                                                   (|OutputForm|))))))
                                                  (|:| |arrayAssignmentBranch|
                                                       (|Record|
                                                        (|:| |var| (|Symbol|))
                                                        (|:| |rand|
                                                             (|OutputForm|))
                                                        (|:| |ints2Floats?|
                                                             (|Boolean|))))
                                                  (|:| |conditionalBranch|
                                                       (|Record|
                                                        (|:| |switch|
                                                             (|Switch|))
                                                        (|:| |thenClause| $)
                                                        (|:| |elseClause| $)))
                                                  (|:| |returnBranch|
                                                       (|Record|
                                                        (|:| |empty?|
                                                             (|Boolean|))
                                                        (|:| |value|
                                                             (|Record|
                                                              (|:|
                                                               |ints2Floats?|
                                                               (|Boolean|))
                                                              (|:| |expr|
                                                                   (|OutputForm|))))))
                                                  (|:| |blockBranch|
                                                       (|List| $))
                                                  (|:| |commentBranch|
                                                       (|List| (|String|)))
                                                  (|:| |callBranch| (|String|))
                                                  (|:| |forBranch|
                                                       (|Record|
                                                        (|:| |range|
                                                             (|SegmentBinding|
                                                              (|Polynomial|
                                                               (|Integer|))))
                                                        (|:| |span|
                                                             (|Polynomial|
                                                              (|Integer|)))
                                                        (|:| |body| $)))
                                                  (|:| |labelBranch|
                                                       (|SingleInteger|))
                                                  (|:| |loopBranch|
                                                       (|Record|
                                                        (|:| |switch|
                                                             (|Switch|))
                                                        (|:| |body| $)))
                                                  (|:| |commonBranch|
                                                       (|Record|
                                                        (|:| |name| (|Symbol|))
                                                        (|:| |contents|
                                                             (|List|
                                                              (|Symbol|)))))
                                                  (|:| |printBranch|
                                                       (|List|
                                                        (|OutputForm|))))
                                         #1#))
                       0)
                      (QREFELT $ 58))
                     $)
                    . #3#)
              (LETT |expr|
                    (SPADCALL |expr|
                              (|FC;getBody|
                               (QVELT
                                (PROG2 (LETT #1# |rec| . #3#)
                                    (QCDR #1#)
                                  (|check_union2| (QEQCAR #1# 3)
                                                  (|Record|
                                                   (|:| |switch| (|Switch|))
                                                   (|:| |thenClause| $)
                                                   (|:| |elseClause| $))
                                                  (|Union|
                                                   (|:| |nullBranch| #2#)
                                                   (|:| |assignmentBranch|
                                                        (|Record|
                                                         (|:| |var| (|Symbol|))
                                                         (|:| |arrayIndex|
                                                              (|List|
                                                               (|Polynomial|
                                                                (|Integer|))))
                                                         (|:| |rand|
                                                              (|Record|
                                                               (|:|
                                                                |ints2Floats?|
                                                                (|Boolean|))
                                                               (|:| |expr|
                                                                    (|OutputForm|))))))
                                                   (|:| |arrayAssignmentBranch|
                                                        (|Record|
                                                         (|:| |var| (|Symbol|))
                                                         (|:| |rand|
                                                              (|OutputForm|))
                                                         (|:| |ints2Floats?|
                                                              (|Boolean|))))
                                                   (|:| |conditionalBranch|
                                                        (|Record|
                                                         (|:| |switch|
                                                              (|Switch|))
                                                         (|:| |thenClause| $)
                                                         (|:| |elseClause| $)))
                                                   (|:| |returnBranch|
                                                        (|Record|
                                                         (|:| |empty?|
                                                              (|Boolean|))
                                                         (|:| |value|
                                                              (|Record|
                                                               (|:|
                                                                |ints2Floats?|
                                                                (|Boolean|))
                                                               (|:| |expr|
                                                                    (|OutputForm|))))))
                                                   (|:| |blockBranch|
                                                        (|List| $))
                                                   (|:| |commentBranch|
                                                        (|List| (|String|)))
                                                   (|:| |callBranch|
                                                        (|String|))
                                                   (|:| |forBranch|
                                                        (|Record|
                                                         (|:| |range|
                                                              (|SegmentBinding|
                                                               (|Polynomial|
                                                                (|Integer|))))
                                                         (|:| |span|
                                                              (|Polynomial|
                                                               (|Integer|)))
                                                         (|:| |body| $)))
                                                   (|:| |labelBranch|
                                                        (|SingleInteger|))
                                                   (|:| |loopBranch|
                                                        (|Record|
                                                         (|:| |switch|
                                                              (|Switch|))
                                                         (|:| |body| $)))
                                                   (|:| |commonBranch|
                                                        (|Record|
                                                         (|:| |name|
                                                              (|Symbol|))
                                                         (|:| |contents|
                                                              (|List|
                                                               (|Symbol|)))))
                                                   (|:| |printBranch|
                                                        (|List|
                                                         (|OutputForm|))))
                                                  #1#))
                                1)
                               $)
                              (QREFELT $ 19))
                    . #3#)
              (LETT |elseBranch|
                    (QVELT
                     (PROG2 (LETT #1# |rec| . #3#)
                         (QCDR #1#)
                       (|check_union2| (QEQCAR #1# 3)
                                       (|Record| (|:| |switch| (|Switch|))
                                                 (|:| |thenClause| $)
                                                 (|:| |elseClause| $))
                                       (|Union| (|:| |nullBranch| #2#)
                                                (|:| |assignmentBranch|
                                                     (|Record|
                                                      (|:| |var| (|Symbol|))
                                                      (|:| |arrayIndex|
                                                           (|List|
                                                            (|Polynomial|
                                                             (|Integer|))))
                                                      (|:| |rand|
                                                           (|Record|
                                                            (|:| |ints2Floats?|
                                                                 (|Boolean|))
                                                            (|:| |expr|
                                                                 (|OutputForm|))))))
                                                (|:| |arrayAssignmentBranch|
                                                     (|Record|
                                                      (|:| |var| (|Symbol|))
                                                      (|:| |rand|
                                                           (|OutputForm|))
                                                      (|:| |ints2Floats?|
                                                           (|Boolean|))))
                                                (|:| |conditionalBranch|
                                                     (|Record|
                                                      (|:| |switch| (|Switch|))
                                                      (|:| |thenClause| $)
                                                      (|:| |elseClause| $)))
                                                (|:| |returnBranch|
                                                     (|Record|
                                                      (|:| |empty?|
                                                           (|Boolean|))
                                                      (|:| |value|
                                                           (|Record|
                                                            (|:| |ints2Floats?|
                                                                 (|Boolean|))
                                                            (|:| |expr|
                                                                 (|OutputForm|))))))
                                                (|:| |blockBranch| (|List| $))
                                                (|:| |commentBranch|
                                                     (|List| (|String|)))
                                                (|:| |callBranch| (|String|))
                                                (|:| |forBranch|
                                                     (|Record|
                                                      (|:| |range|
                                                           (|SegmentBinding|
                                                            (|Polynomial|
                                                             (|Integer|))))
                                                      (|:| |span|
                                                           (|Polynomial|
                                                            (|Integer|)))
                                                      (|:| |body| $)))
                                                (|:| |labelBranch|
                                                     (|SingleInteger|))
                                                (|:| |loopBranch|
                                                     (|Record|
                                                      (|:| |switch| (|Switch|))
                                                      (|:| |body| $)))
                                                (|:| |commonBranch|
                                                     (|Record|
                                                      (|:| |name| (|Symbol|))
                                                      (|:| |contents|
                                                           (|List|
                                                            (|Symbol|)))))
                                                (|:| |printBranch|
                                                     (|List| (|OutputForm|))))
                                       #1#))
                     2)
                    . #3#)
              (COND
               ((NULL (QEQCAR (SPADCALL |elseBranch| (QREFELT $ 46)) 0))
                (EXIT
                 (COND
                  ((QEQCAR (SPADCALL |elseBranch| (QREFELT $ 46)) 2)
                   (SPADCALL |expr| (|FC;getElseIf| |elseBranch| $)
                             (QREFELT $ 19)))
                  ('T
                   (SEQ
                    (LETT |expr|
                          (SPADCALL |expr|
                                    (SPADCALL (SPADCALL 'ELSE (QREFELT $ 8))
                                              NIL (QREFELT $ 14))
                                    (QREFELT $ 19))
                          . #3#)
                    (EXIT
                     (LETT |expr|
                           (SPADCALL |expr| (|FC;getBody| |elseBranch| $)
                                     (QREFELT $ 19))
                           . #3#))))))))
              (EXIT |expr|)))) 

(SDEFUN |FC;getContinue| ((|label| |SingleInteger|) ($ |List| (|String|)))
        (SPROG
         ((|sp| (|OutputForm|)) (|cnt| (#1="CONTINUE")) (|lab| (|String|)))
         (SEQ (LETT |lab| (STRINGIMAGE |label|) . #2=(|FC;getContinue|))
              (COND
               ((SPADCALL (QCSIZE |lab|) 6 (QREFELT $ 59))
                (|error| "Label too big")))
              (LETT |cnt| #1# . #2#)
              (LETT |sp|
                    (SPADCALL (- (SPADCALL (QREFELT $ 60)) (QCSIZE |lab|))
                              (QREFELT $ 61))
                    . #2#)
              (EXIT (STRCONC |lab| |sp| |cnt|))))) 

(SDEFUN |FC;getGoto| ((|label| |SingleInteger|) ($ |List| (|String|)))
        (SPADCALL (LIST (STRCONC "GOTO " (STRINGIMAGE |label|)))
                  (QREFELT $ 22))) 

(SDEFUN |FC;getRepeat|
        ((|repRec| |Record| (|:| |switch| (|Switch|)) (|:| |body| $))
         ($ |List| (|String|)))
        (SPROG ((|bod| ($)) (|lab| (|SingleInteger|)) (|sw| (|Switch|)))
               (SEQ
                (LETT |sw| (SPADCALL (QCAR |repRec|) (QREFELT $ 62))
                      . #1=(|FC;getRepeat|))
                (LETT |lab| (|FC;newLabel| $) . #1#)
                (LETT |bod| (QCDR |repRec|) . #1#)
                (EXIT
                 (SPADCALL (|FC;getContinue| |lab| $)
                           (SPADCALL (|FC;getBody| |bod| $)
                                     (|FC;fortFormatIfGoto|
                                      (SPADCALL |sw| (QREFELT $ 58)) |lab| $)
                                     (QREFELT $ 19))
                           (QREFELT $ 19)))))) 

(SDEFUN |FC;getWhile|
        ((|whileRec| |Record| (|:| |switch| (|Switch|)) (|:| |body| $))
         ($ |List| (|String|)))
        (SPROG
         ((|rl1| (|List| (|List| (|String|)))) (|ig| (|List| (|String|)))
          (|bod| ($)) (|lab2| #1=(|SingleInteger|)) (|lab1| #1#)
          (|sw| (|Switch|)))
         (SEQ
          (LETT |sw| (SPADCALL (QCAR |whileRec|) (QREFELT $ 62))
                . #2=(|FC;getWhile|))
          (LETT |lab1| (|FC;newLabel| $) . #2#)
          (LETT |lab2| (|FC;newLabel| $) . #2#)
          (LETT |bod| (QCDR |whileRec|) . #2#)
          (LETT |ig|
                (|FC;fortFormatLabelledIfGoto| (SPADCALL |sw| (QREFELT $ 58))
                 |lab1| |lab2| $)
                . #2#)
          (LETT |rl1|
                (LIST |ig| (|FC;getBody| |bod| $)
                      (|FC;getBody| (SPADCALL |lab1| (QREFELT $ 63)) $)
                      (|FC;getContinue| |lab2| $))
                . #2#)
          (EXIT (SPADCALL |rl1| (QREFELT $ 64)))))) 

(SDEFUN |FC;getArrayAssign|
        ((|rec| |Record| (|:| |var| (|Symbol|)) (|:| |rand| (|OutputForm|))
          (|:| |ints2Floats?| (|Boolean|)))
         ($ |List| (|String|)))
        (|FC;getfortarrayexp| (QVELT |rec| 0) (QVELT |rec| 1) (QVELT |rec| 2)
         $)) 

(SDEFUN |FC;getAssign|
        ((|rec| |Record| (|:| |var| (|Symbol|))
          (|:| |arrayIndex| (|List| (|Polynomial| (|Integer|))))
          (|:| |rand|
               (|Record| (|:| |ints2Floats?| (|Boolean|))
                         (|:| |expr| (|OutputForm|)))))
         ($ |List| (|String|)))
        (SPROG
         ((|ex| #1=(|OutputForm|))
          (|ass| (|Record| (|:| |ints2Floats?| (|Boolean|)) (|:| |expr| #1#)))
          (|lhs| (|OutputForm|))
          (|indices| (|List| (|Polynomial| (|Integer|)))))
         (SEQ (LETT |indices| (QVELT |rec| 1) . #2=(|FC;getAssign|))
              (LETT |lhs| (SPADCALL (QVELT |rec| 0) (QREFELT $ 8)) . #2#)
              (COND
               ((NULL (NULL |indices|))
                (LETT |lhs|
                      (SPADCALL |lhs|
                                (SPADCALL (ELT $ 65) |indices| (QREFELT $ 70))
                                (QREFELT $ 10))
                      . #2#)))
              (LETT |ass| (QVELT |rec| 2) . #2#) (LETT |ex| (QCDR |ass|) . #2#)
              (EXIT (|FC;get_assignment| |lhs| |ex| (QCAR |ass|) $))))) 

(SDEFUN |FC;getCond|
        ((|rec| |Record| (|:| |switch| (|Switch|)) (|:| |thenClause| $)
          (|:| |elseClause| $))
         ($ |List| (|String|)))
        (SPROG ((|expr| (|List| (|String|))) (|elseBranch| ($)))
               (SEQ
                (LETT |expr|
                      (SPADCALL
                       (|FC;fortFormatIf|
                        (SPADCALL (QVELT |rec| 0) (QREFELT $ 58)) $)
                       (|FC;getBody| (QVELT |rec| 1) $) (QREFELT $ 19))
                      . #1=(|FC;getCond|))
                (LETT |elseBranch| (QVELT |rec| 2) . #1#)
                (COND
                 ((NULL (QEQCAR (SPADCALL |elseBranch| (QREFELT $ 46)) 0))
                  (COND
                   ((QEQCAR (SPADCALL |elseBranch| (QREFELT $ 46)) 2)
                    (LETT |expr|
                          (SPADCALL |expr| (|FC;getElseIf| |elseBranch| $)
                                    (QREFELT $ 19))
                          . #1#))
                   ('T
                    (LETT |expr|
                          (SPADCALL |expr|
                                    (SPADCALL
                                     (SPADCALL (SPADCALL 'ELSE (QREFELT $ 8))
                                               NIL (QREFELT $ 14))
                                     (|FC;getBody| |elseBranch| $)
                                     (QREFELT $ 19))
                                    (QREFELT $ 19))
                          . #1#)))))
                (EXIT
                 (SPADCALL |expr|
                           (SPADCALL (SPADCALL 'ENDIF (QREFELT $ 8)) NIL
                                     (QREFELT $ 14))
                           (QREFELT $ 19)))))) 

(SDEFUN |FC;getComment| ((|rec| |List| (|String|)) ($ |List| (|String|)))
        (SPROG ((#1=#:G904 NIL) (|c| NIL) (#2=#:G903 NIL))
               (SEQ
                (PROGN
                 (LETT #2# NIL . #3=(|FC;getComment|))
                 (SEQ (LETT |c| NIL . #3#) (LETT #1# |rec| . #3#) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |c| (CAR #1#) . #3#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #2# (CONS (STRCONC "C     " |c|) #2#) . #3#)))
                      (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                      (EXIT (NREVERSE #2#))))))) 

(SDEFUN |FC;getCall| ((|rec| |String|) ($ |List| (|String|)))
        (SPROG ((|expr| (|String|)))
               (SEQ (LETT |expr| (STRCONC "CALL " |rec|) |FC;getCall|)
                    (EXIT
                     (COND
                      ((SPADCALL (QCSIZE |expr|) 1320 (QREFELT $ 59))
                       (|error| "Fortran CALL too large"))
                      ('T (SPADCALL (LIST |expr|) (QREFELT $ 22)))))))) 

(SDEFUN |FC;getFor|
        ((|rec| |Record|
          (|:| |range| #1=(|SegmentBinding| (|Polynomial| (|Integer|))))
          (|:| |span| #2=(|Polynomial| (|Integer|))) (|:| |body| $))
         ($ |List| (|String|)))
        (SPROG
         ((|expr| (|List| (|String|))) (|lab| (|SingleInteger|))
          (|increment| #2#) (|rnge| #1#))
         (SEQ (LETT |rnge| (QVELT |rec| 0) . #3=(|FC;getFor|))
              (LETT |increment| (QVELT |rec| 1) . #3#)
              (LETT |lab| (|FC;newLabel| $) . #3#)
              (SPADCALL (SPADCALL |rnge| (QREFELT $ 72))
                        (SPADCALL (QREFELT $ 74)) (QREFELT $ 76))
              (LETT |expr|
                    (|FC;fortFormatDo| (SPADCALL |rnge| (QREFELT $ 72))
                     (SPADCALL
                      (SPADCALL (SPADCALL |rnge| (QREFELT $ 78))
                                (QREFELT $ 79))
                      (QREFELT $ 65))
                     (SPADCALL
                      (SPADCALL (SPADCALL |rnge| (QREFELT $ 78))
                                (QREFELT $ 80))
                      (QREFELT $ 65))
                     (SPADCALL |increment| (QREFELT $ 65)) |lab| $)
                    . #3#)
              (EXIT
               (SPADCALL |expr|
                         (SPADCALL (|FC;getBody| (QVELT |rec| 2) $)
                                   (|FC;getContinue| |lab| $) (QREFELT $ 19))
                         (QREFELT $ 19)))))) 

(SDEFUN |FC;getCode;$L;36| ((|f| $) ($ |List| (|String|)))
        (SPROG
         ((#1=#:G942 NIL) (#2=#:G943 NIL) (#3=#:G941 NIL) (#4=#:G940 NIL)
          (#5=#:G939 NIL) (#6=#:G938 NIL) (#7=#:G937 NIL) (#8=#:G936 NIL)
          (#9=#:G935 NIL) (#10=#:G934 NIL) (#11=#:G933 NIL) (#12=#:G932 NIL)
          (|rec|
           (|Union| (|:| |nullBranch| #13="null")
                    (|:| |assignmentBranch|
                         (|Record| (|:| |var| (|Symbol|))
                                   (|:| |arrayIndex|
                                        (|List| (|Polynomial| (|Integer|))))
                                   (|:| |rand|
                                        (|Record|
                                         (|:| |ints2Floats?| (|Boolean|))
                                         (|:| |expr| (|OutputForm|))))))
                    (|:| |arrayAssignmentBranch|
                         (|Record| (|:| |var| (|Symbol|))
                                   (|:| |rand| (|OutputForm|))
                                   (|:| |ints2Floats?| (|Boolean|))))
                    (|:| |conditionalBranch|
                         (|Record| (|:| |switch| (|Switch|))
                                   (|:| |thenClause| $) (|:| |elseClause| $)))
                    (|:| |returnBranch|
                         (|Record| (|:| |empty?| (|Boolean|))
                                   (|:| |value|
                                        (|Record|
                                         (|:| |ints2Floats?| (|Boolean|))
                                         (|:| |expr| (|OutputForm|))))))
                    (|:| |blockBranch| (|List| $))
                    (|:| |commentBranch| (|List| (|String|)))
                    (|:| |callBranch| (|String|))
                    (|:| |forBranch|
                         (|Record|
                          (|:| |range|
                               (|SegmentBinding| (|Polynomial| (|Integer|))))
                          (|:| |span| (|Polynomial| (|Integer|)))
                          (|:| |body| $)))
                    (|:| |labelBranch| (|SingleInteger|))
                    (|:| |loopBranch|
                         (|Record| (|:| |switch| (|Switch|)) (|:| |body| $)))
                    (|:| |commonBranch|
                         (|Record| (|:| |name| (|Symbol|))
                                   (|:| |contents| (|List| (|Symbol|)))))
                    (|:| |printBranch| (|List| (|OutputForm|)))))
          (|opp|
           (|Union| (|:| |Null| "null") (|:| |Assignment| "assignment")
                    (|:| |Conditional| "conditional") (|:| |Return| "return")
                    (|:| |Block| "block") (|:| |Comment| "comment")
                    (|:| |Call| "call") (|:| |For| "for") (|:| |While| "while")
                    (|:| |Repeat| "repeat") (|:| |Goto| "goto")
                    (|:| |Continue| "continue")
                    (|:| |ArrayAssignment| "arrayAssignment")
                    (|:| |Save| "save") (|:| |Stop| "stop")
                    (|:| |Common| "common") (|:| |Print| "print"))))
         (SEQ
          (LETT |opp| (SPADCALL |f| (QREFELT $ 46)) . #14=(|FC;getCode;$L;36|))
          (LETT |rec| (SPADCALL |f| (QREFELT $ 56)) . #14#)
          (EXIT
           (COND
            ((QEQCAR |opp| 1)
             (|FC;getAssign|
              (PROG2 (LETT #12# |rec| . #14#)
                  (QCDR #12#)
                (|check_union2| (QEQCAR #12# 1)
                                (|Record| (|:| |var| (|Symbol|))
                                          (|:| |arrayIndex|
                                               (|List|
                                                (|Polynomial| (|Integer|))))
                                          (|:| |rand|
                                               (|Record|
                                                (|:| |ints2Floats?|
                                                     (|Boolean|))
                                                (|:| |expr| (|OutputForm|)))))
                                (|Union| (|:| |nullBranch| #13#)
                                         (|:| |assignmentBranch|
                                              (|Record| (|:| |var| (|Symbol|))
                                                        (|:| |arrayIndex|
                                                             (|List|
                                                              (|Polynomial|
                                                               (|Integer|))))
                                                        (|:| |rand|
                                                             (|Record|
                                                              (|:|
                                                               |ints2Floats?|
                                                               (|Boolean|))
                                                              (|:| |expr|
                                                                   (|OutputForm|))))))
                                         (|:| |arrayAssignmentBranch|
                                              (|Record| (|:| |var| (|Symbol|))
                                                        (|:| |rand|
                                                             (|OutputForm|))
                                                        (|:| |ints2Floats?|
                                                             (|Boolean|))))
                                         (|:| |conditionalBranch|
                                              (|Record|
                                               (|:| |switch| (|Switch|))
                                               (|:| |thenClause| $)
                                               (|:| |elseClause| $)))
                                         (|:| |returnBranch|
                                              (|Record|
                                               (|:| |empty?| (|Boolean|))
                                               (|:| |value|
                                                    (|Record|
                                                     (|:| |ints2Floats?|
                                                          (|Boolean|))
                                                     (|:| |expr|
                                                          (|OutputForm|))))))
                                         (|:| |blockBranch| (|List| $))
                                         (|:| |commentBranch|
                                              (|List| (|String|)))
                                         (|:| |callBranch| (|String|))
                                         (|:| |forBranch|
                                              (|Record|
                                               (|:| |range|
                                                    (|SegmentBinding|
                                                     (|Polynomial|
                                                      (|Integer|))))
                                               (|:| |span|
                                                    (|Polynomial| (|Integer|)))
                                               (|:| |body| $)))
                                         (|:| |labelBranch| (|SingleInteger|))
                                         (|:| |loopBranch|
                                              (|Record|
                                               (|:| |switch| (|Switch|))
                                               (|:| |body| $)))
                                         (|:| |commonBranch|
                                              (|Record| (|:| |name| (|Symbol|))
                                                        (|:| |contents|
                                                             (|List|
                                                              (|Symbol|)))))
                                         (|:| |printBranch|
                                              (|List| (|OutputForm|))))
                                #12#))
              $))
            ((QEQCAR |opp| 12)
             (|FC;getArrayAssign|
              (PROG2 (LETT #11# |rec| . #14#)
                  (QCDR #11#)
                (|check_union2| (QEQCAR #11# 2)
                                (|Record| (|:| |var| (|Symbol|))
                                          (|:| |rand| (|OutputForm|))
                                          (|:| |ints2Floats?| (|Boolean|)))
                                (|Union| (|:| |nullBranch| #13#)
                                         (|:| |assignmentBranch|
                                              (|Record| (|:| |var| (|Symbol|))
                                                        (|:| |arrayIndex|
                                                             (|List|
                                                              (|Polynomial|
                                                               (|Integer|))))
                                                        (|:| |rand|
                                                             (|Record|
                                                              (|:|
                                                               |ints2Floats?|
                                                               (|Boolean|))
                                                              (|:| |expr|
                                                                   (|OutputForm|))))))
                                         (|:| |arrayAssignmentBranch|
                                              (|Record| (|:| |var| (|Symbol|))
                                                        (|:| |rand|
                                                             (|OutputForm|))
                                                        (|:| |ints2Floats?|
                                                             (|Boolean|))))
                                         (|:| |conditionalBranch|
                                              (|Record|
                                               (|:| |switch| (|Switch|))
                                               (|:| |thenClause| $)
                                               (|:| |elseClause| $)))
                                         (|:| |returnBranch|
                                              (|Record|
                                               (|:| |empty?| (|Boolean|))
                                               (|:| |value|
                                                    (|Record|
                                                     (|:| |ints2Floats?|
                                                          (|Boolean|))
                                                     (|:| |expr|
                                                          (|OutputForm|))))))
                                         (|:| |blockBranch| (|List| $))
                                         (|:| |commentBranch|
                                              (|List| (|String|)))
                                         (|:| |callBranch| (|String|))
                                         (|:| |forBranch|
                                              (|Record|
                                               (|:| |range|
                                                    (|SegmentBinding|
                                                     (|Polynomial|
                                                      (|Integer|))))
                                               (|:| |span|
                                                    (|Polynomial| (|Integer|)))
                                               (|:| |body| $)))
                                         (|:| |labelBranch| (|SingleInteger|))
                                         (|:| |loopBranch|
                                              (|Record|
                                               (|:| |switch| (|Switch|))
                                               (|:| |body| $)))
                                         (|:| |commonBranch|
                                              (|Record| (|:| |name| (|Symbol|))
                                                        (|:| |contents|
                                                             (|List|
                                                              (|Symbol|)))))
                                         (|:| |printBranch|
                                              (|List| (|OutputForm|))))
                                #11#))
              $))
            ((QEQCAR |opp| 2)
             (|FC;getCond|
              (PROG2 (LETT #10# |rec| . #14#)
                  (QCDR #10#)
                (|check_union2| (QEQCAR #10# 3)
                                (|Record| (|:| |switch| (|Switch|))
                                          (|:| |thenClause| $)
                                          (|:| |elseClause| $))
                                (|Union| (|:| |nullBranch| #13#)
                                         (|:| |assignmentBranch|
                                              (|Record| (|:| |var| (|Symbol|))
                                                        (|:| |arrayIndex|
                                                             (|List|
                                                              (|Polynomial|
                                                               (|Integer|))))
                                                        (|:| |rand|
                                                             (|Record|
                                                              (|:|
                                                               |ints2Floats?|
                                                               (|Boolean|))
                                                              (|:| |expr|
                                                                   (|OutputForm|))))))
                                         (|:| |arrayAssignmentBranch|
                                              (|Record| (|:| |var| (|Symbol|))
                                                        (|:| |rand|
                                                             (|OutputForm|))
                                                        (|:| |ints2Floats?|
                                                             (|Boolean|))))
                                         (|:| |conditionalBranch|
                                              (|Record|
                                               (|:| |switch| (|Switch|))
                                               (|:| |thenClause| $)
                                               (|:| |elseClause| $)))
                                         (|:| |returnBranch|
                                              (|Record|
                                               (|:| |empty?| (|Boolean|))
                                               (|:| |value|
                                                    (|Record|
                                                     (|:| |ints2Floats?|
                                                          (|Boolean|))
                                                     (|:| |expr|
                                                          (|OutputForm|))))))
                                         (|:| |blockBranch| (|List| $))
                                         (|:| |commentBranch|
                                              (|List| (|String|)))
                                         (|:| |callBranch| (|String|))
                                         (|:| |forBranch|
                                              (|Record|
                                               (|:| |range|
                                                    (|SegmentBinding|
                                                     (|Polynomial|
                                                      (|Integer|))))
                                               (|:| |span|
                                                    (|Polynomial| (|Integer|)))
                                               (|:| |body| $)))
                                         (|:| |labelBranch| (|SingleInteger|))
                                         (|:| |loopBranch|
                                              (|Record|
                                               (|:| |switch| (|Switch|))
                                               (|:| |body| $)))
                                         (|:| |commonBranch|
                                              (|Record| (|:| |name| (|Symbol|))
                                                        (|:| |contents|
                                                             (|List|
                                                              (|Symbol|)))))
                                         (|:| |printBranch|
                                              (|List| (|OutputForm|))))
                                #10#))
              $))
            ((QEQCAR |opp| 3)
             (|FC;getReturn|
              (PROG2 (LETT #9# |rec| . #14#)
                  (QCDR #9#)
                (|check_union2| (QEQCAR #9# 4)
                                (|Record| (|:| |empty?| (|Boolean|))
                                          (|:| |value|
                                               (|Record|
                                                (|:| |ints2Floats?|
                                                     (|Boolean|))
                                                (|:| |expr| (|OutputForm|)))))
                                (|Union| (|:| |nullBranch| #13#)
                                         (|:| |assignmentBranch|
                                              (|Record| (|:| |var| (|Symbol|))
                                                        (|:| |arrayIndex|
                                                             (|List|
                                                              (|Polynomial|
                                                               (|Integer|))))
                                                        (|:| |rand|
                                                             (|Record|
                                                              (|:|
                                                               |ints2Floats?|
                                                               (|Boolean|))
                                                              (|:| |expr|
                                                                   (|OutputForm|))))))
                                         (|:| |arrayAssignmentBranch|
                                              (|Record| (|:| |var| (|Symbol|))
                                                        (|:| |rand|
                                                             (|OutputForm|))
                                                        (|:| |ints2Floats?|
                                                             (|Boolean|))))
                                         (|:| |conditionalBranch|
                                              (|Record|
                                               (|:| |switch| (|Switch|))
                                               (|:| |thenClause| $)
                                               (|:| |elseClause| $)))
                                         (|:| |returnBranch|
                                              (|Record|
                                               (|:| |empty?| (|Boolean|))
                                               (|:| |value|
                                                    (|Record|
                                                     (|:| |ints2Floats?|
                                                          (|Boolean|))
                                                     (|:| |expr|
                                                          (|OutputForm|))))))
                                         (|:| |blockBranch| (|List| $))
                                         (|:| |commentBranch|
                                              (|List| (|String|)))
                                         (|:| |callBranch| (|String|))
                                         (|:| |forBranch|
                                              (|Record|
                                               (|:| |range|
                                                    (|SegmentBinding|
                                                     (|Polynomial|
                                                      (|Integer|))))
                                               (|:| |span|
                                                    (|Polynomial| (|Integer|)))
                                               (|:| |body| $)))
                                         (|:| |labelBranch| (|SingleInteger|))
                                         (|:| |loopBranch|
                                              (|Record|
                                               (|:| |switch| (|Switch|))
                                               (|:| |body| $)))
                                         (|:| |commonBranch|
                                              (|Record| (|:| |name| (|Symbol|))
                                                        (|:| |contents|
                                                             (|List|
                                                              (|Symbol|)))))
                                         (|:| |printBranch|
                                              (|List| (|OutputForm|))))
                                #9#))
              $))
            ((QEQCAR |opp| 4)
             (|FC;getBlock|
              (PROG2 (LETT #8# |rec| . #14#)
                  (QCDR #8#)
                (|check_union2| (QEQCAR #8# 5) (|List| $)
                                (|Union| (|:| |nullBranch| #13#)
                                         (|:| |assignmentBranch|
                                              (|Record| (|:| |var| (|Symbol|))
                                                        (|:| |arrayIndex|
                                                             (|List|
                                                              (|Polynomial|
                                                               (|Integer|))))
                                                        (|:| |rand|
                                                             (|Record|
                                                              (|:|
                                                               |ints2Floats?|
                                                               (|Boolean|))
                                                              (|:| |expr|
                                                                   (|OutputForm|))))))
                                         (|:| |arrayAssignmentBranch|
                                              (|Record| (|:| |var| (|Symbol|))
                                                        (|:| |rand|
                                                             (|OutputForm|))
                                                        (|:| |ints2Floats?|
                                                             (|Boolean|))))
                                         (|:| |conditionalBranch|
                                              (|Record|
                                               (|:| |switch| (|Switch|))
                                               (|:| |thenClause| $)
                                               (|:| |elseClause| $)))
                                         (|:| |returnBranch|
                                              (|Record|
                                               (|:| |empty?| (|Boolean|))
                                               (|:| |value|
                                                    (|Record|
                                                     (|:| |ints2Floats?|
                                                          (|Boolean|))
                                                     (|:| |expr|
                                                          (|OutputForm|))))))
                                         (|:| |blockBranch| (|List| $))
                                         (|:| |commentBranch|
                                              (|List| (|String|)))
                                         (|:| |callBranch| (|String|))
                                         (|:| |forBranch|
                                              (|Record|
                                               (|:| |range|
                                                    (|SegmentBinding|
                                                     (|Polynomial|
                                                      (|Integer|))))
                                               (|:| |span|
                                                    (|Polynomial| (|Integer|)))
                                               (|:| |body| $)))
                                         (|:| |labelBranch| (|SingleInteger|))
                                         (|:| |loopBranch|
                                              (|Record|
                                               (|:| |switch| (|Switch|))
                                               (|:| |body| $)))
                                         (|:| |commonBranch|
                                              (|Record| (|:| |name| (|Symbol|))
                                                        (|:| |contents|
                                                             (|List|
                                                              (|Symbol|)))))
                                         (|:| |printBranch|
                                              (|List| (|OutputForm|))))
                                #8#))
              $))
            ((QEQCAR |opp| 5)
             (|FC;getComment|
              (PROG2 (LETT #7# |rec| . #14#)
                  (QCDR #7#)
                (|check_union2| (QEQCAR #7# 6) (|List| (|String|))
                                (|Union| (|:| |nullBranch| #13#)
                                         (|:| |assignmentBranch|
                                              (|Record| (|:| |var| (|Symbol|))
                                                        (|:| |arrayIndex|
                                                             (|List|
                                                              (|Polynomial|
                                                               (|Integer|))))
                                                        (|:| |rand|
                                                             (|Record|
                                                              (|:|
                                                               |ints2Floats?|
                                                               (|Boolean|))
                                                              (|:| |expr|
                                                                   (|OutputForm|))))))
                                         (|:| |arrayAssignmentBranch|
                                              (|Record| (|:| |var| (|Symbol|))
                                                        (|:| |rand|
                                                             (|OutputForm|))
                                                        (|:| |ints2Floats?|
                                                             (|Boolean|))))
                                         (|:| |conditionalBranch|
                                              (|Record|
                                               (|:| |switch| (|Switch|))
                                               (|:| |thenClause| $)
                                               (|:| |elseClause| $)))
                                         (|:| |returnBranch|
                                              (|Record|
                                               (|:| |empty?| (|Boolean|))
                                               (|:| |value|
                                                    (|Record|
                                                     (|:| |ints2Floats?|
                                                          (|Boolean|))
                                                     (|:| |expr|
                                                          (|OutputForm|))))))
                                         (|:| |blockBranch| (|List| $))
                                         (|:| |commentBranch|
                                              (|List| (|String|)))
                                         (|:| |callBranch| (|String|))
                                         (|:| |forBranch|
                                              (|Record|
                                               (|:| |range|
                                                    (|SegmentBinding|
                                                     (|Polynomial|
                                                      (|Integer|))))
                                               (|:| |span|
                                                    (|Polynomial| (|Integer|)))
                                               (|:| |body| $)))
                                         (|:| |labelBranch| (|SingleInteger|))
                                         (|:| |loopBranch|
                                              (|Record|
                                               (|:| |switch| (|Switch|))
                                               (|:| |body| $)))
                                         (|:| |commonBranch|
                                              (|Record| (|:| |name| (|Symbol|))
                                                        (|:| |contents|
                                                             (|List|
                                                              (|Symbol|)))))
                                         (|:| |printBranch|
                                              (|List| (|OutputForm|))))
                                #7#))
              $))
            ((QEQCAR |opp| 6)
             (|FC;getCall|
              (PROG2 (LETT #6# |rec| . #14#)
                  (QCDR #6#)
                (|check_union2| (QEQCAR #6# 7) (|String|)
                                (|Union| (|:| |nullBranch| #13#)
                                         (|:| |assignmentBranch|
                                              (|Record| (|:| |var| (|Symbol|))
                                                        (|:| |arrayIndex|
                                                             (|List|
                                                              (|Polynomial|
                                                               (|Integer|))))
                                                        (|:| |rand|
                                                             (|Record|
                                                              (|:|
                                                               |ints2Floats?|
                                                               (|Boolean|))
                                                              (|:| |expr|
                                                                   (|OutputForm|))))))
                                         (|:| |arrayAssignmentBranch|
                                              (|Record| (|:| |var| (|Symbol|))
                                                        (|:| |rand|
                                                             (|OutputForm|))
                                                        (|:| |ints2Floats?|
                                                             (|Boolean|))))
                                         (|:| |conditionalBranch|
                                              (|Record|
                                               (|:| |switch| (|Switch|))
                                               (|:| |thenClause| $)
                                               (|:| |elseClause| $)))
                                         (|:| |returnBranch|
                                              (|Record|
                                               (|:| |empty?| (|Boolean|))
                                               (|:| |value|
                                                    (|Record|
                                                     (|:| |ints2Floats?|
                                                          (|Boolean|))
                                                     (|:| |expr|
                                                          (|OutputForm|))))))
                                         (|:| |blockBranch| (|List| $))
                                         (|:| |commentBranch|
                                              (|List| (|String|)))
                                         (|:| |callBranch| (|String|))
                                         (|:| |forBranch|
                                              (|Record|
                                               (|:| |range|
                                                    (|SegmentBinding|
                                                     (|Polynomial|
                                                      (|Integer|))))
                                               (|:| |span|
                                                    (|Polynomial| (|Integer|)))
                                               (|:| |body| $)))
                                         (|:| |labelBranch| (|SingleInteger|))
                                         (|:| |loopBranch|
                                              (|Record|
                                               (|:| |switch| (|Switch|))
                                               (|:| |body| $)))
                                         (|:| |commonBranch|
                                              (|Record| (|:| |name| (|Symbol|))
                                                        (|:| |contents|
                                                             (|List|
                                                              (|Symbol|)))))
                                         (|:| |printBranch|
                                              (|List| (|OutputForm|))))
                                #6#))
              $))
            ((QEQCAR |opp| 7)
             (|FC;getFor|
              (PROG2 (LETT #5# |rec| . #14#)
                  (QCDR #5#)
                (|check_union2| (QEQCAR #5# 8)
                                (|Record|
                                 (|:| |range|
                                      (|SegmentBinding|
                                       (|Polynomial| (|Integer|))))
                                 (|:| |span| (|Polynomial| (|Integer|)))
                                 (|:| |body| $))
                                (|Union| (|:| |nullBranch| #13#)
                                         (|:| |assignmentBranch|
                                              (|Record| (|:| |var| (|Symbol|))
                                                        (|:| |arrayIndex|
                                                             (|List|
                                                              (|Polynomial|
                                                               (|Integer|))))
                                                        (|:| |rand|
                                                             (|Record|
                                                              (|:|
                                                               |ints2Floats?|
                                                               (|Boolean|))
                                                              (|:| |expr|
                                                                   (|OutputForm|))))))
                                         (|:| |arrayAssignmentBranch|
                                              (|Record| (|:| |var| (|Symbol|))
                                                        (|:| |rand|
                                                             (|OutputForm|))
                                                        (|:| |ints2Floats?|
                                                             (|Boolean|))))
                                         (|:| |conditionalBranch|
                                              (|Record|
                                               (|:| |switch| (|Switch|))
                                               (|:| |thenClause| $)
                                               (|:| |elseClause| $)))
                                         (|:| |returnBranch|
                                              (|Record|
                                               (|:| |empty?| (|Boolean|))
                                               (|:| |value|
                                                    (|Record|
                                                     (|:| |ints2Floats?|
                                                          (|Boolean|))
                                                     (|:| |expr|
                                                          (|OutputForm|))))))
                                         (|:| |blockBranch| (|List| $))
                                         (|:| |commentBranch|
                                              (|List| (|String|)))
                                         (|:| |callBranch| (|String|))
                                         (|:| |forBranch|
                                              (|Record|
                                               (|:| |range|
                                                    (|SegmentBinding|
                                                     (|Polynomial|
                                                      (|Integer|))))
                                               (|:| |span|
                                                    (|Polynomial| (|Integer|)))
                                               (|:| |body| $)))
                                         (|:| |labelBranch| (|SingleInteger|))
                                         (|:| |loopBranch|
                                              (|Record|
                                               (|:| |switch| (|Switch|))
                                               (|:| |body| $)))
                                         (|:| |commonBranch|
                                              (|Record| (|:| |name| (|Symbol|))
                                                        (|:| |contents|
                                                             (|List|
                                                              (|Symbol|)))))
                                         (|:| |printBranch|
                                              (|List| (|OutputForm|))))
                                #5#))
              $))
            ((QEQCAR |opp| 11)
             (|FC;getContinue|
              (PROG2 (LETT #4# |rec| . #14#)
                  (QCDR #4#)
                (|check_union2| (QEQCAR #4# 9) (|SingleInteger|)
                                (|Union| (|:| |nullBranch| #13#)
                                         (|:| |assignmentBranch|
                                              (|Record| (|:| |var| (|Symbol|))
                                                        (|:| |arrayIndex|
                                                             (|List|
                                                              (|Polynomial|
                                                               (|Integer|))))
                                                        (|:| |rand|
                                                             (|Record|
                                                              (|:|
                                                               |ints2Floats?|
                                                               (|Boolean|))
                                                              (|:| |expr|
                                                                   (|OutputForm|))))))
                                         (|:| |arrayAssignmentBranch|
                                              (|Record| (|:| |var| (|Symbol|))
                                                        (|:| |rand|
                                                             (|OutputForm|))
                                                        (|:| |ints2Floats?|
                                                             (|Boolean|))))
                                         (|:| |conditionalBranch|
                                              (|Record|
                                               (|:| |switch| (|Switch|))
                                               (|:| |thenClause| $)
                                               (|:| |elseClause| $)))
                                         (|:| |returnBranch|
                                              (|Record|
                                               (|:| |empty?| (|Boolean|))
                                               (|:| |value|
                                                    (|Record|
                                                     (|:| |ints2Floats?|
                                                          (|Boolean|))
                                                     (|:| |expr|
                                                          (|OutputForm|))))))
                                         (|:| |blockBranch| (|List| $))
                                         (|:| |commentBranch|
                                              (|List| (|String|)))
                                         (|:| |callBranch| (|String|))
                                         (|:| |forBranch|
                                              (|Record|
                                               (|:| |range|
                                                    (|SegmentBinding|
                                                     (|Polynomial|
                                                      (|Integer|))))
                                               (|:| |span|
                                                    (|Polynomial| (|Integer|)))
                                               (|:| |body| $)))
                                         (|:| |labelBranch| (|SingleInteger|))
                                         (|:| |loopBranch|
                                              (|Record|
                                               (|:| |switch| (|Switch|))
                                               (|:| |body| $)))
                                         (|:| |commonBranch|
                                              (|Record| (|:| |name| (|Symbol|))
                                                        (|:| |contents|
                                                             (|List|
                                                              (|Symbol|)))))
                                         (|:| |printBranch|
                                              (|List| (|OutputForm|))))
                                #4#))
              $))
            ((QEQCAR |opp| 10)
             (|FC;getGoto|
              (PROG2 (LETT #4# |rec| . #14#)
                  (QCDR #4#)
                (|check_union2| (QEQCAR #4# 9) (|SingleInteger|)
                                (|Union| (|:| |nullBranch| #13#)
                                         (|:| |assignmentBranch|
                                              (|Record| (|:| |var| (|Symbol|))
                                                        (|:| |arrayIndex|
                                                             (|List|
                                                              (|Polynomial|
                                                               (|Integer|))))
                                                        (|:| |rand|
                                                             (|Record|
                                                              (|:|
                                                               |ints2Floats?|
                                                               (|Boolean|))
                                                              (|:| |expr|
                                                                   (|OutputForm|))))))
                                         (|:| |arrayAssignmentBranch|
                                              (|Record| (|:| |var| (|Symbol|))
                                                        (|:| |rand|
                                                             (|OutputForm|))
                                                        (|:| |ints2Floats?|
                                                             (|Boolean|))))
                                         (|:| |conditionalBranch|
                                              (|Record|
                                               (|:| |switch| (|Switch|))
                                               (|:| |thenClause| $)
                                               (|:| |elseClause| $)))
                                         (|:| |returnBranch|
                                              (|Record|
                                               (|:| |empty?| (|Boolean|))
                                               (|:| |value|
                                                    (|Record|
                                                     (|:| |ints2Floats?|
                                                          (|Boolean|))
                                                     (|:| |expr|
                                                          (|OutputForm|))))))
                                         (|:| |blockBranch| (|List| $))
                                         (|:| |commentBranch|
                                              (|List| (|String|)))
                                         (|:| |callBranch| (|String|))
                                         (|:| |forBranch|
                                              (|Record|
                                               (|:| |range|
                                                    (|SegmentBinding|
                                                     (|Polynomial|
                                                      (|Integer|))))
                                               (|:| |span|
                                                    (|Polynomial| (|Integer|)))
                                               (|:| |body| $)))
                                         (|:| |labelBranch| (|SingleInteger|))
                                         (|:| |loopBranch|
                                              (|Record|
                                               (|:| |switch| (|Switch|))
                                               (|:| |body| $)))
                                         (|:| |commonBranch|
                                              (|Record| (|:| |name| (|Symbol|))
                                                        (|:| |contents|
                                                             (|List|
                                                              (|Symbol|)))))
                                         (|:| |printBranch|
                                              (|List| (|OutputForm|))))
                                #4#))
              $))
            ((QEQCAR |opp| 9)
             (|FC;getRepeat|
              (PROG2 (LETT #3# |rec| . #14#)
                  (QCDR #3#)
                (|check_union2| (QEQCAR #3# 10)
                                (|Record| (|:| |switch| (|Switch|))
                                          (|:| |body| $))
                                (|Union| (|:| |nullBranch| #13#)
                                         (|:| |assignmentBranch|
                                              (|Record| (|:| |var| (|Symbol|))
                                                        (|:| |arrayIndex|
                                                             (|List|
                                                              (|Polynomial|
                                                               (|Integer|))))
                                                        (|:| |rand|
                                                             (|Record|
                                                              (|:|
                                                               |ints2Floats?|
                                                               (|Boolean|))
                                                              (|:| |expr|
                                                                   (|OutputForm|))))))
                                         (|:| |arrayAssignmentBranch|
                                              (|Record| (|:| |var| (|Symbol|))
                                                        (|:| |rand|
                                                             (|OutputForm|))
                                                        (|:| |ints2Floats?|
                                                             (|Boolean|))))
                                         (|:| |conditionalBranch|
                                              (|Record|
                                               (|:| |switch| (|Switch|))
                                               (|:| |thenClause| $)
                                               (|:| |elseClause| $)))
                                         (|:| |returnBranch|
                                              (|Record|
                                               (|:| |empty?| (|Boolean|))
                                               (|:| |value|
                                                    (|Record|
                                                     (|:| |ints2Floats?|
                                                          (|Boolean|))
                                                     (|:| |expr|
                                                          (|OutputForm|))))))
                                         (|:| |blockBranch| (|List| $))
                                         (|:| |commentBranch|
                                              (|List| (|String|)))
                                         (|:| |callBranch| (|String|))
                                         (|:| |forBranch|
                                              (|Record|
                                               (|:| |range|
                                                    (|SegmentBinding|
                                                     (|Polynomial|
                                                      (|Integer|))))
                                               (|:| |span|
                                                    (|Polynomial| (|Integer|)))
                                               (|:| |body| $)))
                                         (|:| |labelBranch| (|SingleInteger|))
                                         (|:| |loopBranch|
                                              (|Record|
                                               (|:| |switch| (|Switch|))
                                               (|:| |body| $)))
                                         (|:| |commonBranch|
                                              (|Record| (|:| |name| (|Symbol|))
                                                        (|:| |contents|
                                                             (|List|
                                                              (|Symbol|)))))
                                         (|:| |printBranch|
                                              (|List| (|OutputForm|))))
                                #3#))
              $))
            ((QEQCAR |opp| 8)
             (|FC;getWhile|
              (PROG2 (LETT #3# |rec| . #14#)
                  (QCDR #3#)
                (|check_union2| (QEQCAR #3# 10)
                                (|Record| (|:| |switch| (|Switch|))
                                          (|:| |body| $))
                                (|Union| (|:| |nullBranch| #13#)
                                         (|:| |assignmentBranch|
                                              (|Record| (|:| |var| (|Symbol|))
                                                        (|:| |arrayIndex|
                                                             (|List|
                                                              (|Polynomial|
                                                               (|Integer|))))
                                                        (|:| |rand|
                                                             (|Record|
                                                              (|:|
                                                               |ints2Floats?|
                                                               (|Boolean|))
                                                              (|:| |expr|
                                                                   (|OutputForm|))))))
                                         (|:| |arrayAssignmentBranch|
                                              (|Record| (|:| |var| (|Symbol|))
                                                        (|:| |rand|
                                                             (|OutputForm|))
                                                        (|:| |ints2Floats?|
                                                             (|Boolean|))))
                                         (|:| |conditionalBranch|
                                              (|Record|
                                               (|:| |switch| (|Switch|))
                                               (|:| |thenClause| $)
                                               (|:| |elseClause| $)))
                                         (|:| |returnBranch|
                                              (|Record|
                                               (|:| |empty?| (|Boolean|))
                                               (|:| |value|
                                                    (|Record|
                                                     (|:| |ints2Floats?|
                                                          (|Boolean|))
                                                     (|:| |expr|
                                                          (|OutputForm|))))))
                                         (|:| |blockBranch| (|List| $))
                                         (|:| |commentBranch|
                                              (|List| (|String|)))
                                         (|:| |callBranch| (|String|))
                                         (|:| |forBranch|
                                              (|Record|
                                               (|:| |range|
                                                    (|SegmentBinding|
                                                     (|Polynomial|
                                                      (|Integer|))))
                                               (|:| |span|
                                                    (|Polynomial| (|Integer|)))
                                               (|:| |body| $)))
                                         (|:| |labelBranch| (|SingleInteger|))
                                         (|:| |loopBranch|
                                              (|Record|
                                               (|:| |switch| (|Switch|))
                                               (|:| |body| $)))
                                         (|:| |commonBranch|
                                              (|Record| (|:| |name| (|Symbol|))
                                                        (|:| |contents|
                                                             (|List|
                                                              (|Symbol|)))))
                                         (|:| |printBranch|
                                              (|List| (|OutputForm|))))
                                #3#))
              $))
            ((QEQCAR |opp| 13) (|FC;getSave| $))
            ((QEQCAR |opp| 14) (|FC;getStop| $))
            ((QEQCAR |opp| 16)
             (|FC;getPrint|
              (PROG2 (LETT #2# |rec| . #14#)
                  (QCDR #2#)
                (|check_union2| (QEQCAR #2# 12) (|List| (|OutputForm|))
                                (|Union| (|:| |nullBranch| #13#)
                                         (|:| |assignmentBranch|
                                              (|Record| (|:| |var| (|Symbol|))
                                                        (|:| |arrayIndex|
                                                             (|List|
                                                              (|Polynomial|
                                                               (|Integer|))))
                                                        (|:| |rand|
                                                             (|Record|
                                                              (|:|
                                                               |ints2Floats?|
                                                               (|Boolean|))
                                                              (|:| |expr|
                                                                   (|OutputForm|))))))
                                         (|:| |arrayAssignmentBranch|
                                              (|Record| (|:| |var| (|Symbol|))
                                                        (|:| |rand|
                                                             (|OutputForm|))
                                                        (|:| |ints2Floats?|
                                                             (|Boolean|))))
                                         (|:| |conditionalBranch|
                                              (|Record|
                                               (|:| |switch| (|Switch|))
                                               (|:| |thenClause| $)
                                               (|:| |elseClause| $)))
                                         (|:| |returnBranch|
                                              (|Record|
                                               (|:| |empty?| (|Boolean|))
                                               (|:| |value|
                                                    (|Record|
                                                     (|:| |ints2Floats?|
                                                          (|Boolean|))
                                                     (|:| |expr|
                                                          (|OutputForm|))))))
                                         (|:| |blockBranch| (|List| $))
                                         (|:| |commentBranch|
                                              (|List| (|String|)))
                                         (|:| |callBranch| (|String|))
                                         (|:| |forBranch|
                                              (|Record|
                                               (|:| |range|
                                                    (|SegmentBinding|
                                                     (|Polynomial|
                                                      (|Integer|))))
                                               (|:| |span|
                                                    (|Polynomial| (|Integer|)))
                                               (|:| |body| $)))
                                         (|:| |labelBranch| (|SingleInteger|))
                                         (|:| |loopBranch|
                                              (|Record|
                                               (|:| |switch| (|Switch|))
                                               (|:| |body| $)))
                                         (|:| |commonBranch|
                                              (|Record| (|:| |name| (|Symbol|))
                                                        (|:| |contents|
                                                             (|List|
                                                              (|Symbol|)))))
                                         (|:| |printBranch|
                                              (|List| (|OutputForm|))))
                                #2#))
              $))
            ((QEQCAR |opp| 15)
             (|FC;getCommon|
              (PROG2 (LETT #1# |rec| . #14#)
                  (QCDR #1#)
                (|check_union2| (QEQCAR #1# 11)
                                (|Record| (|:| |name| (|Symbol|))
                                          (|:| |contents| (|List| (|Symbol|))))
                                (|Union| (|:| |nullBranch| #13#)
                                         (|:| |assignmentBranch|
                                              (|Record| (|:| |var| (|Symbol|))
                                                        (|:| |arrayIndex|
                                                             (|List|
                                                              (|Polynomial|
                                                               (|Integer|))))
                                                        (|:| |rand|
                                                             (|Record|
                                                              (|:|
                                                               |ints2Floats?|
                                                               (|Boolean|))
                                                              (|:| |expr|
                                                                   (|OutputForm|))))))
                                         (|:| |arrayAssignmentBranch|
                                              (|Record| (|:| |var| (|Symbol|))
                                                        (|:| |rand|
                                                             (|OutputForm|))
                                                        (|:| |ints2Floats?|
                                                             (|Boolean|))))
                                         (|:| |conditionalBranch|
                                              (|Record|
                                               (|:| |switch| (|Switch|))
                                               (|:| |thenClause| $)
                                               (|:| |elseClause| $)))
                                         (|:| |returnBranch|
                                              (|Record|
                                               (|:| |empty?| (|Boolean|))
                                               (|:| |value|
                                                    (|Record|
                                                     (|:| |ints2Floats?|
                                                          (|Boolean|))
                                                     (|:| |expr|
                                                          (|OutputForm|))))))
                                         (|:| |blockBranch| (|List| $))
                                         (|:| |commentBranch|
                                              (|List| (|String|)))
                                         (|:| |callBranch| (|String|))
                                         (|:| |forBranch|
                                              (|Record|
                                               (|:| |range|
                                                    (|SegmentBinding|
                                                     (|Polynomial|
                                                      (|Integer|))))
                                               (|:| |span|
                                                    (|Polynomial| (|Integer|)))
                                               (|:| |body| $)))
                                         (|:| |labelBranch| (|SingleInteger|))
                                         (|:| |loopBranch|
                                              (|Record|
                                               (|:| |switch| (|Switch|))
                                               (|:| |body| $)))
                                         (|:| |commonBranch|
                                              (|Record| (|:| |name| (|Symbol|))
                                                        (|:| |contents|
                                                             (|List|
                                                              (|Symbol|)))))
                                         (|:| |printBranch|
                                              (|List| (|OutputForm|))))
                                #1#))
              $))
            ('T (|error| "Unsupported program construct."))))))) 

(SDEFUN |FC;printCode;$V;37| ((|f| $) ($ |Void|))
        (SEQ (SPADCALL (SPADCALL |f| (QREFELT $ 44)) (QREFELT $ 81))
             (EXIT (SPADCALL (QREFELT $ 82))))) 

(PUT '|FC;code;$U;38| '|SPADreplace| 'QCDR) 

(SDEFUN |FC;code;$U;38|
        ((|f| $)
         ($ |Union| (|:| |nullBranch| "null")
          (|:| |assignmentBranch|
               (|Record| (|:| |var| (|Symbol|))
                         (|:| |arrayIndex| (|List| (|Polynomial| (|Integer|))))
                         (|:| |rand|
                              (|Record| (|:| |ints2Floats?| (|Boolean|))
                                        (|:| |expr| (|OutputForm|))))))
          (|:| |arrayAssignmentBranch|
               (|Record| (|:| |var| (|Symbol|)) (|:| |rand| (|OutputForm|))
                         (|:| |ints2Floats?| (|Boolean|))))
          (|:| |conditionalBranch|
               (|Record| (|:| |switch| (|Switch|)) (|:| |thenClause| $)
                         (|:| |elseClause| $)))
          (|:| |returnBranch|
               (|Record| (|:| |empty?| (|Boolean|))
                         (|:| |value|
                              (|Record| (|:| |ints2Floats?| (|Boolean|))
                                        (|:| |expr| (|OutputForm|))))))
          (|:| |blockBranch| (|List| $))
          (|:| |commentBranch| (|List| (|String|)))
          (|:| |callBranch| (|String|))
          (|:| |forBranch|
               (|Record|
                (|:| |range| (|SegmentBinding| (|Polynomial| (|Integer|))))
                (|:| |span| (|Polynomial| (|Integer|))) (|:| |body| $)))
          (|:| |labelBranch| (|SingleInteger|))
          (|:| |loopBranch|
               (|Record| (|:| |switch| (|Switch|)) (|:| |body| $)))
          (|:| |commonBranch|
               (|Record| (|:| |name| (|Symbol|))
                         (|:| |contents| (|List| (|Symbol|)))))
          (|:| |printBranch| (|List| (|OutputForm|)))))
        (QCDR |f|)) 

(PUT '|FC;operation;$U;39| '|SPADreplace| 'QCAR) 

(SDEFUN |FC;operation;$U;39|
        ((|f| $)
         ($ |Union| (|:| |Null| "null") (|:| |Assignment| "assignment")
          (|:| |Conditional| "conditional") (|:| |Return| "return")
          (|:| |Block| "block") (|:| |Comment| "comment") (|:| |Call| "call")
          (|:| |For| "for") (|:| |While| "while") (|:| |Repeat| "repeat")
          (|:| |Goto| "goto") (|:| |Continue| "continue")
          (|:| |ArrayAssignment| "arrayAssignment") (|:| |Save| "save")
          (|:| |Stop| "stop") (|:| |Common| "common") (|:| |Print| "print")))
        (QCAR |f|)) 

(SDEFUN |FC;common;SL$;40|
        ((|name| |Symbol|) (|contents| |List| (|Symbol|)) ($ $))
        (CONS (CONS 15 "common") (CONS 11 (CONS |name| |contents|)))) 

(SDEFUN |FC;stop;$;41| (($ $)) (CONS (CONS 14 "stop") (CONS 0 "null"))) 

(SDEFUN |FC;save;$;42| (($ $)) (CONS (CONS 13 "save") (CONS 0 "null"))) 

(SDEFUN |FC;printStatement;L$;43| ((|l| |List| (|OutputForm|)) ($ $))
        (CONS (CONS 16 "print") (CONS 12 |l|))) 

(SDEFUN |FC;comment;L$;44| ((|s| |List| (|String|)) ($ $))
        (CONS (CONS 5 "comment") (CONS 6 |s|))) 

(SDEFUN |FC;comment;S$;45| ((|s| |String|) ($ $))
        (CONS (CONS 5 "comment") (CONS 6 (SPADCALL |s| (QREFELT $ 90))))) 

(SDEFUN |FC;forLoop;Sb2$;46|
        ((|r| |SegmentBinding| (|Polynomial| (|Integer|))) (|body| $) ($ $))
        (CONS (CONS 7 "for")
              (CONS 8
                    (VECTOR |r|
                            (SPADCALL
                             (SPADCALL (SPADCALL |r| (QREFELT $ 78))
                                       (QREFELT $ 92))
                             (QREFELT $ 93))
                            |body|)))) 

(SDEFUN |FC;forLoop;SbP2$;47|
        ((|r| |SegmentBinding| (|Polynomial| (|Integer|)))
         (|increment| |Polynomial| (|Integer|)) (|body| $) ($ $))
        (CONS (CONS 7 "for") (CONS 8 (VECTOR |r| |increment| |body|)))) 

(SDEFUN |FC;gotoJump;Si$;48| ((|l| |SingleInteger|) ($ $))
        (CONS (CONS 10 "goto") (CONS 9 |l|))) 

(SDEFUN |FC;continue;Si$;49| ((|l| |SingleInteger|) ($ $))
        (CONS (CONS 11 "continue") (CONS 9 |l|))) 

(SDEFUN |FC;whileLoop;S2$;50| ((|sw| |Switch|) (|b| $) ($ $))
        (CONS (CONS 8 "while") (CONS 10 (CONS |sw| |b|)))) 

(SDEFUN |FC;repeatUntilLoop;S2$;51| ((|sw| |Switch|) (|b| $) ($ $))
        (CONS (CONS 9 "repeat") (CONS 10 (CONS |sw| |b|)))) 

(SDEFUN |FC;returns;$;52| (($ $))
        (SPROG
         ((|v|
           (|Record| (|:| |ints2Floats?| (|Boolean|))
                     (|:| |expr| (|OutputForm|)))))
         (SEQ
          (LETT |v| (CONS NIL (SPADCALL (|spadConstant| $ 99) (QREFELT $ 65)))
                |FC;returns;$;52|)
          (EXIT (CONS (CONS 3 "return") (CONS 4 (CONS 'T |v|))))))) 

(SDEFUN |FC;returns;E$;53| ((|v| |Expression| (|MachineInteger|)) ($ $))
        (CONS (CONS 3 "return")
              (CONS 4 (CONS NIL (CONS NIL (SPADCALL |v| (QREFELT $ 102))))))) 

(SDEFUN |FC;returns;E$;54| ((|v| |Expression| (|MachineFloat|)) ($ $))
        (CONS (CONS 3 "return")
              (CONS 4 (CONS NIL (CONS NIL (SPADCALL |v| (QREFELT $ 105))))))) 

(SDEFUN |FC;returns;E$;55| ((|v| |Expression| (|MachineComplex|)) ($ $))
        (CONS (CONS 3 "return")
              (CONS 4 (CONS NIL (CONS NIL (SPADCALL |v| (QREFELT $ 108))))))) 

(SDEFUN |FC;returns;E$;56| ((|v| |Expression| (|Integer|)) ($ $))
        (CONS (CONS 3 "return")
              (CONS 4 (CONS NIL (CONS NIL (SPADCALL |v| (QREFELT $ 111))))))) 

(SDEFUN |FC;returns;E$;57| ((|v| |Expression| (|Float|)) ($ $))
        (CONS (CONS 3 "return")
              (CONS 4 (CONS NIL (CONS NIL (SPADCALL |v| (QREFELT $ 114))))))) 

(SDEFUN |FC;returns;E$;58| ((|v| |Expression| (|Complex| (|Float|))) ($ $))
        (CONS (CONS 3 "return")
              (CONS 4 (CONS NIL (CONS NIL (SPADCALL |v| (QREFELT $ 117))))))) 

(SDEFUN |FC;block;L$;59| ((|l| |List| $) ($ $))
        (CONS (CONS 4 "block") (CONS 5 |l|))) 

(SDEFUN |FC;cond;S2$;60| ((|sw| |Switch|) (|thenC| $) ($ $))
        (CONS (CONS 2 "conditional")
              (CONS 3
                    (VECTOR |sw| |thenC|
                            (CONS (CONS 0 "null") (CONS 0 "null")))))) 

(SDEFUN |FC;cond;S3$;61| ((|sw| |Switch|) (|thenC| $) (|elseC| $) ($ $))
        (CONS (CONS 2 "conditional") (CONS 3 (VECTOR |sw| |thenC| |elseC|)))) 

(SDEFUN |FC;coerce;$Of;62| ((|f| $) ($ |OutputForm|))
        (SPADCALL (QCAR |f|) (QREFELT $ 122))) 

(SDEFUN |FC;assign;SS$;63| ((|v| |Symbol|) (|rhs| |String|) ($ $))
        (CONS (CONS 1 "assignment")
              (CONS 1
                    (VECTOR |v| NIL
                            (CONS NIL (SPADCALL |rhs| (QREFELT $ 124))))))) 

(SDEFUN |FC;assign;SM$;64|
        ((|v| |Symbol|) (|rhs| |Matrix| (|MachineInteger|)) ($ $))
        (CONS (CONS 12 "arrayAssignment")
              (CONS 2 (VECTOR |v| (SPADCALL |rhs| (QREFELT $ 127)) NIL)))) 

(SDEFUN |FC;assign;SM$;65|
        ((|v| |Symbol|) (|rhs| |Matrix| (|MachineFloat|)) ($ $))
        (CONS (CONS 12 "arrayAssignment")
              (CONS 2 (VECTOR |v| (SPADCALL |rhs| (QREFELT $ 130)) 'T)))) 

(SDEFUN |FC;assign;SM$;66|
        ((|v| |Symbol|) (|rhs| |Matrix| (|MachineComplex|)) ($ $))
        (CONS (CONS 12 "arrayAssignment")
              (CONS 2 (VECTOR |v| (SPADCALL |rhs| (QREFELT $ 133)) 'T)))) 

(SDEFUN |FC;assign;SV$;67|
        ((|v| |Symbol|) (|rhs| |Vector| (|MachineInteger|)) ($ $))
        (CONS (CONS 12 "arrayAssignment")
              (CONS 2 (VECTOR |v| (SPADCALL |rhs| (QREFELT $ 136)) NIL)))) 

(SDEFUN |FC;assign;SV$;68|
        ((|v| |Symbol|) (|rhs| |Vector| (|MachineFloat|)) ($ $))
        (CONS (CONS 12 "arrayAssignment")
              (CONS 2 (VECTOR |v| (SPADCALL |rhs| (QREFELT $ 139)) 'T)))) 

(SDEFUN |FC;assign;SV$;69|
        ((|v| |Symbol|) (|rhs| |Vector| (|MachineComplex|)) ($ $))
        (CONS (CONS 12 "arrayAssignment")
              (CONS 2 (VECTOR |v| (SPADCALL |rhs| (QREFELT $ 142)) 'T)))) 

(SDEFUN |FC;assign;SM$;70|
        ((|v| |Symbol|) (|rhs| |Matrix| (|Expression| (|MachineInteger|)))
         ($ $))
        (CONS (CONS 12 "arrayAssignment")
              (CONS 2 (VECTOR |v| (SPADCALL |rhs| (QREFELT $ 145)) NIL)))) 

(SDEFUN |FC;assign;SM$;71|
        ((|v| |Symbol|) (|rhs| |Matrix| (|Expression| (|MachineFloat|))) ($ $))
        (CONS (CONS 12 "arrayAssignment")
              (CONS 2 (VECTOR |v| (SPADCALL |rhs| (QREFELT $ 148)) 'T)))) 

(SDEFUN |FC;assign;SM$;72|
        ((|v| |Symbol|) (|rhs| |Matrix| (|Expression| (|MachineComplex|)))
         ($ $))
        (CONS (CONS 12 "arrayAssignment")
              (CONS 2 (VECTOR |v| (SPADCALL |rhs| (QREFELT $ 151)) 'T)))) 

(SDEFUN |FC;assign;SV$;73|
        ((|v| |Symbol|) (|rhs| |Vector| (|Expression| (|MachineInteger|)))
         ($ $))
        (CONS (CONS 12 "arrayAssignment")
              (CONS 2 (VECTOR |v| (SPADCALL |rhs| (QREFELT $ 154)) NIL)))) 

(SDEFUN |FC;assign;SV$;74|
        ((|v| |Symbol|) (|rhs| |Vector| (|Expression| (|MachineFloat|))) ($ $))
        (CONS (CONS 12 "arrayAssignment")
              (CONS 2 (VECTOR |v| (SPADCALL |rhs| (QREFELT $ 157)) 'T)))) 

(SDEFUN |FC;assign;SV$;75|
        ((|v| |Symbol|) (|rhs| |Vector| (|Expression| (|MachineComplex|)))
         ($ $))
        (CONS (CONS 12 "arrayAssignment")
              (CONS 2 (VECTOR |v| (SPADCALL |rhs| (QREFELT $ 160)) 'T)))) 

(SDEFUN |FC;assign;SLE$;76|
        ((|v| |Symbol|) (|index| |List| (|Polynomial| (|Integer|)))
         (|rhs| |Expression| (|MachineInteger|)) ($ $))
        (CONS (CONS 1 "assignment")
              (CONS 1
                    (VECTOR |v| |index|
                            (CONS NIL (SPADCALL |rhs| (QREFELT $ 102))))))) 

(SDEFUN |FC;assign;SLE$;77|
        ((|v| |Symbol|) (|index| |List| (|Polynomial| (|Integer|)))
         (|rhs| |Expression| (|MachineFloat|)) ($ $))
        (CONS (CONS 1 "assignment")
              (CONS 1
                    (VECTOR |v| |index|
                            (CONS 'T (SPADCALL |rhs| (QREFELT $ 105))))))) 

(SDEFUN |FC;assign;SLE$;78|
        ((|v| |Symbol|) (|index| |List| (|Polynomial| (|Integer|)))
         (|rhs| |Expression| (|MachineComplex|)) ($ $))
        (CONS (CONS 1 "assignment")
              (CONS 1
                    (VECTOR |v| |index|
                            (CONS 'T (SPADCALL |rhs| (QREFELT $ 108))))))) 

(SDEFUN |FC;assign;SE$;79|
        ((|v| |Symbol|) (|rhs| |Expression| (|MachineInteger|)) ($ $))
        (CONS (CONS 1 "assignment")
              (CONS 1
                    (VECTOR |v| NIL
                            (CONS NIL (SPADCALL |rhs| (QREFELT $ 102))))))) 

(SDEFUN |FC;assign;SE$;80|
        ((|v| |Symbol|) (|rhs| |Expression| (|MachineFloat|)) ($ $))
        (CONS (CONS 1 "assignment")
              (CONS 1
                    (VECTOR |v| NIL
                            (CONS 'T (SPADCALL |rhs| (QREFELT $ 105))))))) 

(SDEFUN |FC;assign;SE$;81|
        ((|v| |Symbol|) (|rhs| |Expression| (|MachineComplex|)) ($ $))
        (CONS (CONS 1 "assignment")
              (CONS 1
                    (VECTOR |v| NIL
                            (CONS 'T (SPADCALL |rhs| (QREFELT $ 108))))))) 

(SDEFUN |FC;assign;SM$;82|
        ((|v| |Symbol|) (|rhs| |Matrix| (|Expression| (|Integer|))) ($ $))
        (CONS (CONS 12 "arrayAssignment")
              (CONS 2 (VECTOR |v| (SPADCALL |rhs| (QREFELT $ 169)) NIL)))) 

(SDEFUN |FC;assign;SM$;83|
        ((|v| |Symbol|) (|rhs| |Matrix| (|Expression| (|Float|))) ($ $))
        (CONS (CONS 12 "arrayAssignment")
              (CONS 2 (VECTOR |v| (SPADCALL |rhs| (QREFELT $ 172)) 'T)))) 

(SDEFUN |FC;assign;SM$;84|
        ((|v| |Symbol|) (|rhs| |Matrix| (|Expression| (|Complex| (|Float|))))
         ($ $))
        (CONS (CONS 12 "arrayAssignment")
              (CONS 2 (VECTOR |v| (SPADCALL |rhs| (QREFELT $ 175)) 'T)))) 

(SDEFUN |FC;assign;SV$;85|
        ((|v| |Symbol|) (|rhs| |Vector| (|Expression| (|Integer|))) ($ $))
        (CONS (CONS 12 "arrayAssignment")
              (CONS 2 (VECTOR |v| (SPADCALL |rhs| (QREFELT $ 178)) NIL)))) 

(SDEFUN |FC;assign;SV$;86|
        ((|v| |Symbol|) (|rhs| |Vector| (|Expression| (|Float|))) ($ $))
        (CONS (CONS 12 "arrayAssignment")
              (CONS 2 (VECTOR |v| (SPADCALL |rhs| (QREFELT $ 181)) 'T)))) 

(SDEFUN |FC;assign;SV$;87|
        ((|v| |Symbol|) (|rhs| |Vector| (|Expression| (|Complex| (|Float|))))
         ($ $))
        (CONS (CONS 12 "arrayAssignment")
              (CONS 2 (VECTOR |v| (SPADCALL |rhs| (QREFELT $ 184)) 'T)))) 

(SDEFUN |FC;assign;SLE$;88|
        ((|v| |Symbol|) (|index| |List| (|Polynomial| (|Integer|)))
         (|rhs| |Expression| (|Integer|)) ($ $))
        (CONS (CONS 1 "assignment")
              (CONS 1
                    (VECTOR |v| |index|
                            (CONS NIL (SPADCALL |rhs| (QREFELT $ 111))))))) 

(SDEFUN |FC;assign;SLE$;89|
        ((|v| |Symbol|) (|index| |List| (|Polynomial| (|Integer|)))
         (|rhs| |Expression| (|Float|)) ($ $))
        (CONS (CONS 1 "assignment")
              (CONS 1
                    (VECTOR |v| |index|
                            (CONS 'T (SPADCALL |rhs| (QREFELT $ 114))))))) 

(SDEFUN |FC;assign;SLE$;90|
        ((|v| |Symbol|) (|index| |List| (|Polynomial| (|Integer|)))
         (|rhs| |Expression| (|Complex| (|Float|))) ($ $))
        (CONS (CONS 1 "assignment")
              (CONS 1
                    (VECTOR |v| |index|
                            (CONS 'T (SPADCALL |rhs| (QREFELT $ 117))))))) 

(SDEFUN |FC;assign;SE$;91|
        ((|v| |Symbol|) (|rhs| |Expression| (|Integer|)) ($ $))
        (CONS (CONS 1 "assignment")
              (CONS 1
                    (VECTOR |v| NIL
                            (CONS NIL (SPADCALL |rhs| (QREFELT $ 111))))))) 

(SDEFUN |FC;assign;SE$;92|
        ((|v| |Symbol|) (|rhs| |Expression| (|Float|)) ($ $))
        (CONS (CONS 1 "assignment")
              (CONS 1
                    (VECTOR |v| NIL
                            (CONS 'T (SPADCALL |rhs| (QREFELT $ 114))))))) 

(SDEFUN |FC;assign;SE$;93|
        ((|v| |Symbol|) (|rhs| |Expression| (|Complex| (|Float|))) ($ $))
        (CONS (CONS 1 "assignment")
              (CONS 1
                    (VECTOR |v| NIL
                            (CONS 'T (SPADCALL |rhs| (QREFELT $ 117))))))) 

(SDEFUN |FC;call;S$;94| ((|s| |String|) ($ $))
        (CONS (CONS 6 "call") (CONS 7 |s|))) 

(DECLAIM (NOTINLINE |FortranCode;|)) 

(DEFUN |FortranCode| ()
  (SPROG NIL
         (PROG (#1=#:G2925)
           (RETURN
            (COND
             ((LETT #1# (HGET |$ConstructorCache| '|FortranCode|)
                    . #2=(|FortranCode|))
              (|CDRwithIncrement| (CDAR #1#)))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (CDDAR
                       (HPUT |$ConstructorCache| '|FortranCode|
                             (LIST (CONS NIL (CONS 1 (|FortranCode;|))))))
                    (LETT #1# T . #2#))
                (COND
                 ((NOT #1#) (HREM |$ConstructorCache| '|FortranCode|)))))))))) 

(DEFUN |FortranCode;| ()
  (SPROG ((|dv$| NIL) ($ NIL) (|pv$| NIL))
         (PROGN
          (LETT |dv$| '(|FortranCode|) . #1=(|FortranCode|))
          (LETT $ (GETREFV 194) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|FortranCode| NIL (CONS 1 $))
          (|stuffDomainSlots| $)
          (SETF |pv$| (QREFELT $ 3))
          (QSETREFV $ 34
                    (|Record|
                     (|:| |op|
                          (|Union| (|:| |Null| #2="null")
                                   (|:| |Assignment| "assignment")
                                   (|:| |Conditional| "conditional")
                                   (|:| |Return| "return")
                                   (|:| |Block| "block")
                                   (|:| |Comment| "comment")
                                   (|:| |Call| "call") (|:| |For| "for")
                                   (|:| |While| "while")
                                   (|:| |Repeat| "repeat") (|:| |Goto| "goto")
                                   (|:| |Continue| "continue")
                                   (|:| |ArrayAssignment| "arrayAssignment")
                                   (|:| |Save| "save") (|:| |Stop| "stop")
                                   (|:| |Common| "common")
                                   (|:| |Print| "print")))
                     (|:| |data|
                          (|Union| (|:| |nullBranch| #2#)
                                   (|:| |assignmentBranch|
                                        (|Record| (|:| |var| (|Symbol|))
                                                  (|:| |arrayIndex|
                                                       (|List|
                                                        (|Polynomial|
                                                         (|Integer|))))
                                                  (|:| |rand|
                                                       (|Record|
                                                        (|:| |ints2Floats?|
                                                             (|Boolean|))
                                                        (|:| |expr|
                                                             (|OutputForm|))))))
                                   (|:| |arrayAssignmentBranch|
                                        (|Record| (|:| |var| (|Symbol|))
                                                  (|:| |rand| (|OutputForm|))
                                                  (|:| |ints2Floats?|
                                                       (|Boolean|))))
                                   (|:| |conditionalBranch|
                                        (|Record| (|:| |switch| (|Switch|))
                                                  (|:| |thenClause| $)
                                                  (|:| |elseClause| $)))
                                   (|:| |returnBranch|
                                        (|Record| (|:| |empty?| (|Boolean|))
                                                  (|:| |value|
                                                       (|Record|
                                                        (|:| |ints2Floats?|
                                                             (|Boolean|))
                                                        (|:| |expr|
                                                             (|OutputForm|))))))
                                   (|:| |blockBranch| (|List| $))
                                   (|:| |commentBranch| (|List| (|String|)))
                                   (|:| |callBranch| (|String|))
                                   (|:| |forBranch|
                                        (|Record|
                                         (|:| |range|
                                              (|SegmentBinding|
                                               (|Polynomial| (|Integer|))))
                                         (|:| |span|
                                              (|Polynomial| (|Integer|)))
                                         (|:| |body| $)))
                                   (|:| |labelBranch| (|SingleInteger|))
                                   (|:| |loopBranch|
                                        (|Record| (|:| |switch| (|Switch|))
                                                  (|:| |body| $)))
                                   (|:| |commonBranch|
                                        (|Record| (|:| |name| (|Symbol|))
                                                  (|:| |contents|
                                                       (|List| (|Symbol|)))))
                                   (|:| |printBranch|
                                        (|List| (|OutputForm|)))))))
          (QSETREFV $ 37 (SPADCALL 25000 (QREFELT $ 36)))
          $))) 

(MAKEPROP '|FortranCode| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|OutputForm|) (|Symbol|) (0 . |coerce|)
              (|List| $) (5 . |elt|) (|List| 25) (|Boolean|)
              (|FortranCodeTools|) (11 . |getStatement|)
              (17 . |statement2Fortran|) (|Void|) (|Integer|)
              (22 . |changeExprLength|) (27 . |append|) (|Mapping| 11)
              (33 . |do_with_error_env1|) (38 . |fort_clean_lines|)
              (|UniversalSegment| 17) (43 . SEGMENT) (|String|) (48 . |elt|)
              (54 . |do_with_error_env0|) (|Mapping| 7)
              (59 . |expression2Fortran1|) (|NonNegativeInteger|)
              (66 . |first|) (72 . |do_with_error_env2|) (78 . |string|) '|Rep|
              (|SingleInteger|) (83 . |coerce|) '|labelValue|
              |FC;setLabelValue;2Si;15| (|Polynomial| 17) (88 . |One|)
              (92 . |elt|) (98 . |expression2Fortran|)
              (103 . |indentFortLevel|) |FC;getCode;$L;36|
              (|Union| (|:| |Null| '"null") (|:| |Assignment| '"assignment")
                       (|:| |Conditional| '"conditional")
                       (|:| |Return| '"return") (|:| |Block| '"block")
                       (|:| |Comment| '"comment") (|:| |Call| '"call")
                       (|:| |For| '"for") (|:| |While| '"while")
                       (|:| |Repeat| '"repeat") (|:| |Goto| '"goto")
                       (|:| |Continue| '"continue")
                       (|:| |ArrayAssignment| '"arrayAssignment")
                       (|:| |Save| '"save") (|:| |Stop| '"stop")
                       (|:| |Common| '"common") (|:| |Print| '"print"))
              |FC;operation;$U;39|
              (|Record| (|:| |ints2Floats?| 12) (|:| |expr| 6))
              (|Record| (|:| |var| 7) (|:| |arrayIndex| 68) (|:| |rand| 47))
              (|Record| (|:| |var| 7) (|:| |rand| 6) (|:| |ints2Floats?| 12))
              (|Record| (|:| |switch| 57) (|:| |thenClause| $)
                        (|:| |elseClause| $))
              (|Record| (|:| |empty?| 12) (|:| |value| 47))
              (|Record| (|:| |range| 71) (|:| |span| 39) (|:| |body| $))
              (|Record| (|:| |switch| 57) (|:| |body| $))
              (|Record| (|:| |name| 7) (|:| |contents| 84))
              (|Union| (|:| |nullBranch| '"null") (|:| |assignmentBranch| 48)
                       (|:| |arrayAssignmentBranch| 49)
                       (|:| |conditionalBranch| 50) (|:| |returnBranch| 51)
                       (|:| |blockBranch| 9) (|:| |commentBranch| 11)
                       (|:| |callBranch| 25) (|:| |forBranch| 52)
                       (|:| |labelBranch| 35) (|:| |loopBranch| 53)
                       (|:| |commonBranch| 54) (|:| |printBranch| 66))
              |FC;code;$U;38| (|Switch|) (108 . |coerce|) (113 . >)
              (119 . |get_fort_indent|) (123 . |hspace|) (128 . NOT)
              |FC;gotoJump;Si$;48| (133 . |concat|) (138 . |coerce|) (|List| 6)
              (|Mapping| 6 39) (|List| 39) (|ListFunctions2| 39 6)
              (143 . |map|) (|SegmentBinding| 39) (149 . |variable|)
              (|FortranType|) (154 . |fortranInteger|) (|TheSymbolTable|)
              (158 . |declare!|) (|Segment| 39) (164 . |segment|) (169 . |lo|)
              (174 . |hi|) (179 . |displayLines1|) (184 . |void|)
              |FC;printCode;$V;37| (|List| 7) |FC;common;SL$;40| |FC;stop;$;41|
              |FC;save;$;42| |FC;printStatement;L$;43| |FC;comment;L$;44|
              (188 . |list|) |FC;comment;S$;45| (193 . |incr|) (198 . |coerce|)
              |FC;forLoop;Sb2$;46| |FC;forLoop;SbP2$;47| |FC;continue;Si$;49|
              |FC;whileLoop;S2$;50| |FC;repeatUntilLoop;S2$;51| (203 . |Zero|)
              |FC;returns;$;52| (|Expression| (|MachineInteger|))
              (207 . |coerce|) |FC;returns;E$;53|
              (|Expression| (|MachineFloat|)) (212 . |coerce|)
              |FC;returns;E$;54| (|Expression| (|MachineComplex|))
              (217 . |coerce|) |FC;returns;E$;55| (|Expression| 17)
              (222 . |coerce|) |FC;returns;E$;56| (|Expression| (|Float|))
              (227 . |coerce|) |FC;returns;E$;57|
              (|Expression| (|Complex| (|Float|))) (232 . |coerce|)
              |FC;returns;E$;58| |FC;block;L$;59| |FC;cond;S2$;60|
              |FC;cond;S3$;61| (237 . |coerce|) |FC;coerce;$Of;62|
              (242 . |coerce|) |FC;assign;SS$;63| (|Matrix| (|MachineInteger|))
              (247 . |coerce|) |FC;assign;SM$;64| (|Matrix| (|MachineFloat|))
              (252 . |coerce|) |FC;assign;SM$;65| (|Matrix| (|MachineComplex|))
              (257 . |coerce|) |FC;assign;SM$;66| (|Vector| (|MachineInteger|))
              (262 . |coerce|) |FC;assign;SV$;67| (|Vector| (|MachineFloat|))
              (267 . |coerce|) |FC;assign;SV$;68| (|Vector| (|MachineComplex|))
              (272 . |coerce|) |FC;assign;SV$;69| (|Matrix| 101)
              (277 . |coerce|) |FC;assign;SM$;70| (|Matrix| 104)
              (282 . |coerce|) |FC;assign;SM$;71| (|Matrix| 107)
              (287 . |coerce|) |FC;assign;SM$;72| (|Vector| 101)
              (292 . |coerce|) |FC;assign;SV$;73| (|Vector| 104)
              (297 . |coerce|) |FC;assign;SV$;74| (|Vector| 107)
              (302 . |coerce|) |FC;assign;SV$;75| |FC;assign;SLE$;76|
              |FC;assign;SLE$;77| |FC;assign;SLE$;78| |FC;assign;SE$;79|
              |FC;assign;SE$;80| |FC;assign;SE$;81| (|Matrix| 110)
              (307 . |coerce|) |FC;assign;SM$;82| (|Matrix| 113)
              (312 . |coerce|) |FC;assign;SM$;83| (|Matrix| 116)
              (317 . |coerce|) |FC;assign;SM$;84| (|Vector| 110)
              (322 . |coerce|) |FC;assign;SV$;85| (|Vector| 113)
              (327 . |coerce|) |FC;assign;SV$;86| (|Vector| 116)
              (332 . |coerce|) |FC;assign;SV$;87| |FC;assign;SLE$;88|
              |FC;assign;SLE$;89| |FC;assign;SLE$;90| |FC;assign;SE$;91|
              |FC;assign;SE$;92| |FC;assign;SE$;93| |FC;call;S$;94|
              (|HashState|))
           '#(~= 337 |whileLoop| 343 |stop| 349 |setLabelValue| 353 |save| 358
              |returns| 362 |repeatUntilLoop| 396 |printStatement| 402
              |printCode| 407 |operation| 412 |latex| 417 |hashUpdate!| 422
              |hash| 428 |gotoJump| 433 |getCode| 438 |forLoop| 443 |continue|
              456 |cond| 461 |common| 474 |comment| 480 |coerce| 490 |code| 495
              |call| 500 |block| 505 |assign| 510 = 702)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0 0 0))
                 (CONS '#(|SetCategory&| |BasicType&| NIL)
                       (CONS
                        '#((|SetCategory|) (|BasicType|) (|CoercibleTo| 6))
                        (|makeByteWordVec2| 193
                                            '(1 7 6 0 8 2 6 0 0 9 10 2 13 11 6
                                              12 14 1 13 11 6 15 1 13 16 17 18
                                              2 11 0 0 0 19 1 13 11 20 21 1 13
                                              11 11 22 1 23 0 17 24 2 25 0 0 23
                                              26 1 13 11 20 27 3 13 11 28 6 12
                                              29 2 11 0 0 30 31 2 13 11 12 20
                                              32 1 7 25 0 33 1 35 0 17 36 0 39
                                              0 40 2 11 25 0 17 41 1 13 11 6 42
                                              1 13 16 17 43 1 57 6 0 58 2 30 12
                                              0 0 59 0 13 17 60 1 6 0 17 61 1
                                              57 0 0 62 1 11 0 9 64 1 39 6 0 65
                                              2 69 66 67 68 70 1 71 7 0 72 0 73
                                              0 74 2 75 73 7 73 76 1 71 77 0 78
                                              1 77 39 0 79 1 77 39 0 80 1 13 16
                                              11 81 0 16 0 82 1 11 0 25 90 1 77
                                              17 0 92 1 39 0 17 93 0 39 0 99 1
                                              101 6 0 102 1 104 6 0 105 1 107 6
                                              0 108 1 110 6 0 111 1 113 6 0 114
                                              1 116 6 0 117 1 45 6 0 122 1 25 6
                                              0 124 1 126 6 0 127 1 129 6 0 130
                                              1 132 6 0 133 1 135 6 0 136 1 138
                                              6 0 139 1 141 6 0 142 1 144 6 0
                                              145 1 147 6 0 148 1 150 6 0 151 1
                                              153 6 0 154 1 156 6 0 157 1 159 6
                                              0 160 1 168 6 0 169 1 171 6 0 172
                                              1 174 6 0 175 1 177 6 0 178 1 180
                                              6 0 181 1 183 6 0 184 2 0 12 0 0
                                              1 2 0 0 57 0 97 0 0 0 86 1 0 35
                                              35 38 0 0 0 87 1 0 0 116 118 1 0
                                              0 113 115 1 0 0 110 112 1 0 0 101
                                              103 1 0 0 107 109 0 0 0 100 1 0 0
                                              104 106 2 0 0 57 0 98 1 0 0 66 88
                                              1 0 16 0 83 1 0 45 0 46 1 0 25 0
                                              1 2 0 193 193 0 1 1 0 35 0 1 1 0
                                              0 35 63 1 0 11 0 44 3 0 0 71 39 0
                                              95 2 0 0 71 0 94 1 0 0 35 96 3 0
                                              0 57 0 0 121 2 0 0 57 0 120 2 0 0
                                              7 84 85 1 0 0 11 89 1 0 0 25 91 1
                                              0 6 0 123 1 0 55 0 56 1 0 0 25
                                              192 1 0 0 9 119 3 0 0 7 68 113
                                              187 3 0 0 7 68 116 188 2 0 0 7
                                              183 185 3 0 0 7 68 110 186 2 0 0
                                              7 177 179 2 0 0 7 180 182 2 0 0 7
                                              171 173 2 0 0 7 174 176 2 0 0 7
                                              116 191 2 0 0 7 168 170 2 0 0 7
                                              110 189 2 0 0 7 113 190 3 0 0 7
                                              68 104 163 3 0 0 7 68 107 164 2 0
                                              0 7 159 161 3 0 0 7 68 101 162 2
                                              0 0 7 153 155 2 0 0 7 156 158 2 0
                                              0 7 147 149 2 0 0 7 150 152 2 0 0
                                              7 141 143 2 0 0 7 144 146 2 0 0 7
                                              135 137 2 0 0 7 138 140 2 0 0 7
                                              129 131 2 0 0 7 132 134 2 0 0 7
                                              107 167 2 0 0 7 126 128 2 0 0 7
                                              101 165 2 0 0 7 104 166 2 0 0 7
                                              25 125 2 0 12 0 0 1)))))
           '|lookupComplete|)) 

(MAKEPROP '|FortranCode| 'NILADIC T) 