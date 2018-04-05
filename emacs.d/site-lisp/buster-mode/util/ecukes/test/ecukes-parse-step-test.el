(ert-deftest parse-step-mix-regular-py-string-table ()
  "Should parse a mix of steps in order: regular, py-string, table."
  (with-parse-scenario
   "mix-regular-py-string-table"
   (lambda (scenario name step-names tags)
     (let ((steps (ecukes-scenario-steps scenario)))
       (let* ((step (nth 0 steps))
              (name (ecukes-step-name step))
              (type (ecukes-step-type step))
              (arg (ecukes-step-arg step)))
         (should (equal name "Given a known state"))
         (should (equal type 'regular))
         (should-not arg))
       (let* ((step (nth 1 steps))
              (name (ecukes-step-name step))
              (type (ecukes-step-type step))
              (arg (ecukes-step-arg step)))
         (should (equal name "Given this text:"))
         (should (equal type 'py-string))
         (should (equal arg "Lorem ipsum dolor sit amet.\nCurabitur pellentesque iaculis eros.")))
       (let* ((step (nth 2 steps))
              (name (ecukes-step-name step))
              (type (ecukes-step-type step))
              (arg (ecukes-step-arg step)))
         (should (equal name "Given these meals:"))
         (should (equal type 'table))
         (should (equal arg '(("meal" "price") ("Hamburger" "$4.50")))))))))

(ert-deftest parse-step-mix-py-string-table-regular ()
  "Should parse a mix of steps in order: py-string, table, regular."
  (with-parse-scenario
   "mix-py-string-table-regular"
   (lambda (scenario name step-names tags)
     (let ((steps (ecukes-scenario-steps scenario)))
       (let* ((step (nth 0 steps))
              (name (ecukes-step-name step))
              (type (ecukes-step-type step))
              (arg (ecukes-step-arg step)))
         (should (equal name "Given this text:"))
         (should (equal type 'py-string))
         (should (equal arg "Lorem ipsum dolor sit amet.\nCurabitur pellentesque iaculis eros.")))
       (let* ((step (nth 1 steps))
              (name (ecukes-step-name step))
              (type (ecukes-step-type step))
              (arg (ecukes-step-arg step)))
         (should (equal name "Given these meals:"))
         (should (equal type 'table))
         (should (equal arg '(("meal" "price") ("Hamburger" "$4.50")))))
       (let* ((step (nth 2 steps))
              (name (ecukes-step-name step))
              (type (ecukes-step-type step))
              (arg (ecukes-step-arg step)))
         (should (equal name "Given a known state"))
         (should (equal type 'regular))
         (should-not arg))))))

(ert-deftest parse-step-mix-table-regular-py-string ()
  "Should parse a mix of steps in order: table, regular, py-string."
  (with-parse-scenario
   "mix-table-regular-py-string"
   (lambda (scenario name step-names tags)
     (let ((steps (ecukes-scenario-steps scenario)))
       (let* ((step (nth 0 steps))
              (name (ecukes-step-name step))
              (type (ecukes-step-type step))
              (arg (ecukes-step-arg step)))
         (should (equal name "Given these meals:"))
         (should (equal type 'table))
         (should (equal arg '(("meal" "price") ("Hamburger" "$4.50")))))
       (let* ((step (nth 1 steps))
              (name (ecukes-step-name step))
              (type (ecukes-step-type step))
              (arg (ecukes-step-arg step)))
         (should (equal name "Given a known state"))
         (should (equal type 'regular))
         (should-not arg))
       (let* ((step (nth 2 steps))
              (name (ecukes-step-name step))
              (type (ecukes-step-type step))
              (arg (ecukes-step-arg step)))
         (should (equal name "Given this text:"))
         (should (equal type 'py-string))
         (should (equal arg "Lorem ipsum dolor sit amet.\nCurabitur pellentesque iaculis eros.")))))))