(* # 1 *)
fun is_older (date1 : (int * int * int), date2 : (int * int * int)) =
if #1 date1 <> #1 date2 (* If year is not equal, compare year. *)
then #1 date1 < #1 date2
else if #2 date1 <> #2 date2 (* If month is not equal, compare month. *)
     then #2 date1 < #2 date2
     else if #3 date1 <> #3 date2 (* If date is not equal, compare date. *)
          then #3 date1 < #3 date2
          else false (* If the two dates are the same, the result is false. *)



(* # 2 *)
fun number_in_month (dates : (int * int * int) list, month : int) =
let
  (* Define a new function so that parameter month do not pass in every recursion *)
  fun number_in_given_month (dates : (int * int * int) list) =
    if null dates
    then 0
    else if (#2 (hd dates) = month) (* Compare month of the first element in list with given month *)
         then 1 + number_in_given_month(tl dates) (* Recursively examine the tail of the list *)
         else number_in_given_month(tl dates)
in number_in_given_month(dates)
end



(* # 3 *)
fun number_in_months (dates : (int * int * int) list, months : int list) =
if null months
then 0
else number_in_month(dates, hd months) + number_in_months(dates, tl months)


(* # 4 *)
fun dates_in_month (dates : (int * int * int) list, month : int) =
let
  fun dates_in_given_month (dates : (int * int * int) list) =
    if null dates
    then []
    else if (#2 (hd dates)) = month
         then (hd dates) :: dates_in_given_month(tl dates)
         else dates_in_given_month(tl dates)
in dates_in_given_month(dates)
end



(* # 5 *)
fun dates_in_months (dates : (int * int *int) list, months : int list) =
if null months
then []
else dates_in_month(dates, hd months) @ dates_in_months(dates, tl months)


(* # 6 *)
fun get_nth (strings : string list, n : int) =
if n = 1
then hd strings
else get_nth(tl strings, n - 1)



(* # 7 *)
fun date_to_string (date : (int * int * int)) =
let
  val months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
  val month = get_nth(months, #2 date)
in month ^ " " ^ Int.toString(#3 date) ^ ", " ^ Int.toString(#1 date)
end



(* # 8 *)
fun number_before_reaching_sum (sum : int, nums : int list) =
if sum - hd nums <= 0
then 0
else number_before_reaching_sum(sum - hd nums, tl nums) + 1



(* # 9 *)
fun what_month (day : int) =
let
  val months = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];
in number_before_reaching_sum(day, months) + 1
end


(* # 10 *)
fun month_range (day1 : int, day2 : int) =
if day1 > day2
then []
else what_month(day1)::month_range(day1 + 1, day2)



(* # 11 *)
fun oldest (days : (int * int * int) list) =
if null days (* Empty list *)
then NONE
else
  let
    fun oldest_nonempty (days : (int * int * int) list) =
      if null (tl days) (* One day list *)
      then hd days
      else let val tl_ans = oldest_nonempty(tl days) (* Oldest day of tail list *)
           in
             if is_older(hd days, tl_ans) (* Compare first day in the list and
             oldest day of the tail list *)
             then hd days
             else tl_ans
           end
  in
    SOME(oldest_nonempty(days))
  end



