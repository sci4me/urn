(import test ())

(import tests/compiler/analysis/optimise/optimise-helpers ())
(import tests/compiler/compiler-helpers (create-compiler wrap-node))
(import urn/analysis/optimise/inline (score-node score-nodes inline))
(import urn/resolve/loop resolve)

(defun affirm-score (input-nodes expected)
  "Affirm that INPUT-NODES has the given EXPECTED score."

  (let* [(compiler (create-compiler))
         (resolved (car (resolve/compile
                          compiler
                          (wrap-node (list input-nodes))
                          (.> compiler :root-scope)
                          "init.lisp")))
         (seq? (lambda (_ score expected) (eq? score expected)))]

    (affirm (seq? resolved (score-node resolved 0 1e4) expected))))

(describe "The optimiser"
  (section "has an inliner"
    (it "which will inline `not` on a constant"
      (affirm-usage-optimise inline
        '((define not (lambda (x) (cond [x false] [true true])))
          (not true))
        '((define not (lambda (x) (cond [x false] [true true])))
          ((lambda (x) (cond [x false] [true true])) true))
        1))

    (it "which will inline `not` on a complex expression"
      (affirm-usage-optimise inline
        '((define not (lambda (x) (cond [x false] [true true])))
          (not (foo foo foo (lambda()) (bar))))
        '((define not (lambda (x) (cond [x false] [true true])))
          ((lambda (x) (cond [x false] [true true])) (foo foo foo (lambda()) (bar))))
        1))

    (it "which will not inline recursive definitions"
      (affirm-usage-optimise inline
        '((define loop (lambda (x) (loop 1))))
        '((define loop (lambda (x) (loop 1))))
        0)))


  (section "which can score"
    (it "simple expressions"
      (affirm-score ':foo  0)
      (affirm-score '"foo" 0)
      (affirm-score '#b001 0)
      (affirm-score 'foo   1))

    (it "simple calls"
      (affirm-score '(foo) 3)
      (affirm-score '(foo 2) 4)
      (affirm-score '(foo 2 3) 5))

    (it "lambdas"
      (affirm-score '(lambda ()) 10)
      (affirm-score '(lambda (a b c)) 10)
      (affirm-score '(lambda (a b c) a) 11))

    (it "conds"
      (affirm-score '(cond) 3)
      (affirm-score '(cond [true true]) 9)
      (affirm-score '(cond [false true] [true false]) 15))

    (it "other nodes"
      (affirm-score '{ :foo 10 } 4)
      (affirm-score ''foo 0)
      (affirm-score '`,'foo 3)
      (affirm-score '`,@foo 14))


    ))
