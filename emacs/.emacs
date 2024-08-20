;; -*- mode: emacs-lisp -*-

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

;; Load common config from my emacs.d/rc folder
(load-file "~/.emacs.d/rc/gk.el")

;; --- Auto-maintained customization options handled by emacs
;;    package-selected-packages has all packages that I have installed
;;    Reinstall with (package-install-selected-packages)
;;    or M-x package-install-selected-packages
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(cua-mode t nil (cua-base))
 '(inhibit-startup-screen t)
 '(package-selected-packages
   '(dockerfile-mode multiple-cursors magit markdown-mode))
 '(save-place t nil (saveplace))
 '(save-place-mode t nil (saveplace))
 '(scroll-bar-mode 'right)
 '(show-paren-mode t)
 '(transient-mark-mode t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:height 160 :foundry "unknown" :family "JetBrains Mono")))))

;; ==> Ligatures work if this renders with a ligature ;)
