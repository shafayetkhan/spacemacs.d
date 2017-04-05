(setq sk-keys-packages
      '(company
        company-try-hard
        magit
        dired
        evil
        ))


(defun sk-keys/post-init-company ()
  (with-eval-after-load 'company
    (bb/define-key company-active-map
                   (kbd "C-w") 'evil-delete-backward-word
                   (kbd "C-s") 'company-filter-candidates)))



(defun sk-keys/post-init-magit ()
  (with-eval-after-load 'magit
    ;; (setq magit-display-buffer-function 'magit-display-buffer-traditional)
    (evil-define-key 'normal magit-mode-map (kbd "ESC") nil)
    (evil-define-key 'normal magit-mode-map (kbd "M-j") 'magit-section-forward-sibling)
    (evil-define-key 'normal magit-mode-map (kbd "M-k") 'magit-section-backward-sibling)))

(defun sk-keys/post-init-dired ()
  (use-package dired
    ;; :init
    ;; (bind-key "C-f" 'find-name-dired dired-mode-map)
    :config
    (global-set-key (kbd "C-x C-d") 'dired-jump)
    (bb/define-key dired-mode-map
      (kbd "C-f") 'find-name-dired
      (kbd "C-c C-s") 'find-grep-dired
      (kbd "C-n") 'dired-next-line
      (kbd "C-p") 'dired-previous-line)
    ))


(defun sk-keys/init-company-try-hard ()
  (use-package company-try-hard
    :config
    (define-key evil-hybrid-state-map (kbd "<backtab>") 'company-try-hard)
    )
  )

(defun sk-keys/post-init-evil ()
  (with-eval-after-load 'evil
    (bb/define-key evil-normal-state-map
      (kbd "C-w V") 'split-window-right-and-focus
      (kbd "C-w S") 'split-window-below-and-focus)))
