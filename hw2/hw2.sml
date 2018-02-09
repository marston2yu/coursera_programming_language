(* Dan Grossman, Coursera PL, HW2 Provided Code *)

(* if you use this function to compare two strings (returns true if the same
   string), then you avoid several of the functions in problem 1 having
   polymorphic types that may be confusing *)
fun same_string(s1 : string, s2 : string) =
    s1 = s2
(* put your solutions for problem 1 here *)

(* #a *)
fun all_except_option(target, sl) = 
	case sl of
		[] => NONE (* Empty list or recursively reaching the end of the list. *)
		| str::sl' => if same_string(str, target) 
					  then SOME sl' (* Find matching, overlook this string and return tail. *)
				  	  else case all_except_option(target, sl') of (* Not matching, search next item. *)
					  	  	NONE => NONE (* No matching in the tail, so the final result is not found *)
					  	  	| SOME x => SOME(str::x) (* If find string in the tail, add the string to the list *)

(* #b *)
fun get_substitutions1(sll : string list list, str : string) = 
	case sll of
		[] => [] (* If string list list is empty, return empty list. *)
		| sl::sll' =>   case all_except_option(str, sl) of 
							NONE => get_substitutions1(sll', str) (* If match NONE, no list append. *)
							| SOME x  => x @ get_substitutions1(sll', str) (* If match SOME, append the trim part. *)

(* #c *)
fun get_substitutions2(sll, str) = 
	let fun aux(sll, str, accu) = 
			case sll of
				[] => accu (* If string list list is empty, return unchanged accumulator. *)
				| sl::sll' => case all_except_option(str, sl) of
								NONE => aux(sll', str, accu)
								| SOME x => aux(sll', str, accu @ x)
	in aux(sll, str, [])
	end

(* #d *)

fun similar_names(sll, fname) = 
	let fun helper(sub, y, z) = (* Take a list of substitution first names and generate a list of full names. *)
			case sub of
				[] => []
				| firstn::sub' => {first=firstn, middle=y, last=z}::helper(sub', y, z)
	in case fname of
			{first=x, middle=y, last=z} => helper(x::get_substitutions2(sll, x), y, z) (* Original name should be included. *)
	end

(* you may assume that Num is always used with values 2, 3, ..., 10
   though it will not really come up *)
datatype suit = Clubs | Diamonds | Hearts | Spades
datatype rank = Jack | Queen | King | Ace | Num of int 
type card = suit * rank

datatype color = Red | Black
datatype move = Discard of card | Draw 

exception IllegalMove

(* put your solutions for problem 2 here *)

fun card_color(card) = 
	case card of
		(Clubs, _) => Black
		|(Diamonds, _) => Red
		|(Hearts, _) => Red
		|(Spades, _) => Black

fun card_value(card) = 
	case card of 
		(_, Ace) => 11
		|(_, Num i) => i
		|(_, _) => 10

fun remove_card(cs, c, e) = 
	case cs of
		[] => raise e
		| card::cs' => 	if card = c
						then cs'
						else card::remove_card(cs', c, e)


fun all_same_color(cs) = 
	case cs of
		[] => true
		| c1::[] => true
		| c1::(c2::cs') => (card_color(c1) = card_color(c2)) andalso all_same_color(c2::cs')


fun sum_cards(cs) = 
	let fun sum(cs, accu) = 
			case cs of
				[] => accu
				|c::cs' => sum(cs', accu + card_value(c))
	in sum(cs, 0)
	end


fun score(held_cards, goal) = 
	let val sum = sum_cards(held_cards)
		val pre_score = if sum > goal then 3 * (sum - goal) else goal - sum
	in
		if all_same_color(held_cards) then pre_score div 2 else pre_score
	end

fun officiate(card_list, moves, goal) = 
	let fun helper(card_list, ms, held_cards) = 
			let val sc = score(held_cards, goal) (* Calculate score. *)
			in 
				if sum_cards(held_cards) > goal then sc else (* If score is greater than goal, game ends. *)
				case ms of 
					[] => sc (* Empty ms, return score. *)
					|move::ms' => case move of
										(* Discard card, i.e. remove card from held cards. *)
										Discard c => helper(card_list, ms', remove_card(held_cards, c, IllegalMove))
										(* Draw card, i.e. remove first card from cards list and add it to held cards. *)
										|Draw 	  => case card_list of 
														[] 	   => sc (* Empty card list, return score *)
														|c::card_list' => helper(card_list', ms', c::held_cards)
			end
	in helper(card_list, moves, [])
	end













