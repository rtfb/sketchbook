
; A game of Tic-Tac-Toe from the David S. Touretzky's book 'Common Lisp, A
; Gentle Introduction to Symbolic Computation'

(defun make-board ()
  (list 'board 0 0 0 0 0 0 0 0 0))

(defun convert-to-letter (v)
  (cond ((equal v 1) "O")
        ((equal v 10) "X")
        (t " ")))

(defun print-row (x y z)
  (format t "~&   ~A | ~A | ~A"
          (convert-to-letter x)
          (convert-to-letter y)
          (convert-to-letter z)))

(defun print-board (board)
  (format t "~%")
  (print-row (nth 1 board) (nth 2 board) (nth 3 board))
  (format t "~&  -----------")
  (print-row (nth 4 board) (nth 5 board) (nth 6 board))
  (format t "~&  -----------")
  (print-row (nth 7 board) (nth 8 board) (nth 9 board))
  (format t "~%~%"))

(defun make-move (player pos board)
  (setf (nth pos board) player)
  board)

(defvar *computer* 10)
(defvar *opponent* 1)
(defvar *triplets*
  '((1 2 3) (4 5 6) (7 8 9)    ; Horizontal triplets
    (1 4 7) (2 5 8) (3 6 9)    ; Vertical triplets
    (1 5 9) (3 5 7)))          ; Diagonal triplets

(defun sum-triplet (board triplet)
  (+ (nth (first triplet) board)
     (nth (second triplet) board)
     (nth (third triplet) board)))

(defun compute-sums (board)
  (mapcar #'(lambda (triplet)
          (sum-triplet board triplet))
  *triplets*))

(defun winner-p (board)
  (let ((sums (compute-sums board)))
    (or (member (* 3 *computer*) sums)
        (member (* 3 *opponent*) sums))))

(defun play-one-game ()
  (if (y-or-n-p "Would you like to go first? ")
      (opponent-move (make-board))
      (computer-move (make-board))))

(defun opponent-move (board)
  (let* ((pos (read-a-legal-move board))
         (new-board (make-move *opponent* pos board)))
    (print-board new-board)
    (cond ((winner-p new-board)
           (format t "~&You win!"))
          ((board-full-p new-board)
           (format t "~&Tie game."))
          (t (computer-move new-board)))))

(defun read-a-legal-move (board)
  (format t "~&Your move: ")
  (force-output)
  (let ((pos (read)))
    (cond ((not (and (integerp pos)
                     (<= 1 pos 9)))
           (format t "~&Invalid input.")
           (read-a-legal-move board))
          ((not (zerop (nth pos board)))
           (format t "~&That space is already occupied")
           (read-a-legal-move board))
          (t pos))))

(defun board-full-p (board)
  (not (member 0 board)))

(defun computer-move (board)
  (let* ((best-move (choose-best-move board))
         (pos (first best-move))
         (strategy (second best-move))
         (new-board (make-move *computer* pos board)))
    (format t "~&My move: ~S" pos)
    (format t "~&My strategy: ~A~%" strategy)
    (print-board new-board)
    (cond ((winner-p new-board)
           (format t "~&I win!"))
          ((board-full-p new-board)
           (format t "~&Tie game."))
          (t (opponent-move new-board)))))

; (defun choose-best-move (board)
;   (random-move-strategy board))

(defun random-move-strategy (board)
  (list (pick-random-empty-position board)))

(defun pick-random-empty-position (board)
  (let ((pos (+ 1 (random 9))))
    (if (zerop (nth pos board))
        pos
        (pick-random-empty-position board))))

(defun make-three-in-a-row (board)
  (let ((pos (win-or-block board (* 2 *computer*))))
    (and pos (list pos "make three in a row"))))

(defun block-opponent-win (board)
  (let ((pos (win-or-block board (* 2 *opponent*))))
    (and pos (list pos "block opponent"))))

(defun win-or-block (board target-sum)
  (let ((triplet (find-if #'(lambda (trip)
                              (equal (sum-triplet board trip)
                                     target-sum))
                          *triplets*)))
    (when triplet
      (find-empty-position board triplet))))

(defun find-empty-position (board squares)
  (find-if #'(lambda (pos)
               (zerop (nth pos board)))
           squares))

(defun choose-best-move (board)
  (or (make-three-in-a-row board)
      (block-opponent-win board)
      (random-move-strategy board)))
