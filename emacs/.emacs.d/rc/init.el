;; GUI options
(tool-bar-mode -1)
(global-tab-line-mode 1)

(setq mouse-autoselect-window t)  ;; focus follows mouse
(setq vc-follow-symlinks t)  ;; always follow symlinks
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; Emacs 24+ has built-in package.el
(setq package-archives
      '(("gnu" . "http://elpa.gnu.org/packages/")
        ;; ("marmalade" . "http://marmalade-repo.org/packages/")
        ("melpa" . "https://melpa.org/packages/")
        ))
;; To Update: M-x package-refresh-contents
;; To install: M-x package-install [ret] package-name
;; To reinstall desired packages:
;;    M-x package-install-selected-packages

;; never use tabs
(setq-default indent-tabs-mode nil)

;; run in server mode so that emacsclient stuff can work
(server-start)
