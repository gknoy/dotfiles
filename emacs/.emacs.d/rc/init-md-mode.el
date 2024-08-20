;; -- init markdown mode for .md files
(autoload 'gfm-mode "markdown-mode" "Major mode for editing Github flavored Markdown files" t)
(autoload 'markdown-mode "markdown-mode" "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.txt\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . gfm-mode))

;; Add custom alias to open this in a browser
(defun add-md-keybinds ()
  "Add keybinds for gfm-mode"
  (local-set-key (kbd "C-c C-c") 'browse-url-of-file))

(add-hook 'markdown-mode-hook 'add-md-keybinds)
