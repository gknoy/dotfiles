;; -- Set up buffers convenience bits

;; GK: <...> keybinds only work in gui.
;; (c.f. http://ergoemacs.org/emacs/emacs_key_notation_return_vs_RET.html)
;; keys M-s-left/right for mac
(global-set-key (kbd "<M-s-left>") 'previous-buffer)
(global-set-key (kbd "<M-s-right>") 'next-buffer)

;; per http://stackoverflow.com/questions/9688748/emacs-comment-uncomment-current-line
(defun comment-or-uncomment-region-or-line ()
    "Comments or uncomments the region or the current line if there's no active region."
    (interactive)
    (let (beg end)
        (if (region-active-p)
            (setq beg (region-beginning) end (region-end))
            (setq beg (line-beginning-position) end (line-end-position)))
        (comment-or-uncomment-region beg end)))

(global-set-key (kbd "s-/") 'comment-or-uncomment-region-or-line)

;; Various key bindings
(global-set-key (kbd "C-x p") 'back-window)
(global-set-key (kbd "C-x C-p") 'back-window)
(global-set-key (kbd "C-x P") 'previous-multiframe-window)
(global-set-key (kbd "C-x O") 'next-multiframe-window)
(global-set-key (kbd "C-x C-o") 'other-window)
(global-set-key (kbd "M-z") 'compile)
(global-set-key (kbd "M-g G") 'grep)
(global-set-key (kbd "M-G") 'grep)
;; (global-set-key (kbd "A-k") 'erase-buffer)
;; (global-set-key [f7] 'magit-status)

;; package-install multiple-cursors
(global-unset-key (kbd "M-<down-mouse-1>"))
(global-set-key (kbd "M-<mouse-1>") 'mc/add-cursor-on-click)
