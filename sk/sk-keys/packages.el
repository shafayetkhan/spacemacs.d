(setq sk-keys-packages
      '(company
        company-try-hard
        magit
        dired
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
  (with-eval-after-load 'dired
    (global-set-key (kbd "C-x C-d") 'dired)))


(defun sk-keys/init-company-try-hard ()
  (use-package company-try-hard
    :config
    (define-key evil-hybrid-state-map (kbd "<backtab>") 'company-try-hard)
    )
  )
