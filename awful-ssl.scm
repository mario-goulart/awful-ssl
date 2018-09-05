(module awful-ssl (enable-ssl)

(import scheme)
(cond-expand
  (chicken-4
   (import chicken)
   (use tcp openssl awful spiffy))
  (chicken-5
   (import (chicken base)
           (chicken tcp))
   (import awful openssl spiffy))
  (else
   (error "Unsupported CHICKEN version.")))

(define (enable-ssl #!key certificate-file private-key-file)
  (awful-listen ssl-listen)
  (awful-accept ssl-accept)
  (when certificate-file
    (ssl-load-certificate-chain! ((awful-listener)) certificate-file))
  (when private-key-file
    (ssl-load-private-key! ((awful-listener)) private-key-file)))

) ; end module
