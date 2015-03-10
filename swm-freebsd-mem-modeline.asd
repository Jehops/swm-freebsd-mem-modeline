;;;; swm-freebsd-mem-modeline.asd

(asdf:defsystem #:swm-freebsd-mem-modeline
  :description "Show the information about system memory usage in the StumpWM modeline"
  :author "Joseph Mingrone <jrm@ftfl.ca>"
  :license "2-CLAUSE BSD (see COPYRIGHT file for details)"
  :depends-on (#:stumpwm)
  :serial t
  :components ((:file "package")
               (:file "swm-freebsd-mem-modeline")))
