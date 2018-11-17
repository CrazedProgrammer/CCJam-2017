(import lua/basic (_G))
(define fs (.> _G :fs))

(defun create (dir read-only)
  { :list (lambda (path)
            ((.> fs :list) (format nil "{#dir}/{#path}")))
    :exists (lambda (path)
              ((.> fs :exists) (format nil "{#dir}/{#path}")))
    :isDir (lambda (path)
             ((.> fs :isDir) (format nil "{#dir}/{#path}")))
    :isReadOnly (lambda (path)
                  (or read-only
                    ((.> fs :isReadOnly) (format nil "{#dir}/{#path}"))))
    :getSize (lambda (path)
               ((.> fs :getSize) (format nil "{#dir}/{#path}")))
    :getFreeSpace (lambda (path)
                    ((.> fs :getFreeSpace) (format nil "{#dir}/{#path}")))
    :makeDir (lambda (path)
               (if read-only
                 (error! "permission denied.")
                 ((.> fs :makeDir) (format nil "{#dir}/{#path}"))))
    :delete (lambda (path)
              (if read-only
                (error! "permission denied.")
                ((.> fs :delete) (format nil "{#dir}/{#path}"))))
    :move (lambda (from to)
              ((.> fs :move) (format nil "{#dir}/{#from}") (format nil "{#dir}/{#to}")))
    :copy (lambda (from to)
              ((.> fs :copy) (format nil "{#dir}/{#from}") (format nil "{#dir}/{#to}")))
    :open (lambda (path mode)
              ((.> fs :open) (format nil "{#dir}/{#path}") mode)) })