(defun enumerate-list(num-elems)
  (interactive "nNumber of Elements: ")
  (mapcar (lambda (i) (insert (concat (number-to-string i) ". \n")))
          (number-sequence 1 num-elems)))
(global-set-key (kbd "C-c C-g") 'enumerate-list)


(defun copy-all ()
  (interactive)
  (clipboard-kill-ring-save (point-min) (point-max))
  (message "Copied to clipboard."))
(global-set-key (kbd "C-c C-a") 'copy-all)

;; http://steve.yegge.googlepages.com/my-dot-emacs-file
(defun rename-file-and-buffer (new-name)
  "Renames both current buffer and file it's visiting to NEW-NAME."
  (interactive "sNew name: ")
  (let ((name (buffer-name))
        (filename (buffer-file-name)))
    (if (not filename)
        (message "Buffer '%s' is not visiting a file!" name)
      (if (get-buffer new-name)
          (message "A buffer named '%s' already exists!" new-name)
        (progn
          (rename-file name new-name 1)
          (rename-buffer new-name)
          (set-visited-file-name new-name)
          (set-buffer-modified-p nil))))))
(global-set-key (kbd "C-c C-r") 'rename-file-and-buffer)

;; http://stackoverflow.com/questions/20967818/
(defun sort-lines-nocase()
  (interactive)
  (let ((sort-fold-case t))
    (call-interactively 'sort-lines)))

;; http://www.emacswiki.org/emacs/KillingBuffers#toc2
(defun kill-other-buffers ()
  (interactive)
  (mapc 'kill-buffer (delq (current-buffer) (buffer-list))))
