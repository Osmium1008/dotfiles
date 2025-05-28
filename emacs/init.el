;;; init.el --- for compile org setting files -*- coding: utf-8; lexical-binding: t; -*-
;; Author: Osmium_1008 (osmium1008@gmail.com)
;; Version: 0.1

;;; Commentary:

;;; Code:

;; Create ELisp files and byte-compile.
(eval-when-compile
  (require 'org)
  (let ((lisp_path (locate-user-emacs-file "lisp")))
    (unless (file-directory-p lisp_path) (mkdir lisp_path)))
  (org-babel-tangle-file (locate-user-emacs-file "config.org"))
  (org-babel-tangle-file (locate-user-emacs-file "custom-azik.org")))

(add-to-list 'load-path (locate-user-emacs-file "lisp"))
(require 'config)

(provide 'init)

;;; init.el ends here
