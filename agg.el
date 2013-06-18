(defun chomp (str)
  (replace-regexp-in-string "[\n\r]+$" "" str))

(defun agg (grep-dir command-args)
  (interactive
   (let ((dir (chomp (shell-command-to-string "pwd"))))
     (list
      (read-file-name
       "Directory for agrep: " dir dir t)
      (read-shell-command
       "Run ag (like this): "
       "PAGER='' ag --silent --color --color-match '01;31' --nogroup \"$@\" ")
      )))
  (let ((grep-use-null-device nil)
        (command
         (format "%s %s"
                 command-args
                 grep-dir)))
    (grep command)))

(provide 'agg)
