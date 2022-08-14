# Chapter1 

# Building Abstractions with Procedures 

##  1.1 The Elements of Programming

A powerful programming language is more than just a means for instructing a computer to perform tasks.we should pay particular attention to the means that the language provides for  combining simple ideas to form more complex ideas. Every powerful language has three mechanisms for  accomplishing this: 

- **primitive expressions**, which represent the simplest entities the language is concerned with 
- **means of combination**, by which compound elements are built from simpler ones, and 
- **means of abstraction**, by which compound elements can be named and manipulated as units 

### 1.1.1 Expressions

One kind of primitive expression you might type is a number. If you present Lisp with a number 486 and the interpreter will respond by printing

```scheme
486
```

Expressions representing numbers may be combined with an expression representing a primitive  procedure (such as **+** or *****) to form a compound expression that represents the application of the procedure 

```scheme
(+ 137 349)
486
(- 1000 334)
666
(* 5 99)
495
(/ 10 5)
2 
(+ 2.7 10)
12.7
```

Expressions such as these, formed by delimiting a list of expressions within parentheses in order to denote  procedure **application**, are called **combinations.** The leftmost element in the list is called the **operator**, and  the other elements are called **operands**. 

The convention of placing the operator to the left of the operands is known as **prefix notation**.

Its advantage is that it can accommodate  procedures that may take an arbitrary number of arguments, as in the following examples:

```scheme
(+ 21 35 12 7)
75
(* 25 4 12)
1200
```

And there is **no limit (in principle) to the depth** of such nesting and to the overall complexity of the expressions  that the Lisp interpreter can evaluate. 

```scheme
(+ (* 3
 		(+ (* 2 4)
 			(+ 3 5)))
	(+ (- 10 7)
 		6))
```

following a formatting convention known as **pretty-printing** ,in which each long combination is written so  that the operands are aligned vertically .

Even with complex expressions, the interpreter always operates in the same basic cycle: It reads an  expression from the terminal, evaluates the expression, and prints the result. This mode of operation is  often expressed by saying that the interpreter runs in a read-eval-print loop.  

### 1.1.2 Naming and the Environment

A critical aspect of a programming language is the means it provides for using names to refer to  computational objects. We say that the name identifies a **variable** whose **value** is the object. 

In the Scheme dialect of Lisp, we name things with **define** 

`(define size 2)`

causes the interpreter to associate the value 2 with the name **size** ， Once the name **size** has been  associated with the number 2, we can refer to the value 2 by name:

```scheme
size
2
(* 5 size)
10
```

Define is our language's simplest means of abstraction, for **it allows us to use simple names to refer to  the results of compound operations.**

### 1.1.3 Evaluating Combinations

To evaluate a combination, do the following:  

- Evaluate the subexpressions of the combination
- Apply the procedure that is the value of the leftmost subexpression (the operator) to  the arguments that are the values of the other subexpressions (the operands).  

Each combination is  represented by a node with branches corresponding to the operator and the operands of the combination  stemming from it. The terminal nodes (that is, nodes with no branches stemming from them) represent  either operators or numbers. 

![](img/1-1-1.png)

In fact, the ``percolate values upward'' form of the evaluation rule is an example of a  general kind of process known as tree accumulation. 

We take care of the primitive cases by stipulating that

- the values of numerals are the numbers that they name 
- the values of built-in operators are the machine instruction sequences that carry out the  corresponding operations, and 
- the values of other names are the objects associated with those names in the environment. 

 the values of other names are the objects associated with those names in the environment. 

`(define x 3)` is not a combination because the purpose of the define is precisely to associate x with a value 

### 1.1.4 Compound Procedures

We have identified in Lisp some of the elements that must appear in any powerful programming language: 

- Numbers and arithmetic operations are primitive data and procedures. 
- Nesting of combinations provides a means of combining operations 
- Definitions that associate names with values provide a limited means of abstraction.  

Now we will learn about procedure definitions, a much more powerful abstraction technique by which a  compound operation can be given a name and then referred to as a unit. 

![](img/1-1-2.png)

The general form of a procedure definition is 
$$
(define  (<name> <formal parameters>)<body>)
$$
The  <formal parameters> are the names used within the body of the procedure to refer to the corresponding arguments  of the procedure.  

we can even put more examples:

```scheme
(define (sum-of-squares x y)
 (+ (square x) (square y)))
 
 
(sum-of-squares 3 4)
```

Now we can use sum-of-squares as a building block in constructing further procedures 

```scheme
(define (f a)
 (sum-of-squares (+ a 1) (* a 2)))
(f 5)
```

Compound procedures are used in exactly the same way as primitive procedures. Indeed, one could not tell  by looking at the definition of sum-of-squares given above whether square was built into the  interpreter, like + and *, or defined as a compound procedure.

### 1.1.5 The Substitution Model for Procedure Application

We can assume that the mechanism for applying primitive procedures to arguments is built into the  interpreter. For compound procedures, the application process is as follows: 

- To apply a compound procedure to arguments, evaluate the body of the procedure with each  formal parameter replaced by the corresponding argument.  

Two points to be stressaed:

-  The purpose of the substitution is to help us think about procedure application, not to provide a  description of how the interpreter really works. Typical interpreters do not evaluate procedure  applications by manipulating the text of a procedure to substitute values for the formal parameters.  In practice, the ``substitution'' is accomplished by using a local environment for the formal  parameters. We will discuss this more fully in chapters 3 and 4 when we examine the  implementation of an interpreter in detail 
- Over the course of this book, we will present a sequence of increasingly elaborate models of how  interpreters work, culminating with a complete implementation of an interpreter and compiler in  chapter 5. The substitution model is only the first of these models -- a way to get started thinking  formally about the evaluation process. In general, when modeling phenomena in science and  engineering, we begin with simplified, incomplete models. As we examine things in greater detail,  these simple models become inadequate and must be replaced by more refined models. The  substitution model is no exception. In particular, when we address in chapter 3 the use of  procedures with ``mutable data,'' we will see that the substitution model breaks down and must be  replaced by a more complicated model of procedure application.

#### Applicative order VS normal order

​	An alternative evaluation model would not evaluate the operands until their values  were needed. Instead it would first substitute operand expressions for parameters until it obtained an  expression involving only primitive operators, and would then perform the evaluation. For Example：

![](img/1-1-4.png)

In particular, the  evaluations of (+ 5 1) and (* 5 2) are each performed twice here, corresponding to the reduction of  the expression.This alternative **fully expand and then reduce** evaluation method is known as **normal-order evaluation**,  in contrast to the **evaluate the arguments and then apply**' method that the interpreter actually uses, which  is called **applicative-order evaluation**. 

### 1.1.6 Conditional Expressions and Predicates 

$$
|x| = 
	\begin{cases}
		x &\text{if  x > 0 }\\
		0 & \text{if  x = 0} \\
		-x & \text{if x < 0}
	\end{cases}
$$

This construct is called a case analysis, and there is a special form in Lisp for notating such a case  analysis. It is called **cond** (which stands for ``conditional''), and it is used as follows: 

```scheme
(define (abs x)
	(cond ((> x 0) x)
		  ((= x 0) 0)
		  ((< x 0) (-x))))
```

The general form of a conditional expression is 

```scheme
(cond (<p1> <e1>)
 	  (<p2> <e2>)
 	  ...
 	  (<pn> <en>))
```

Consisting of the symbol cond followed by parenthesized pairs of expressions` ( <p><e>) `called  clauses. The first expression in each pair is a predicate -- that is, an expression whose value is interpreted  as either true or false 

The predicate `<p1>`  is evaluated first. If its value is false,  then  is evaluated. This process continues until a  predicate is found whose value is true, in which case the interpreter returns the value of the corresponding  consequent expression `<e>` of the clause as the value of the conditional expression. If none of the 's is  found to be true, the value of the cond is undefined. 

Another way to write the absolute-value procedure is 

```scheme
(define (abs x)
	(cond ((< x 0) (-x))
	(else x)))
```

 `Else` is a  special symbol that can be used in place of the `<p>` in the final clause of a `cond`.

 Here is yet another way to write the absolute-value procedure 

```scheme
(define (abs x)
	(if (< x 0)
		(-x)
		x))
```

This uses the special form if, a restricted type of conditional that can be used when there are precisely  two cases in the case analysis. The general form of an if expression is 
$$
\text{(if <predicate> <consequent><alternative>)}
$$
some other primitive procedure

![](img/1-1-3.png)



### 1.1.7 Example:Square Roots by Newton's Method

$$
\sqrt{x} = \text{the y such that y >= 0 and } y^2 = x
$$

we can define the square-root funcion as above.

The contrast between function and procedure is a reflection of the general distinction between describing  properties of things and describing how to do things, or, as it is sometimes referred to, the distinction  between declarative knowledge and imperative knowledge.

So we can write the basic procedure:

```lisp
(define (sqrt-iter guess x )
	(if (good-enough? guess x)
		guess
		(sqrt-iter(improve guess x)
		x)))
```

A guess is improved by averaging it with the quotient of the radicand and the old guess: 

```lisp
(define (improve guess x)
 (average guess (/ x guess)))
```

where:

```lisp
(define (average x y)
 (/ (+ x y) 2))
(define (good-enough? guess x)
 (< (abs (- (square guess) x)) 0.001))
```

Finally,we can get all the things.

### 1.1.8 Procedures as Black-Box Abstractions

![](img/1-1-5.png)

​	A procedure definition should be able to **suppress detail**. The users of the procedure may not have  written the procedure themselves, but may have obtained it from another programmer as a black box. A  user should not need to know how the procedure is implemented in order to use it. 

#### Local names

This principle -- that the meaning of a procedure should be independent of the parameter names used by its  author -- seems on the surface to be self-evident, but its consequences are profound. The simplest  consequence is that the parameter names of a procedure must be local to the body of the procedure. For  example, we used square in the definition of good-enough? in our square-root procedure.

A formal parameter of a procedure has a very special role in the procedure definition, in that it doesn't  matter what name the formal parameter has.  

#### Internal definitions and block structure

we allow  a procedure to have internal definitions that are local to that procedure. For example, in the square-root  problem we can write 

```lisp
(define (sqrt x)
 (define (good-enough? guess x)
 	(< (abs (- (square guess) x)) 0.001))
 (define (improve guess x)
 	(average guess (/ x guess)))
 (define (sqrt-iter guess x)
 	(if (good-enough? guess x)
 		guess
 		(sqrt-iter (improve guess x) x)))
 	(sqrt-iter 1.0 x))
```

Such nesting of definitions, called **block structure**, is basically the right solution to the simplest name-packaging problem.   it is not necessary to pass x explicitly to each of these procedures. Instead, we allow x to be a free variable in the internal definitions, as shown below. Then x gets its value from the argument with which  the enclosing procedure sqrt is called. This discipline is called **lexical scoping** 

```lisp
(define (sqrt x)
 	(define (good-enough? guess)
 		(< (abs (- (square guess) x)) 0.001))
 	(define (improve guess)
 		(average guess (/ x guess)))
 	(define (sqrt-iter guess)
 		(if (good-enough? guess)
 			guess
 			(sqrt-iter (improve guess))))
 	(sqrt-iter 1.0))
```















