;;; korfuri--autocompletion -- my setup for company

;;; Commentary:
;; Other modules should work regardless of whether this is enabled,
;; but language modules should always set up company for their
;; language in case company is enabled.

;;; Code:

(custom-set-variables
 '(company-idle-delay 0)
 '(company-minimum-prefix-length 1)
 '(global-company-mode t))

(custom-set-faces
 '(company-tooltip ((t (:background "white" :foreground "magenta" :width normal)))))

(use-package company
  :ensure t
  :init (global-company-mode))

(define-key company-mode-map [remap indent-for-tab-command]
  'company-indent-for-tab-command)

(setq tab-always-indent 'complete)

(defvar completion-at-point-functions-saved nil)

(defun company-indent-for-tab-command (&optional arg)
  (interactive "P")
  (let ((completion-at-point-functions-saved completion-at-point-functions)
        (completion-at-point-functions '(company-complete-common-wrapper)))
    (indent-for-tab-command arg)))

(defun company-complete-common-wrapper ()
  (let ((completion-at-point-functions completion-at-point-functions-saved))
    (company-complete-common)))

(provide 'korfuri--autocompletion)
