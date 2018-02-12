(*Homework3 Simple Test*)
(* These are basic test cases. Passing these tests does not guarantee that your code will pass the actual homework grader *)
(* To run the test, add a new line to the top of this file: use "homeworkname.sml"; *)
(* All the tests should evaluate to true. For example, the REPL should say: val test1 = true : bool *)
use "hw3.sml";

val test11 = only_capitals ["A","B","C"] = ["A","B","C"]
val test12 = only_capitals ["A", "B", "c"] = ["A","B"]
val test21 = longest_string1 ["A","bc","C"] = "bc"
val test22 = longest_string1 ["A","bc","C","cd"] = "bc"
val tset23 = longest_string1 [] = ""
val test31 = longest_string2 ["A","bc","C"] = "bc"
val test32 = longest_string2 ["A","bc","C","cd"] = "cd"
val tset33 = longest_string2 [] = ""
val test41a = longest_string3 ["A","bc","C"] = "bc"
val test42a = longest_string3 ["A","bc","C","cd"] = "bc"
val tset43a = longest_string3 [] = ""
val test41b = longest_string4 ["A","B","C"] = "C"
val test42b = longest_string4 ["A","bc","C","cd"] = "cd"
val tset43b = longest_string4 [] = ""
val test51 = longest_capitalized ["A","bc","C"] = "A"
val test52 = longest_capitalized ["bc"] = ""
val test53 = longest_capitalized ["A","bc","C","CD","D","DD"] = "CD"


val test6 = rev_string "abc" = "cba"

val test71 = first_answer (fn x => if x > 3 then SOME x else NONE) [1,2,3,4,5] = 4
val test72 = first_answer (fn x => if x > 4 then SOME x else NONE) [1,2,3,4,5] = 5

val test81 = all_answers (fn x => if x = 1 then SOME [x] else NONE) [2,3,4,5,6,7] = NONE
val test82 = all_answers (fn x => if x = 1 then SOME [x] else NONE) [1,1] = SOME [1,1]
val test83 = all_answers (fn x => if x = 1 then SOME [x] else NONE) [] = SOME []

val test91a = count_wildcards Wildcard = 1
val test92a = count_wildcards (Variable "a") = 0
val test93a = count_wildcards (ConstructorP ("a", Wildcard)) = 1
val test94a = count_wildcards (ConstructorP ("a", Variable "b")) = 0
val test95a = count_wildcards (TupleP [Wildcard, Variable "a", Wildcard, ConstructorP ("a", Wildcard)]) = 3

val test91b = count_wild_and_variable_lengths (Variable("a")) = 1
val test92b = count_wild_and_variable_lengths (TupleP [Wildcard, Variable "acd", Wildcard, ConstructorP ("a", Variable "ab")]) = 7

val test91c = count_some_var ("x", Variable("x")) = 1
val test92c = count_some_var ("x", TupleP [Wildcard, Variable "x", Wildcard, ConstructorP ("x", Variable "x")]) = 2


val test101 = check_pat (Variable("x")) = true
val test102 = check_pat (TupleP [Wildcard, Variable "x", Wildcard, ConstructorP ("x", Variable "x")]) = false
val test103 = check_pat (TupleP [Wildcard, Variable "x1", Wildcard, ConstructorP ("x", Variable "x2")]) = true

val test111 = match (Const(1), UnitP) = NONE
val test112 = match (Const(1), ConstP 1) = SOME []
val test113 = match (Unit, UnitP) = SOME []
val test114 = match (Tuple [],TupleP [Wildcard, Variable "x1", Wildcard, ConstructorP ("x", Variable "x2")]) = NONE
val test115 = match (Tuple [Unit,Const 1,Const 2, Constructor("x", Const 3)],TupleP [Wildcard, Variable "x1", Wildcard, ConstructorP ("x", Variable "x2")]) = SOME [("x2",Const 3),("x1",Const 1)]
val test116 = match (Tuple[Const 17,Unit,Const 4,Constructor ("egg",Const 4),Constructor ("egg",Constructor ("egg",Const 4)),Tuple[Const 17,Unit,Const 4,Constructor ("egg",Const 4),Constructor ("egg",Constructor ("egg",Const 4))],Tuple[Unit,Unit],Tuple[Const 17,Const 4],Tuple[Constructor ("egg",Const 4),Constructor ("egg",Const 4)]],
					TupleP[ConstP 17,Wildcard,ConstP 4,ConstructorP ("egg",ConstP 4),ConstructorP ("egg",ConstructorP ("egg",ConstP 4)),TupleP[ConstP 17,Wildcard,ConstP 4,ConstructorP ("egg",ConstP 4),ConstructorP ("egg",ConstructorP ("egg",ConstP 4))],TupleP[Wildcard,Wildcard],TupleP[ConstP 17,ConstP 4],TupleP[ConstructorP ("egg",ConstP 4),ConstructorP ("egg",ConstP 4)]])
					= SOME []
val test117 = match (Const 17,ConstP 4) = NONE

val test121 = first_match Unit [UnitP] = SOME [] 
val test122 = first_match Unit [] = NONE
val tset123 = first_match (Const 6) [UnitP, (ConstP 6), Variable "xs"] = SOME []
val tset124 = first_match (Const 6) [UnitP, Variable "xs", (ConstP 6)] = SOME [("xs", (Const 6))]

