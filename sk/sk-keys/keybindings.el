(spacemacs/set-leader-keys
  "gE" 'magit-ediff-show-working-tree
  "&"  'async-shell-command
  "V"  'cua-exchange-point-and-mark
  "sc" 'sk/search-clear-highlight
  "w4" 'sk/layout-quad-grid
  "aC" 'calculator
  "qw" 'bb/maybe-quit
  "qf" 'bb/save-delete-quit)


(global-set-key "\C-x2" (split-window-func-with-other-buffer 'split-window-vertically))
(global-set-key "\C-x3" (split-window-func-with-other-buffer 'split-window-horizontally))

(global-set-key "\C-x1" 'sanityinc/toggle-delete-other-windows)

(global-set-key "\C-c|" 'split-window-horizontally-instead)
(global-set-key "\C-c_" 'split-window-vertically-instead)
;; Set keybinding to dedicate current window
(global-set-key (kbd "C-c <down>") 'spacemacs/toggle-current-window-dedication)

;; Make evil-mode up/down operate in screen lines instead of logical lines
(define-key evil-motion-state-map "j" 'evil-next-visual-line)
(define-key evil-motion-state-map (kbd "<down>") 'evil-next-visual-line)
(define-key evil-motion-state-map "k" 'evil-previous-visual-line)
(define-key evil-motion-state-map (kbd "<up>") 'evil-previous-visual-line)
;; Also in visual mode
(define-key evil-visual-state-map "j" 'evil-next-visual-line)
(define-key evil-visual-state-map (kbd "<down>") 'evil-next-visual-line)
(define-key evil-visual-state-map "k" 'evil-previous-visual-line)
(define-key evil-visual-state-map (kbd "<up>") 'evil-previous-visual-line)

(global-set-key (kbd "C-c b") 'xah-make-backup-and-save)

;; replace query-replace with anzu
(global-set-key [remap query-replace] #'anzu-query-replace)
(global-set-key [remap query-replace-regexp] #'anzu-query-replace-regexp)

(global-set-key (kbd "C-z") 'evil-emacs-state)
(global-set-key (kbd "C-c C-f") 'spacemacs/helm-find-files)

;; I use expand region a lot. I like having some emacs keybindings available
;; in hybrid mode
(define-key evil-hybrid-state-map (kbd "C-\\") 'er/expand-region)
