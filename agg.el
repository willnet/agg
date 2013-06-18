;;; agg.el --- a grep command using ag (silver sercher) for emacs

;; Copyright (C) 2013 Shinichi Maeshima

;; Author: Shinichi Maeshima <netwillnet@gmail.com>
;; URL: http://github.com/willnet/agg

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

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
