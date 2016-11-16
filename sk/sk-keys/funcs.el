;; Some utility functions form TheBB

(defun bb/define-key (keymap &rest bindings)
  (declare (indent 1))
  (while bindings
    (define-key keymap (pop bindings) (pop bindings))))

(defun bb/maybe-quit ()
  (interactive)
  (if (cdr (visible-frame-list))
      (call-interactively 'spacemacs/frame-killer)
    (call-interactively 'spacemacs/prompt-kill-emacs)))

(defun bb/save-delete-quit ()
  (interactive)
  (save-buffer)
  (kill-this-buffer)
  (bb/maybe-quit))

(defun sk/layout-quad-grid ()
  "Set the layout to quad grid."
  (interactive)
  (delete-other-windows)
  (save-excursion
   (split-window-right-and-focus)
   (split-window-below)
   (select-window-1)
   (split-window-below)
   (balance-windows)))

(defun sk/search-clear-highlight ()
  "Clear all search highlights"
  (interactive)
  (evil-search-highlight-persist-remove-all)
  (evil-ex-nohighlight))
