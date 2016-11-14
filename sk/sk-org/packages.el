(setq sk-org-packages '(org))

(defun sk-org/post-init-org ()
  ;; org-capture settings
  ;; Configure org-capture for todos and notes
  (with-eval-after-load 'org
    (setq org-default-notes-file "~/Org/notes.org")
    (global-set-key (kbd "C-c c") 'org-capture)
    (setq org-capture-templates
          `(("t" "todo")
            ("tw" "work" entry (file+headline "~/Org/gtd.org" "Inbox")
             "* JIRA %?\n   SCHEDULED: %(org-insert-time-stamp (org-read-date nil t \"+1d\"))\n%U\n" :clock-resume t :prepend t)
            ("tt" "task" entry (file+headline "~/Org/gtd.org" "Inbox")
             "* NEXT %?\n   SCHEDULED: %(org-insert-time-stamp (org-read-date nil t \"+1d\"))\n%U\n" :clock-resume t :prepend t)
            ("n" "note" entry (file+headline "" "Bank") ; "" => org-default-notes-file
             "* %? :@note:\n%U\n%a\n" :clock-resume t :prepend t)
            ("m" "meeting" entry (file+headline "~/Org/gtd.org" "Meetings")
             "* MEETING with %? :@meeting:\n%U" :clock-in t :clock-resume t :prepend t)
            ))
    ;; Make code in org source block pretty
    (setq org-src-fontify-natively t)
    ;; Set todo keywords sequence
    (setq org-todo-keywords
          (quote ((sequence "TODO(t)" "NEXT(n)" "|" "DONE(d!/!)")
                  (sequence "JIRA(j)" "NEXT(n)" "DOING(i)" "DELEGATED(h@/!)" "|" "DONE(d!/!)" "CANCELLED(c@/!)")
                  (sequence "PROJECT(p)" "|" "DONE(d!/!)" "CANCELLED(c@/!)")
                  (sequence "WAITING(w@/!)" "HOLD(h)" "|" "CANCELLED(c@/!)" "MEETING"))))
    ;; Highlight todo keywords
    (setq org-todo-keyword-faces
          (quote (("NEXT" :inherit warning)
                  ("PROJECT" :inherit font-lock-string-face))))

    ;; My agenda files
    (setq org-agenda-files
          (delq nil
                (mapcar (lambda (x) (and (file-exists-p x) x))
                        '("~/todoist-home.org"
                          "~/Org/notes.org"
                          "~/Org/help/emacs-help.org"
                          "~/Org/help/work-help.org"))))
    )
  )
