(module awful-ssl (enable-ssl)

(import chicken scheme)
(use tcp openssl awful spiffy)

(define (enable-ssl #!key certificate-file private-key-file)
  (awful-listen ssl-listen)
  (awful-accept ssl-accept)
  (when certificate-file
    (ssl-load-certificate-chain! ((awful-listener)) certificate-file))
  (when private-key-file
    (ssl-load-private-key! ((awful-listener)) private-key-file)))

) ; end module
