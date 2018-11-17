(import lua/basic (_ENV _G))
(import lua/os os)
(import io)

(defun resolve-path (path)
  (if (and (.> _ENV :shell) (.> _ENV :shell :resolve))
    ((.> _ENV :shell :resolve) path)
    path))

(defun is-computercraft? ()
  (or (.> _G :_CC_VERSION)
      (.> _G :_HOST)))

(defun read-file! (path)
  ; ComputerCrafts io implementation is broken.
  (if (is-computercraft?)
    (with (handle ((.> _G :fs :open) path "r"))
      (if handle
        (with (data (self handle :readAll))
          (self handle :close)
          data)
        nil))
    (io/read-all! path)))

(defun read-file-force! (path)
  (with (result (read-file! path))
    (if result
      result
      (error! (format nil "could not read file \"{#path}\"")))))


(defun get-time-raw () :hidden
  (if (is-computercraft?)
    (os/clock)
    (os/time)))

(define startup-time :hidden
  (get-time-raw))

(defun get-time ()
  (- (get-time-raw) startup-time))
