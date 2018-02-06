(* Homework1 Simple Test *)
(* These are basic test cases. Passing these tests does not guarantee that your code will pass the actual homework grader *)
(* To run the test, add a new line to the top of this file: use "homeworkname.sml"; *)
(* All the tests should evaluate to true. For example, the REPL should say: val test1 = true : bool *)

use "hw1.sml";
(* test is_older *)

val test1 = is_older ((1,2,3),(2,3,4)) = true
val test2 = is_older ((2,2,3),(1,3,4)) = false
val test3 = is_older ((2,2,3),(2,3,4)) = true
val test4 = is_older ((2,3,3),(2,2,4)) = false
val test5 = is_older ((2,3,3),(2,3,4)) = true
val test6 = is_older ((2,3,4),(2,3,3)) = false
val test7 = is_older ((2,3,4),(2,3,4)) = false
val test8 = is_older ((1,2,3),(2,3,4)) = true

(* test number_in_month *)
val test9 = number_in_month ([(2012,2,28), (2012,2,28),(2012,2,28),(2012,2,28),(2013,12,1)],2)  = 4
val test10 = number_in_month ([],2)                                                              = 0
val test11 = number_in_month ([(2012,2,28), (2012,2,28),(2012,2,28),(2012,2,28),(2013,12,1)],12) = 1
val test12  = number_in_month ([(2012,2,28),(2013,12,1)],2)                                       = 1

val test13 = number_in_months ([(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28)],[2,3,4]) = 3
val testt2 = number_in_months ([(2012,2,28),(2013,12,1)], [2, 3, 4]) = 1
(* test dates_in_month *)

val test14 = dates_in_month ([(2012,2,28),(2013,12,1)],2) = [(2012,2,28)] 
val test15 = dates_in_month ([],2) = [] 
val test16 = dates_in_month ([(2012,2,28),(2013,2,25),(2011,12,1)],2) = [(2012,2,28),(2013,2,25)] 
val test17 = dates_in_month ([(2012,2,28),(2013,12,1)],2) = [(2012,2,28)]
(* test dates_in_months *)
val test18 = dates_in_months ([(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28)],[2,3,4]) = [(2012,2,28),(2011,3,31),(2011,4,28)]
val testt1 = dates_in_months ([],[]) = []
(* test get_nth*)
val test19 = get_nth (["hi", "there", "how", "are", "you"], 3) = "how" 
val test20 = get_nth (["hi", "there", "how", "are", "you"], 2) = "there"
(* test date_to_string *)
val test21 = date_to_string (2013, 6, 1) = "June 1, 2013" 
val test22 = date_to_string (2013, 6, 1) = "June 1, 2013"

val test23 = number_before_reaching_sum (10, [1,2,3,4,5]) = 3
(* test number_before_reaching_sum*)

val test24 = number_before_reaching_sum (10, [1,2,3,4,5]) = 3 
val test25 = number_before_reaching_sum (15, [1,2,3,4,5]) = 4 
val test26 = what_month 70 = 3

val test27 = month_range (31, 34) = [1,2,2,2]

(* test #11 *)
val testt3 = oldest([]) = NONE
val test28 = oldest([(2011,3,31)]) = SOME (2011,3,31)
(* test #12 *)
val test29 = number_in_months_challenge([(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28)],[2,3,4,4]) = 3 
val test30 = number_in_months_challenge([(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28)],[5,4,3,4,4]) = 2 
(* test #13 *)
val test31 = reasonable_date((2000, 2, 28)) = true 
val test32 = reasonable_date((2000, 2, 29)) = false
val test33 = reasonable_date((1900, 2, 29)) = false 
val test34 = reasonable_date((2004, 2, 29)) = true 
val test35 = reasonable_date((2018, 1, 31)) = true  
val test36 = reasonable_date((1900, 4, 31)) = false 
val test37 = reasonable_date((~1, 2, 29)) = false 
val test38 = reasonable_date((1900, 13, 29)) = false 
val test39 = reasonable_date((1900, 12, 0 )) = false 
