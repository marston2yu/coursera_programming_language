# Brief Note For Programming Languages Course

## Section 1

This section introduces **SML**.

Important concepts including:

- Variable binding
- **Immutable data**
- Function binding
- Pairs, tuples and lists
- Let expression
- Option

## Section 2

Important concepts including:

- Ways to build new types: each of, one of, self-reference
- Record
- Datatype binding
- **Case expression and pattern matching**
- Type synonym
- **Tail recursion**

## Section 3

Important concepts including:

- **First-class functions**: functions can be computed, passed, stored, etc. wherever other values can be computed, passed, stored, etc. 

- **Function closure**: functions that use variables defined outside of them, which makes first-class functions much more powerful.

  > A function value has two parts, the <u>code</u> for the function (obviously) and the <u>environment</u> that was current when we created the function. These two parts really do form a “pair”  which is called function closure or closure.
  >
  > The reason is that while the code itself can have free variables (variables that are not bound inside the code so they need to be bound by some outer environment), the closure carries with it an environment that provides all these bindings. So the closure overall is “closed” — it has everything it needs to produce a function result given a function argument.

- **Higher-order function**: a function that takes or returns other functions

- **Functional programming**:

  1. Using <u>immutable data</u> in most or all cases
  2. Using <u>functions as values</u>
  3. A programming style that encourages <u>recursion</u> and recursive data structures
  4. Programming with a syntax or style that is closer to traditional <u>mathematical definitions of functions</u>
  5. Using certain programming idioms related to <u>laziness</u>

- Anonymous function

- **Map, filter, fold**

  1. The map function takes a list and a function f and produces a new list by applying f to each element of the list.
  2. The filter function takes a list and a function and returns a list containing only the elements of the input list for which the function returns true
  3. The fold function takes an “initial answer” acc and uses f to “combine” acc and the first element of the list, using this as the new “initial answer” for “folding” over the rest of the list. We can use fold to take care of iterating over a list while we provide some function that expresses how to combine elements. 

- **Lexical scope**

- ML reference

	 Callback	

## Section 4

Important concepts including:

- **Type inference and its machanism**
- Mutual recursion
- **Module system and signature**
- **Standard equivalences**

## Section 5

This section turns to **Racket**. 

Important concepts including:

- Dynamic typing
- Different of `let` `let*` `letrec`
- Mutable data and `set!`
- Mutable list
- **Delayed evaluation and thunk**
- Lazy evaluation: delay, promise, force
- **Stream**
- **Memoization**
- Introduction to micro

## Section 6

Important concepts including:

- Racket struct

- Workflow for a language implementation: 

  concrete syntax ==[parser]==> abstract-syntax tree (AST) ==[type-checker]==>give error messages ==[interpreter or compiler]==>language B

- Assume giving a legal AST.

  > Personnal understanding:  need to type-check new types that we defined in new language B with language A, but we can ignore type mismatch errors in language A.

- Implement variable environment: store variable-value pair and look up value by variable name.

- Implement function closure: call (e1, e2)

  -  Evaluate **e1** in the current environment to get a **closure** 
  - Evaluate **e2** in the current environment to get  the **argument** to the closure.
  - Evaluate the body of the **code part** of the closure using the **environment part** of the closure extended with the argument of the code part mapping to the argument at the call-site.

- Metalanguage as "Macros"

## Section 7

Important concepts including:

- **Soundness, Completeness, Undecidability**
   1. soundness prevents false negatives.
   2. completeness prevents false positives.
   3.  it is impossible to implement a static checker that given any program in your language (a) always terminates, (b) is sound, and (c) is complete.
- Weak typing
- Eval and quote

## Section 8

This section turns to **Ruby**. 

Important concepts including:

- Visibility and Getters/Setters
- Dynamic class definition
- **Duck typing**
- **Arrays, Hashes and Ranges**
- **Blocks**
- The **Proc** class acts as closure
- **Subclassing and Inheritance**
- **Overriding and Dynamic dispatch**