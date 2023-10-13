$TTL 300
$ORIGIN perilous-times.com.

@		SOA ns1.wikiforge.net. hostmaster.wikiforge.net. (
		20230622000001	; serial
		7200		; refresh
		30M		; retry
		3D		; expire
		900		; ncache
)

; Wildcard services
@		A	104.21.36.88

; Name servers
@		NS	ns1.wikiforge.net.
@		NS	ns2.wikiforge.net.

; CAA (issue: letsencrypt.com, iodef: mailto:sre@wikiforge.net)
@		TYPE257	\# 22 000569737375656C657473656E63727970742E6F7267
@		TYPE257	\# 31 0005696F6465666D61696C746F3A7372654077696B69666F7267652E6E6574

; Mail exchangers

; Servers

; Services
www		    A	104.21.36.88.
_acme-challenge.perilous-times.com.	CNAME	perilous-times.com.1d988f2430a9f43d.dcv.cloudflare.com.
_cf-custom-hostname.perilous-times.com	TXT	"21eecdb4-05f5-4ac6-a2a7-fbc79adb70d4"
; load balancers

; Other
