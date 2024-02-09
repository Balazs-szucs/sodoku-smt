; c row column 

(declare-fun rc11 () (_ BitVec 4))
(declare-fun rc12 () (_ BitVec 4))
(declare-fun rc13 () (_ BitVec 4))
(declare-fun rc14 () (_ BitVec 4))

(declare-fun rc21 () (_ BitVec 4))
(declare-fun rc22 () (_ BitVec 4))
(declare-fun rc23 () (_ BitVec 4))
(declare-fun rc24 () (_ BitVec 4))

(declare-fun rc31 () (_ BitVec 4))
(declare-fun rc32 () (_ BitVec 4))
(declare-fun rc33 () (_ BitVec 4))
(declare-fun rc34 () (_ BitVec 4))

(declare-fun rc41 () (_ BitVec 4))
(declare-fun rc42 () (_ BitVec 4))
(declare-fun rc43 () (_ BitVec 4))
(declare-fun rc44 () (_ BitVec 4))
;smaller than 4, bigger than 1.

(assert (or (= rc11 #x1) (= rc11 #x2) (= rc11 #x3) (= rc11 #x4)))
(assert (or (= rc12 #x1) (= rc12 #x2) (= rc12 #x3) (= rc12 #x4)))
(assert (or (= rc13 #x1) (= rc13 #x2) (= rc13 #x3) (= rc13 #x4)))
(assert (or (= rc14 #x1) (= rc14 #x2) (= rc14 #x3) (= rc14 #x4)))

(assert (or (= rc21 #x1) (= rc21 #x2) (= rc21 #x3) (= rc21 #x4)))
(assert (or (= rc22 #x1) (= rc22 #x2) (= rc22 #x3) (= rc22 #x4)))
(assert (or (= rc23 #x1) (= rc23 #x2) (= rc23 #x3) (= rc23 #x4)))
(assert (or (= rc24 #x1) (= rc24 #x2) (= rc24 #x3) (= rc24 #x4)))

(assert (or (= rc31 #x1) (= rc31 #x2) (= rc31 #x3) (= rc31 #x4)))
(assert (or (= rc32 #x1) (= rc32 #x2) (= rc32 #x3) (= rc32 #x4)))
(assert (or (= rc33 #x1) (= rc33 #x2) (= rc33 #x3) (= rc33 #x4)))
(assert (or (= rc34 #x1) (= rc34 #x2) (= rc34 #x3) (= rc34 #x4)))

(assert (or (= rc41 #x1) (= rc41 #x2) (= rc41 #x3) (= rc41 #x4)))
(assert (or (= rc42 #x1) (= rc42 #x2) (= rc42 #x3) (= rc42 #x4)))
(assert (or (= rc43 #x1) (= rc43 #x2) (= rc43 #x3) (= rc43 #x4)))
(assert (or (= rc44 #x1) (= rc44 #x2) (= rc44 #x3) (= rc44 #x4)))

;elements in rows have to be different
(assert (distinct rc11 rc12 rc13 rc14))
(assert (distinct rc21 rc22 rc23 rc24))
(assert (distinct rc31 rc32 rc33 rc34))
(assert (distinct rc41 rc42 rc43 rc44))

;elements in columns have to be different
(assert (distinct rc11 rc21 rc31 rc41))
(assert (distinct rc12 rc22 rc32 rc42))
(assert (distinct rc13 rc23 rc33 rc43))
(assert (distinct rc14 rc24 rc34 rc44))

;elements in squares have to be different
(assert (distinct rc11 rc12 rc21 rc22))
(assert (distinct rc13 rc14 rc23 rc24))
(assert (distinct rc31 rc32 rc41 rc42))
(assert (distinct rc33 rc34 rc43 rc44))

;sum in rows = 10

(assert (= #b1010 (bvadd rc11 rc12 rc13 rc14)))
(assert (= #b1010 (bvadd rc21 rc22 rc23 rc24 )))
(assert (= #b1010 (bvadd rc31 rc32 rc33 rc34)))
(assert (= #b1010 (bvadd rc41 rc42 rc43 rc44)))
;sum in columns = 10

(assert (= #b1010 (bvadd rc11 rc21 rc31 rc41)))
(assert (= #b1010 (bvadd rc12 rc22 rc32 rc42)))
(assert (= #b1010 (bvadd rc13 rc23 rc33 rc43)))
(assert (= #b1010 (bvadd rc14 rc24 rc34 rc44)))
;sum in squares = 10

(assert (= #b1010 (bvadd rc11 rc12 rc21 rc22)))
(assert (= #b1010 (bvadd rc13 rc14 rc23 rc24)))
(assert (= #b1010 (bvadd rc31 rc32 rc41 rc42)))
(assert (= #b1010 (bvadd rc33 rc34 rc43 rc44)))

(check-sat)
(get-model)