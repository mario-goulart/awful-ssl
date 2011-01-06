(module awful-ssl (enable-ssl)

(import chicken scheme)
(use tcp openssl awful spiffy)

(define (enable-ssl #!key certificate-file private-key-file port ip-address)
  (awful-listen ssl-listen)
  (awful-accept ssl-accept)
  (server-port (or port 443))
  (when ip-address (server-bind-address ip-address))
  (when certificate-file
    (ssl-load-certificate-chain! ((awful-listener)) certificate-file))
  (when private-key-file
    (ssl-load-private-key! ((awful-listener)) private-key-file)))

) ; end module
