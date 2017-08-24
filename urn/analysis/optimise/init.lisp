(import lua/os os)

(import urn/analysis/nodes ())
(import urn/analysis/pass ())
(import urn/analysis/transform (transformer))
(import urn/analysis/usage usage)

(import urn/analysis/optimise/fusion opt)
(import urn/analysis/optimise/simple opt)
(import urn/analysis/optimise/usage opt)
(import urn/analysis/optimise/inline opt)

(defun optimise-once (nodes state passes)
  "Run all optimisations on NODES once"
  (let [(tracker (create-tracker))
        (lookup {})]
    (for-each pass (.> passes :normal)
      (run-pass pass state tracker nodes lookup))

    (run-pass usage/tag-usage state tracker nodes lookup)
    (run-pass transformer state tracker nodes lookup (.> passes :transform))
    (for-each pass (.> passes :usage)
      (run-pass pass state tracker nodes lookup))

    (changed? tracker)))

(defun optimise (nodes state passes)
  ;; Do a simple purge of unused nodes.
  (opt/strip-defs-fast nodes)

  ;; Run the main optimiser until a "fixed point" is reached
  (let* [(max-n (.> state :max-n))
         (max-t (.> state :max-time))
         (iteration 0)
         (finish (+ (os/clock) max-t))
         (changed true)]
    (while (and changed (or (< max-n 0) (< iteration max-n)) (or (< max-t 0) (< (os/clock) finish)))
      (set! changed (optimise-once nodes state passes))
      (inc! iteration))))

(defun default ()
  "Create a collection of default optimisations."
  { :normal (list opt/strip-import
                  opt/strip-pure
                  opt/constant-fold
                  opt/cond-fold
                  opt/lambda-fold
                  opt/fusion)
    :usage (list opt/strip-defs
                 opt/strip-args
                 opt/variable-fold
                 opt/cond-eliminate
                 opt/expression-fold
                 opt/inline)
    :transform '() })
