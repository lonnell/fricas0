
(PUT '|MAPHACK2;arg1;ACA;1| '|SPADreplace| '(XLAM (|a| |c|) |a|)) 

(SDEFUN |MAPHACK2;arg1;ACA;1| ((|a| A) (|c| C) ($ A)) |a|) 

(PUT '|MAPHACK2;arg2;A2C;2| '|SPADreplace| '(XLAM (|a| |c|) |c|)) 

(SDEFUN |MAPHACK2;arg2;A2C;2| ((|a| A) (|c| C) ($ C)) |c|) 

(DECLAIM (NOTINLINE |MappingPackageInternalHacks2;|)) 

(DEFUN |MappingPackageInternalHacks2| (&REST #1=#:G692)
  (SPROG NIL
         (PROG (#2=#:G693)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|MappingPackageInternalHacks2|)
                                               '|domainEqualList|)
                    . #3=(|MappingPackageInternalHacks2|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (APPLY (|function| |MappingPackageInternalHacks2;|) #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|MappingPackageInternalHacks2|)))))))))) 

(DEFUN |MappingPackageInternalHacks2;| (|#1| |#2|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #1=(|MappingPackageInternalHacks2|))
          (LETT DV$2 (|devaluate| |#2|) . #1#)
          (LETT |dv$| (LIST '|MappingPackageInternalHacks2| DV$1 DV$2) . #1#)
          (LETT $ (GETREFV 10) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|MappingPackageInternalHacks2|
                      (LIST DV$1 DV$2) (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (QSETREFV $ 7 |#2|)
          (SETF |pv$| (QREFELT $ 3))
          $))) 

(MAKEPROP '|MappingPackageInternalHacks2| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              |MAPHACK2;arg1;ACA;1| |MAPHACK2;arg2;A2C;2|)
           '#(|arg2| 0 |arg1| 6) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 9
                                                 '(2 0 7 6 7 9 2 0 6 6 7 8)))))
           '|lookupComplete|)) 
