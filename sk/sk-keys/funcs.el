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

;; Better Defaults from Sanityinc (Steve Purcell)
;; When splitting window, show (other-buffer) in the new window
(defun split-window-func-with-other-buffer (split-function)
  (lexical-let ((s-f split-function))
    (lambda (&optional arg)
      "Split this window and switch to the new window unless ARG is provided."
      (interactive "P")
      (funcall s-f)
      (let ((target-window (next-window)))
        (set-window-buffer target-window (other-buffer))
        (unless arg
          (select-window target-window))))))

(defun sanityinc/toggle-delete-other-windows ()
  "Delete other windows in frame if any, or restore previous window config."
  (interactive)
  (if (and winner-mode
           (equal (selected-window) (next-window)))
      (winner-undo)
    (delete-other-windows)))

;; Rearrange split windows
(defun split-window-horizontally-instead ()
  (interactive)
  (save-excursion
    (delete-other-windows)
    (funcall (split-window-func-with-other-buffer 'split-window-horizontally))))

(defun split-window-vertically-instead ()
  (interactive)
  (save-excursion
    (delete-other-windows)
    (funcall (split-window-func-with-other-buffer 'split-window-vertically))))

  ;; Xah Lee Make Backup of Current File
  (defun xah-make-backup ()
    "Make a backup copy of current file or dired marked files.
If in dired, backup current file or marked files.
The backup file name is
 ‹name›~‹timestamp›~
example:
 file.html~20150721T014457~
in the same dir. If such a file already exist, it's overwritten.
If the current buffer is not associated with a file, nothing's done.
URL `http://ergoemacs.org/emacs/elisp_make-backup.html'
Version 2015-10-14"
    (interactive)
    (let ((ξfname (buffer-file-name)))
      (if ξfname
          (let ((ξbackup-name
                 (concat ξfname "~" (format-time-string "%Y%m%dT%H%M%S") "~")))
            (copy-file ξfname ξbackup-name t)
            (message (concat "Backup saved at: " ξbackup-name)))
        (if (string-equal major-mode "dired-mode")
            (progn
              (mapc (lambda (ξx)
                      (let ((ξbackup-name
                             (concat ξx "~" (format-time-string "%Y%m%dT%H%M%S") "~")))
                        (copy-file ξx ξbackup-name t)))
                    (dired-get-marked-files))
              (message "marked files backed up"))
          (user-error "buffer not file nor dired")))))

(defun xah-make-backup-and-save ()
  "backup of current file and save, or backup dired marked files.
  For detail, see `xah-make-backup'.
  If the current buffer is not associated with a file, nothing's done.
  URL `http://ergoemacs.org/emacs/elisp_make-backup.html'
  Version 2015-10-14"
  (interactive)
  (if (buffer-file-name)
      (progn
        (xah-make-backup)
        (when (buffer-modified-p)
          (save-buffer)))
    (progn
      (xah-make-backup))))
