(import platforms/puc/term term)
(import platforms/puc/http http)
(import util/io (run-program!))

(defun create-libs ()
  { :term (term/create)
    :http-request http/request
    :os-clock get-time! })

(defun get-time! ()
  (/ (tonumber (run-program! "date +%s%N")) 1000000000))
