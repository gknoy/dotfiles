;; --> Emacs auto-saves custom-* stuff in .emacs so don't redo it here
;; (custom-set-faces
;;  '(default
;;    ((t
;;      (:height 160
;;       :foundry "unknown" :family "JetBrains Mono"))))
;;  )

;; from https://emacs.stackexchange.com/questions/55059/ligatures-with-the-jetbrains-mono-font
(defconst jetbrains-ligature-mode--ligatures
   '("-->" "//" "/**" "/*" "*/" "<!--" ":=" "->>" "<<-" "->" "<-"
     "<=>" "==" "!=" "<=" ">=" "=:=" "!==" "&&" "||" "..." ".."
     "|||" "///" "&&&" "===" "++" "--" "=>" "|>" "<|" "||>" "<||"
     "|||>" "<|||" ">>" "<<" "::=" "|]" "[|" "{|" "|}"
     "[<" ">]" ":?>" ":?" "/=" "[||]" "!!" "?:" "?." "::"
     "+++" "??" "###" "##" ":::" "####" ".?" "?=" "=!=" "<|>"
     "<:" ":<" ":>" ">:" "<>" "***" ";;" "/==" ".=" ".-" "__"
     "=/=" "<-<" "<<<" ">>>" "<=<" "<<=" "<==" "<==>" "==>" "=>>"
     ">=>" ">>=" ">>-" ">-" "<~>" "-<" "-<<" "=<<" "---" "<-|"
     "<=|" "/\\" "\\/" "|=>" "|~>" "<~~" "<~" "~~" "~~>" "~>"
     "<$>" "<$" "$>" "<+>" "<+" "+>" "<*>" "<*" "*>" "</>" "</" "/>"
     "<->" "..<" "~=" "~-" "-~" "~@" "^=" "-|" "_|_" "|-" "||-"
     "|=" "||=" "#{" "#[" "]#" "#(" "#?" "#_" "#_(" "#:" "#!" "#="
     "&="))

(sort jetbrains-ligature-mode--ligatures
      (lambda (x y) (> (length x) (length y))))
(dolist (pat jetbrains-ligature-mode--ligatures)
  (set-char-table-range
   composition-function-table
   (aref pat 0)
   (nconc
    (char-table-range
     composition-function-table (aref pat 0))
    (list (vector (regexp-quote pat)
                  0
                  'compose-gstring-for-graphic)))))

