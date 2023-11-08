$TTL 300
$ORIGIN mwcosmos.com.

@		SOA ns1.wikitide.net. hostmaster.wikitide.net. (
		20230421000001	; serial
		7200		; refresh
		30M		; retry
		3D		; expire
		900		; ncache
)

; Wildcard services
@		DYNA	geoip!cp
www		DYNA	geoip!cp
; Name servers
@		NS	ns1.wikitide.net.
@		NS	ns2.wikitide.net.

; CAA (issue: letsencrypt.com, iodef: mailto:sre@wikitide.net)
@		TYPE257	\# 22 000569737375656C657473656E63727970742E6F7267
@		TYPE257	\# 31 0005696F6465666D61696C746F3A7372654077696B69666F7267652E6E6574

; Mail exchangers

; Servers

; Services
_acme-challenge.www.mwcosmos.com.	CNAME	www.mwcosmos.com.9b9c355351fcc995.dcv.cloudflare.com.
discord-chatlogs    CNAME       universal-omega.github.io.

; load balancers

; Other
