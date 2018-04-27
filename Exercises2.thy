theory Exercises2
  imports Main
begin

(*---------------- Exercise 2.1----------------*)
value "1 + 2::nat"
value "1 + 2::int"
value "1 - 2::nat"
value "1 - 2::int"

(*---------------- Exercise 2.2----------------*)
(* add function *)
fun add :: "nat \<Rightarrow> nat \<Rightarrow> nat" where
"add m 0 = m" |
"add m (Suc n) = Suc(add m n)"

(* prove associativity of add *)
theorem add_associative : "add x (add y z) = add (add x y) z"
  apply(induction z)
   apply(auto)
  done

(* prove commutativity of add *)
(* lemma 1*)
lemma add2zero : "add 0 x = x"
  apply(induction x)
   apply(auto)
  done

(* lemma 2 *)
lemma suc_add : "Suc (add y x) = add (Suc y) x"
  apply(induction x)
   apply(auto)
  done

theorem add_commutative : "add x y = add y x"
  apply(induction y)
   apply(auto)
  apply(simp add: add2zero)
  apply(simp add: suc_add)
  done

(* double function *)
fun double :: "nat \<Rightarrow> nat" where
"double 0 = 0" |
"double (Suc m) = 2 + (double m)"

theorem double_add : "double m = add m m"
  apply(induction m)
  apply(auto)
  apply(simp add: add_commutative)
  done

(*---------------- Exercise 2.3----------------*)
(* count function *)
fun count :: "'a \<Rightarrow> 'a list \<Rightarrow> nat" where
"count x [] = 0" |
"count x (Cons y xs) = (if x=y  then Suc (count x xs) else (count x xs))"

theorem countlength[simp] : "(count x xs) \<le> List.length xs"
  apply(induction xs)
   apply(auto)
  done

(*---------------- Exercise 2.4----------------*)
(* snoc function -- reverse of cons *)
fun snoc :: "'a list \<Rightarrow> 'a \<Rightarrow> 'a list" where
"snoc Nil a = (Cons a Nil)" |
"snoc (Cons x xs) a = (Cons x (snoc xs a))"

(* reverse function*)
fun reverse :: "'a list \<Rightarrow> 'a list" where
"reverse Nil = Nil" |
"reverse (Cons x xs) = snoc (reverse xs) x"

lemma reverse_snoc

theorem double_rev[simp] : "reverse (reverse xs) = xs"
  apply(induction xs)
   apply(auto)







end