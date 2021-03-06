(import lua/basic (_G))
(define fs (.> _G :fs))

(defun create (dir)
  { :list (lambda (path)
            ((.> fs :list) (format nil "{#dir}/{#path}")))
    :exists (lambda (path)
              ((.> fs :exists) (format nil "{#dir}/{#path}")))
    :isDir (lambda (path)
             ((.> fs :isDir) (format nil "{#dir}/{#path}")))
    :isReadOnly (lambda (path)
                  ((.> fs :isReadOnly) (format nil "{#dir}/{#path}")))
    :getSize (lambda (path)
               ((.> fs :getSize) (format nil "{#dir}/{#path}")))
    :getFreeSpace (lambda (path)
                    ((.> fs :getFreeSpace) (format nil "{#dir}/{#path}")))
    :makeDir (lambda (path)
               ((.> fs :makeDir) (format nil "{#dir}/{#path}")))
    :delete (lambda (path)
              ((.> fs :delete) (format nil "{#dir}/{#path}")))
    :open (lambda (path mode)
              ((.> fs :open) (format nil "{#dir}/{#path}") mode)) })
