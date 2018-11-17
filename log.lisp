(import util (resolve-path get-time))
(import io (append-all!))
(import config (args))

(defun log! (message)
  (when (.> args :log-file)
    (let* [(clock (get-time))
           (time (.. (math/floor clock) "." (string/format "%02d" (* 100 (- clock (math/floor clock))))))]
      (append-all! (resolve-path (.> args :log-file)) (format nil "[{#time}] {#message}\n")))))