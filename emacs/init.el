;;; init.el --- for compile org setting files -*- coding: utf-8; lexical-binding: t; -*-
;; Author: Osmium_1008 (osmium1008@gmail.com)
;; Version: 0.1

;;; Commentary:

;;; Code:

(defun update-el-file (el_file org_file skip_byte_compile)
  "Update setting files.

  EL_FILE: output file.
  ORG_FILE: input file.
  SKIP_BYTE_COMPILE: to skip byte compile."
  (unless (and (file-exists-p el_file) (file-newer-than-file-p el_file org_file))
    (progn
      (delete-file el_file)
      (org-babel-tangle-file org_file)
      (unless skip_byte_compile (byte-compile-file el_file)))))

;; Create ELisp files and byte-compile.
(eval-when-compile
  (require 'org)
  (let ((lisp_path (locate-user-emacs-file "lisp"))
        (config_el (locate-user-emacs-file "lisp/config.el"))
        (custom_azik_el (locate-user-emacs-file "lisp/custom-azik.el"))
        (config_org (locate-user-emacs-file "config.org"))
        (custom_azik_org (locate-user-emacs-file "custom-azik.org")))
    (unless (file-directory-p lisp_path) (mkdir lisp_path))
    (update-el-file config_el config_org t)
    (update-el-file custom_azik_el custom_azik_org nil)))

(add-to-list 'load-path (locate-user-emacs-file "lisp"))
(require 'config)

(provide 'init)

;;; init.el ends here
