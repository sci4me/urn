(import urn/backend/writer writer)

(defun estimate-length (node max)
  (with (tag (type node))
    (cond
      [(or (= tag "string") (= tag "number") (= tag "symbol") (= tag "key"))
       (n (number->string (.> node :contents)))]
      [(= tag "list")
       (let* ((sum 2)
              (i 1))
         (while (and (<= sum max) (<= i (n node)))
                (set! sum (+ sum (estimate-length (nth node i) (- max sum))))
                (when (> i 1) (inc! sum))
                (inc! i))
         sum)]
      [true (fail! (.. "Unknown tag " tag))])))

(defun expression (node writer)
  (with (tag (type node))
    (cond
        [(= tag "string") (writer/append! writer (string/quoted (.> node :value)))]
        [(= tag "number") (writer/append! writer (number->string (.> node :value)))]
        [(= tag "key") (writer/append! writer (.. ":" (.> node :value)))]
        [(= tag "symbol") (writer/append! writer (.> node :contents))]
        [(= tag "list")
         (writer/append! writer "(")

         (if (empty? node)
           (writer/append! writer ")")
           (let ((newline false)
                 (max (- 60 (estimate-length (car node) 60))))
             (expression (car node) writer)
             (when (<= max 0)
               (set! newline true)
               (writer/indent! writer))
             (for i 2 (n node) 1
                  (with (entry (nth node i))
                        (when (and (not newline) (> max 0))
                          (set! max (- max (estimate-length entry max)))
                          (when (<= max 0)
                            (set! newline true)
                            (writer/indent! writer)))

                        (if newline
                          (writer/line! writer)
                          (writer/append! writer " "))
                        (expression entry writer)))

             (when newline (writer/unindent! writer))
             (writer/append! writer ")")))]
        [true (fail! (.. "Unknown tag " tag))])))

(defun block (list writer)
  (for-each node list
    (expression node writer)
    (writer/line! writer)))
