;;; -*- Mode: LISP; Syntax: Common-lisp; Package: REPRESENTATIONS; Base: 10 -*-
(in-package :reps)

(define-frame block
	(isa (value (square)))
	)

(define-frame construction-site
	(isa (value (physical-location)))
	)
	
(define-frame warehouse
	(isa (value (physical-location)))
	)


; transport blocks from warehouse to construction site
(define-frame transport
	      (isa (value (mop)))
  (actor (value (robot)))
  (object (value (block)))
  (instrumental-scene
    (value 
	     (actor (value =actor))
	     (object (value (hand =r
				  (body-part-of (value =actor)))))
	     (from (value (warehouse
			    (domain (value =r))
			    (co-domain (value (near
						(domain (value =r))
						(co-domain (value =actor))
						))))))
	     (to (value (at-location
			  (domain (value =r))
			  (co-domain (value (construction-site
					      (domain (value =r))
					      (co-domain (value =object))))))))
	     ))
		  
  (main-result (value (construction-site
			(domain (value =object))
			(co-domain (value (block))))))
			
