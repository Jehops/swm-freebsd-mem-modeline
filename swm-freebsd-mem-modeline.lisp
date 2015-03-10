;; swm-freebsd-mem-modline.lisp
;;
;; Put %u in your modeline format string to show the percetage of system memory
;; used.
;;

(in-package #:swm-freebsd-mem-modeline)

(defvar *mem-stream* nil)
(defvar *mem-percent* "")

(defun set-mem-stream ()
  (setf *mem-stream*
	(sb-ext:process-output
	 (sb-ext:run-program "ml_mem.sh" nil
			     :output :stream
			     :search t
			     :wait nil))))

(defun fmt-freebsd-mem-modeline (ml)
  "Return the precent of system memory used"
  (when (not *mem-stream*)
    (set-mem-stream))
  (when (listen *mem-stream*)
    (setf *mem-percent* (read-line *mem-stream* nil "")))
  (format nil "~a" *mem-percent*))

;; Install formatter
(stumpwm::add-screen-mode-line-formatter #\M #'fmt-freebsd-mem-modeline)
