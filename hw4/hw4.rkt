
#lang racket

(provide (all-defined-out)) ;; so we can put tests in a second file

;; put your code below

; p1
(define (sequence low high stride)
  (if (> low high)
      (list)
      (cons low (sequence (+ low stride) high stride))))

; p2
(define (string-append-map xs suf)
  (map (lambda(x) (string-append x suf)) xs))

; p3
(define (list-nth-mod xs n)
  (cond [(< n 0) (error "list-nth-mod: negative number")]
        [(null? xs) (error "list-nth-mod: empty list")]
        [#t (car (list-tail xs (remainder n (length xs))))]))

; p4
(define (stream-for-n-steps s n)
  (if (> n 0)
      (let ([x (s)])
        (cons (car x) (stream-for-n-steps (cdr x) (- n 1))))
      '()))

; p5
(define funny-number-stream
  (letrec ([f (lambda (x) (cons (if (zero? (remainder x 5))
                                    (- 0 x)
                                    x)
                                (lambda() (f (+ x 1)))))])
    (lambda () (f 1))))

; p6
(define dan-then-dog
  (letrec ([f (lambda (s) (cons s (if (string=? s "dan.jpg")
                                    (lambda() (f "dog.jpg"))
                                    (lambda() (f "dan.jpg")))))])
    (lambda () (f "dan.jpg"))))

; p7
(define (stream-add-zero s)
  (letrec ([x (s)])
    (lambda () (cons (cons 0 (car x)) (stream-add-zero (cdr x))))))

; p8
(define (cycle-lists xs ys)
  (letrec ([f (lambda (n) (cons (cons (list-nth-mod xs n) (list-nth-mod ys n))
                                (lambda() (f (+ n 1)))))])
    (lambda() (f 0))))
  
; p9
(define (vector-assoc v vec)
  (letrec ([f (lambda(n)
                (if (or (>= n (vector-length vec)) (= 0 (vector-length vec))); search to the end or vector is empty
                    #f 
                    (letrec ([content (vector-ref vec n)])
                      (cond [(not (pair? content)) (f (+ n 1))] ; skip non-pair element.
                            [#t (if (equal? (car content) v) 
                                    content
                                    (f (+ n 1)))]))))])
    (f 0)))

; p10
(define (cached-assoc xs n)
  (letrec([memo (make-vector n #f)]
          [p 0] ; postion of recent cache
          [f (lambda (v)
               (let ([ans (vector-assoc v memo)]) ; check cache
                 (if (equal? ans #f)
                     (let ([ans-new (assoc v xs)]) ; check xs
                       (if (equal? ans-new #f)
                           ans-new
                           (begin
                             (vector-set! memo p ans-new)
                             (if (= p (- n 1)) (set! p 0) (set! p (+ p 1))) ; increase cache position
                             ans-new)))
                     ans)))])
    f))

; cp
(define-syntax while-less
  (syntax-rules (do)
    [(while-less e1 do e2)
     (letrec ([x e1]
              [f (lambda() (if (< e2 x)
                               (f)
                               #t))])
       (f))]))
              
           
         
  