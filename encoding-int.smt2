; c row column 

(declare-fun rc11 () Int)
(declare-fun rc12 () Int)
(declare-fun rc13 () Int)
(declare-fun rc14 () Int)

(declare-fun rc21 () Int)
(declare-fun rc22 () Int)
(declare-fun rc23 () Int)
(declare-fun rc24 () Int)

(declare-fun rc31 () Int)
(declare-fun rc32 () Int)
(declare-fun rc33 () Int)
(declare-fun rc34 () Int)

(declare-fun rc41 () Int)
(declare-fun rc42 () Int)
(declare-fun rc43 () Int)
(declare-fun rc44 () Int)

;smaller than 4, bigger than 1.

(assert (and (>= rc11 1) (<= rc11 4)))
(assert (and (>= rc12 1) (<= rc12 4)))
(assert (and (>= rc13 1) (<= rc13 4)))
(assert (and (>= rc14 1) (<= rc14 4)))
(assert (and (>= rc21 1) (<= rc21 4)))
(assert (and (>= rc22 1) (<= rc22 4)))
(assert (and (>= rc23 1) (<= rc23 4)))
(assert (and (>= rc24 1) (<= rc24 4)))
(assert (and (>= rc31 1) (<= rc31 4)))
(assert (and (>= rc32 1) (<= rc32 4)))
(assert (and (>= rc33 1) (<= rc33 4)))
(assert (and (>= rc34 1) (<= rc34 4)))
(assert (and (>= rc41 1) (<= rc41 4)))
(assert (and (>= rc42 1) (<= rc42 4)))
(assert (and (>= rc43 1) (<= rc43 4)))
(assert (and (>= rc44 1) (<= rc44 4)))

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
(assert (= 10 (+ rc11 rc12 rc13 rc14)))
(assert (= 10 (+ rc21 rc22 rc23 rc24 )))
(assert (= 10 (+ rc31 rc32 rc33 rc34)))
(assert (= 10 (+ rc41 rc42 rc43 rc44)))

;sum in columns = 10
(assert (= 10 (+ rc11 rc21 rc31 rc41)))
(assert (= 10 (+ rc12 rc22 rc32 rc42)))
(assert (= 10 (+ rc13 rc23 rc33 rc43)))
(assert (= 10 (+ rc14 rc24 rc34 rc44)))

;sum in squares = 10
(assert (= 10 (+ rc11 rc12 rc21 rc22)))
(assert (= 10 (+ rc13 rc14 rc23 rc24)))
(assert (= 10 (+ rc31 rc32 rc41 rc42)))
(assert (= 10 (+ rc33 rc34 rc43 rc44)))

(check-sat)
(get-model)