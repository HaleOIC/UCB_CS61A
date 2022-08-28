#lang sicp
#|
a. Implement get-record, based on a foo x division table. 
   Each division file must have a division func to extrat  
   'type' and provide a instalation package to include  
   specific get-record. The output is a tagged record.
   Get-record must return false if it doesn't find employee record
|#
(define (attach-tag type-tag content) (cons type-tag content))
(define (get-record employee-id file)
  (attach-tag (division file)
              ((get 'get-record (division file)) employee-id file)))
;b.get-salary
(define (get-salary record)
  (let ((record-type (car record)))
    (record-content (cdr record))
    ((get 'get-salary record-type) record-content)))

;c.find-employee-record
(define (find-employee-record employee-id file-list)
  (if (null? file-list)
      false
      (let ((current-file (car file-list)))
        (if (get-record employee-id current-file)
            (get-record employee-id current-file)
            (find-employee-record employee-id (cdr file-list))))))


; d.New company must provide a installation package for its 
;   record-file as new division. This instalation must include 
;   the new division get-record and get-salary implementations.
