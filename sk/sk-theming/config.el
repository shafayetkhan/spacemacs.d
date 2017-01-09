(setq-default
 theming-modifications
 '((monokai
    ;; Font locking
    ;; (font-lock-string-face :slant italic)
    ;; (font-lock-doc-face :slant italic)
    ;; (font-lock-keyword-face :weight bold :foreground "#ff4185")
    ;; (font-lock-builtin-face :foreground "#ffabd6" :weight semi-bold)
    ;; (font-lock-warning-face :underline nil)
    ;; (web-mode-html-attr-value-face
    ;;  :inherit font-lock-string-face :foreground nil)
    ;; (web-mode-html-attr-name-face
    ;;  :inherit font-lock-variable-name-face :foreground nil)
    ;; (web-mode-html-tag-face
    ;;  :inherit font-lock-builtin-face :foreground nil :weight bold)
    ;; (web-mode-html-tag-bracket-face
    ;;  :inherit web-mode-html-tag-face :foreground nil)
    ;; (web-mode-comment-face
    ;;  :inherit font-lock-comment-face :foreground nil)

    ;; TODO change helm source header color

    ;; Modeline
    ;; (header-line :box (:color "#555555" :line-width 1))
    ;; (mode-line :box (:color "#999999" :line-width 1 :style released-button))
    ;; (powerline-active1 :box (:color "#999999" :line-width 1 :style released-button)
    ;;                    :background "#5a5a5a")
    ;; (powerline-active2 :box (:color "#999999" :line-width 1 :style released-button))
    ;; (mode-line-inactive :box (:color "#666666" :line-width 1 :style released-button))
    ;; (powerline-inactive1 :box (:color "#666666" :line-width 1 :style released-button))
    ;; (powerline-inactive2 :box (:color "#666666" :line-width 1 :style released-button))

    ;; (helm-prefarg :foreground "PaleGreen")

    ;; Flycheck
    ;; (flycheck-fringe-error :background nil)
    ;; (flycheck-fringe-warning :background nil)
    ;; (flycheck-fringe-info :background nil)

    ;; Other
    ;; (company-tooltip-annotation :foreground "#ff9eb8")
    ;; (company-tooltip-annotation-selection :background "#66d9ef")
    ;; (erc-timestamp-face
    ;;  :inherit font-lock-comment-face :foreground nil)
    ;; (evil-search-highlight-persist-highlight-face
    ;;  :background "#9FCA56" :foreground "#000000")

    ;; (evil-search-highlight-persist-highlight-face
    ;;  :background "#EEB422" :foreground "#000000")

    ;; (font-latex-verbatim-face :inherit nil)
    ;; (helm-ff-prefix :background nil :foreground "#666666" :weight bold)
    ;; (org-done :foreground "MediumSpringGreen")
    ;; (region :background "#998f84")
    ;; (spacemacs-transient-state-title-face :background nil :foreground nil :inherit font-lock-warning-face)
    ;; (term :foreground nil :background nil)

    ;; spacemacs emacs face
    ;; (spacemacs-emacs-face :background "blue" :inherit 'mode-line)
    ;; (spacemacs-insert-face :foreground "#1B1E1C" :background "chartreuse3" :inherit 'modeline)
    ;; (spacemacs-hybrid-face :foreground "#1B1E1C" :background "chartreuse3" :inherit 'modeline)

    ;; My changes
    ;; Watch out for the names of the faces... some have face at the end and some don't
    (evil-search-highlight-persist-highlight-face
     :background "#EEB422" :foreground "#000000")
    (evil-ex-lazy-highlight
     :background "#EEB422" :foreground "#000000")
    (font-lock-comment-face :foreground "#41535B" :slant italic)
    (sp-show-pair-match-face :background "black" :foreground "blue")

    ;; better ivy colors
    (compilation-info :foreground "brightblue") ;; this one was hard to track down... color of the buffer name
    )))
